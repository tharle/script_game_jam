local GameWon_menu = {}



local  SCREEN_WIDTH = love.graphics.getWidth()
local SCREEN_HEIGHT = love.graphics.getHeight()

local mainFont = love.graphics.newFont("assets/fonts/Kemco.ttf",  SCREEN_WIDTH * 0.072)
local smallFont = love.graphics.newFont("assets/fonts/SmallFont.ttf",  SCREEN_WIDTH * 0.036)



function GameWon_menu.load()
    InitUIColor()
end


function GameWon_menu.update(dt)

    UpdateGameWon_menuUI(dt)

    if canDraw then 
        UpdateRectangle(dt)
    end


    if(love.keyboard.isDown("return")) then
        changeState(GameState.GAME_RUN)
    end
    
    if(love.keyboard.isDown("escape")) then
        love.event.quit("quit")
    end

end




function GameWon_menu.draw()
    DrawGameWon_menuUI()
end


-- Update rectangle posX to make type writer effect on Game Information text
initRecPosX = 100
rectanglePosX = 100
local RightScrollSpeed = 300

function UpdateRectangle(dt)

    rectanglePosX = rectanglePosX + RightScrollSpeed * dt

end




--temp var
highscore = 0
score = 0
-----
-- Constants for the spiral
local initialRadius = SCREEN_WIDTH * 0.5 -- Starting radius, making it smaller
local spiralTime = 2 -- Reduced time for a faster spiral
local elapsedTime = 0 -- Time since the spiral started

-- Constants for the text size
local initialSize = SCREEN_WIDTH * 0.02 -- Starting font size as a fraction of the screen width
local finalSize = SCREEN_WIDTH * 0.13 -- Final font size when the text is centered
local currentSize = initialSize -- The current size of the text

-- Variables for the 'Game Won' text position
local textPosX, textPosY = 0, 0

local spiralDuration = 1.6 -- Time it takes for the spiral to finish
local elapsedTime = 0 -- Time since the spiral started
local spiralLoops = 3 -- Number of loops in the spiral

local endingX = SCREEN_WIDTH / 2
local endingY = 100 -- Ending 100 pixels from the top

function UpdateGameWon_menuUI(dt)
    elapsedTime = elapsedTime + dt
    local progress = math.min(elapsedTime / spiralDuration, 1) -- Progress from 0 to 1

    -- Update the size of the text
    currentSize = initialSize + (finalSize - initialSize) * progress
    titleFont = love.graphics.newFont("assets/fonts/Digivolve.otf", currentSize)

    -- Update the angle for the spiral motion
    local angleIncrement = progress * spiralLoops * 2 * math.pi -- Complete 'spiralLoops' full loops

    -- Calculate the radius for this frame
    local radius = initialRadius * (1 - progress) -- Decrease radius to make the text spiral in

    -- Calculate the position using polar coordinates
    textPosX = endingX + radius * math.cos(angleIncrement)
    textPosY = endingY + radius * math.sin(angleIncrement)

    -- If the spiral has finished, snap the text to the ending point
    if progress == 1 then
        textPosX = endingX
        textPosY = endingY
        canDraw = true
    end
end

canDraw = false

function DrawGameWon_menuUI()
    love.graphics.setColor(black)
    love.graphics.rectangle("fill", 0, 0,  SCREEN_WIDTH, SCREEN_HEIGHT)

    love.graphics.setFont(titleFont)
    love.graphics.setColor(green)

    -- Draw the text centered at its position
    local textWidth = titleFont:getWidth("YOU ROCK !!!")
    local textHeight = titleFont:getHeight()
    love.graphics.print("YOU ROCK !!!", textPosX - textWidth / 2, textPosY - textHeight / 2)

    if canDraw then
        -- Draw the red rectangle here so it comes on top of the text
        love.graphics.setColor(black)
        love.graphics.rectangle("fill", rectanglePosX, SCREEN_HEIGHT * 0.4, SCREEN_WIDTH, 300)

        love.graphics.setColor(white)
        love.graphics.setFont(mainFont)
        love.graphics.print("SCORE: " .. score, SCREEN_WIDTH * 0.40, SCREEN_HEIGHT * 0.43, 0, 0.55)
        love.graphics.print("HIGHSCORE: " .. highscore, SCREEN_WIDTH * 0.35, SCREEN_HEIGHT * 0.54, 0, 0.55)

        love.graphics.setColor(white)
        love.graphics.print("|                  |", SCREEN_WIDTH * 0.30, SCREEN_HEIGHT * 0.75, 0, 0.4)
        love.graphics.print("|                  |", SCREEN_WIDTH * 0.30, SCREEN_HEIGHT * 0.85, 0, 0.4)
        love.graphics.setColor(teal)
        love.graphics.print("   PRESS ENTER TO REPLAY  ", SCREEN_WIDTH * 0.30, SCREEN_HEIGHT * 0.75, 0, 0.3)
        love.graphics.print("   PRESS ESCAPE TO QUIT  ", SCREEN_WIDTH * 0.305, SCREEN_HEIGHT * 0.85, 0, 0.3)
    end
end
function InitUIColor()
    black = {0 / 255, 0 / 255, 0 / 255}
    white = {255 / 255, 255 / 255, 255 / 255}
    red = {220 / 255, 40 / 255, 20 / 255}
    blue = {30 / 255, 50 / 255, 180 / 255}
    teal = {0 / 255, 200 / 255, 200 / 255}
    green = {0/ 255, 255 / 255, 0 /255}
end


return GameWon_menu