local GameState = require("modules/GameState")

local GameOver_menu = {}



local  SCREEN_WIDTH = love.graphics.getWidth()
local SCREEN_HEIGHT = love.graphics.getHeight()

local titleFont = love.graphics.newFont("assets/fonts/Digivolve.otf",  SCREEN_WIDTH * 0.13)
local mainFont = love.graphics.newFont("assets/fonts/Kemco.ttf",  SCREEN_WIDTH * 0.072)
local smallFont = love.graphics.newFont("assets/fonts/SmallFont.ttf",  SCREEN_WIDTH * 0.036)



function GameOver_menu.load()
    InitUIColor()
end


function GameOver_menu.update(dt)

    UpdateGameOverUI(dt)
    UpdateRectangle(dt)


    if(love.keyboard.isDown("return")) then
        changeState(GameState.GAME_RUN)
    end
    
    if(love.keyboard.isDown("escape")) then
        love.event.quit("quit")
    end

end




function GameOver_menu.draw()
    DrawGameOverUI()
end


initRecPosX = 100
rectanglePosX = 100
local RightScrollSpeed = 600

function UpdateRectangle(dt)

    rectanglePosX = rectanglePosX + RightScrollSpeed * dt

end




--temp var
highscore = 0
score = 0
-----

canDrawFinal = false

-- Define the start position off-screen
local gameOverPosX = -200 -- Start off-screen to the left
local gameOverPosY = -100 -- Start off-screen to the top
local angle = math.rad(45) -- 45 degrees angle for initial descent
local speed = 415 -- Speed of the 'Game Over' movement
local gravity = 980 -- Gravity for the arc
local bounceDamping = 0.6 -- Damping factor for each bounce
local bounces = 0 -- Counter for the number of bounces

-- Target position in the middle of the screen
local targetX = SCREEN_WIDTH - 705
local targetY = SCREEN_HEIGHT - 550

-- Velocity components
local velocityX = math.cos(angle) * speed
local velocityY = math.sin(angle) * speed

function UpdateGameOverUI(dt)
    if not canDrawFinal then
        -- Apply gravity to the Y velocity component
        velocityY = velocityY + gravity * dt

        -- Update positions
        gameOverPosX = gameOverPosX + velocityX * dt
        gameOverPosY = gameOverPosY + velocityY * dt

        -- Check for "bounce" when it hits the "ground"
        if gameOverPosY > targetY and velocityY > 0 then
            -- Reverse Y velocity for the bounce, and apply damping
            velocityY = -velocityY * bounceDamping
            bounces = bounces + 1

            -- Reduce the horizontal velocity as well
            velocityX = velocityX * bounceDamping

            -- After a few bounces, stop the movement in the middle
            if bounces > 3 then
                canDrawFinal = true
                gameOverPosX = targetX
                gameOverPosY = targetY
                canDraw = true
            end
        end

        -- Adjust the X position to stop at the middle of the screen
        if (movingLeft and gameOverPosX < targetX) or (not movingLeft and gameOverPosX > targetX) then
            velocityX = 0
            gameOverPosX = targetX

        end
    end
end
canDraw = false

function DrawGameOverUI()

    love.graphics.setColor(black)
    love.graphics.rectangle("fill", 0, 0,  SCREEN_WIDTH, SCREEN_HEIGHT)
    love.graphics.setColor(red)
    love.graphics.setFont(titleFont)
    love.graphics.print("GAME OVER", gameOverPosX, gameOverPosY)    
    

    if canDraw then
        love.graphics.setFont(mainFont)
        love.graphics.setColor(black)
        love.graphics.rectangle("fill", rectanglePosX - 150, SCREEN_HEIGHT * 0.35, SCREEN_WIDTH, SCREEN_HEIGHT * 0.6)
    
        love.graphics.setColor(white)
        love.graphics.print("SCORE: " .. score, SCREEN_WIDTH * 0.40, SCREEN_HEIGHT * 0.43, 0, 0.55)
        love.graphics.print("HIGHSCORE: " .. highscore, SCREEN_WIDTH * 0.35, SCREEN_HEIGHT * 0.54, 0, 0.55)
    
        love.graphics.setColor(white)
        love.graphics.print("|                  |", SCREEN_WIDTH * 0.30, SCREEN_HEIGHT * 0.75, 0, 0.4)
        love.graphics.print("|                  |", SCREEN_WIDTH * 0.30, SCREEN_HEIGHT * 0.85, 0, 0.4)
        love.graphics.setColor(teal)
        love.graphics.print("   PRESS ENTER TO REPLAY  ", SCREEN_WIDTH * 0.30, SCREEN_HEIGHT * 0.75, 0, 0.3)
        love.graphics.print("   PRESS ESCAPE TO QUIT  ", SCREEN_WIDTH * 0.305, SCREEN_HEIGHT * 0.85, 0, 0.3)
        love.graphics.setColor(white)
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


return GameOver_menu