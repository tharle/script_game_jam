local GameState = require("modules/GameState")

local main_menu = {}


local SCREEN_WIDHT = love.graphics.getWidth()
local SCREEN_HEIGHT = love.graphics.getHeight()


local titleFont = love.graphics.newFont("assets/fonts/Digivolve.otf", SCREEN_WIDHT * 0.13)
local mainFont = love.graphics.newFont("assets/fonts/Kemco.ttf", SCREEN_WIDHT * 0.072)
local smallFont = love.graphics.newFont("assets/fonts/SmallFont.ttf", SCREEN_WIDHT * 0.036)


function main_menu.load()
    InitUIColor()
end




function main_menu.update(dt)

    if(love.keyboard.isDown("return")) then
        changeState(GameState.GAME_RUN)
    end


    UpdateRectangle(dt)
    UpdatePressStart(dt)
end




function main_menu.draw()
    DrawMainMenuUI()
end




-- Update rectangle posX to make type writer effect on Game Information text
initRecPosX = 100
rectanglePosX = 100
local RightScrollSpeed = 300

function UpdateRectangle(dt)

    rectanglePosX = rectanglePosX + RightScrollSpeed * dt

end





-- For flashing the Start Game text 
canDrawStart = true
local startOnElapsed = 0
local startOffElapsed = 0
local startOnDelay = 0.3
local startOffDelay = 0.35
function UpdatePressStart(dt)

    if canDrawStart then
        startOnElapsed = startOnElapsed + 1 * dt
    else
        startOffElapsed = startOffElapsed + 1 * dt
    end

    if startOnElapsed > startOnDelay then
        canDrawStart = false
        startOnElapsed = 0
    elseif startOffElapsed > startOffDelay then
        canDrawStart = true
        startOffElapsed = 0
    end

end

function DrawMainMenuUI()

    love.graphics.setColor(black)
    love.graphics.rectangle("fill", 0, 0, SCREEN_WIDHT, SCREEN_HEIGHT)


    love.graphics.setColor(teal)
    love.graphics.setFont(titleFont)
    love.graphics.print(title, SCREEN_WIDHT * 0.30, SCREEN_HEIGHT * 0.07)
    
    love.graphics.setColor(black)
    love.graphics.rectangle("fill", rectanglePosX, SCREEN_HEIGHT * 0.07, SCREEN_WIDHT, 180)



    love.graphics.setFont(mainFont)
    love.graphics.setColor(white)
    -- love.graphics.print("GAME INFORMATION", SCREEN_WIDHT * 0.33, SCREEN_HEIGHT * 0.33, 0, 0.4)
    love.graphics.setColor(black)
    love.graphics.rectangle("fill", rectanglePosX - 150, SCREEN_HEIGHT * 0.3, SCREEN_WIDHT, SCREEN_HEIGHT * 0.1)




    love.graphics.setColor(white)
    love.graphics.print("------- CONTROLS -------", SCREEN_WIDHT * 0.30, SCREEN_HEIGHT * 0.46, 0, 0.3)

    love.graphics.setColor({1, 0.65, 0})
    love.graphics.print(" - D -", SCREEN_WIDHT * 0.33, SCREEN_HEIGHT * 0.53, 0, 0.25)
    love.graphics.setColor(red)
    love.graphics.print(" - E - ", SCREEN_WIDHT * 0.5, SCREEN_HEIGHT * 0.53, 0, 0.25)
    love.graphics.setColor({0.2, 1, 1})
    love.graphics.print(" - J -", SCREEN_WIDHT * 0.33, SCREEN_HEIGHT * 0.58, 0, 0.25)
    love.graphics.setColor(tune_type.SPACE_BAR.color)
    love.graphics.print(" - SPACE BAR -    ", SCREEN_WIDHT * 0.5, SCREEN_HEIGHT * 0.58, 0, 0.25)


    love.graphics.setColor(white)
    love.graphics.print("------------------------", SCREEN_WIDHT * 0.30, SCREEN_HEIGHT * 0.70, 0, 0.3)
    love.graphics.print("|                      |", SCREEN_WIDHT * 0.26, SCREEN_HEIGHT * 0.83, 0, 0.35)
    
    
    love.graphics.setColor(green)



    if canDrawStart then
        love.graphics.print("  PRESS ENTER TO START  ", SCREEN_WIDHT * 0.26, SCREEN_HEIGHT * 0.83, 0, 0.35)
    end

    love.graphics.setColor(white)
end


function InitUIColor()
    black = {0 / 255, 0 / 255, 0 / 255}
    white = {255 / 255, 255 / 255, 255 / 255}
    red = {220 / 255, 40 / 255, 20 / 255}
    blue = {30 / 255, 50 / 255, 180 / 255}
    teal = {0 / 255, 200 / 255, 200 / 255}
    green = {0/ 255, 255 / 255, 0 /255}
end






return main_menu