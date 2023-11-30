local Paralax = require("modules.Paralax")
local Vector = require("modules.Vector")

local  SCREEN_WIDTH = love.graphics.getWidth()
local SCREEN_HEIGHT = love.graphics.getHeight()

local FLASH_LIGHT_TIMER = 0.1
local COLOR_WHITE = {1, 1, 1}
local hitFont = love.graphics.newFont("assets/fonts/Digivolve.otf",  SCREEN_WIDTH * 0.13)
local comboFont = love.graphics.newFont("assets/fonts/Digivolve.otf",  SCREEN_WIDTH * 0.09)
local mainFont = love.graphics.newFont("assets/fonts/Kemco.ttf",  SCREEN_WIDTH * 0.072)

local GameHud = {}
local game;
function GameHud.load(game_ref)
    game = game_ref
    GameHud.velocity = 75;
    GameHud.background = Paralax.new("assets/background/background_paralax.png", Vector:Zero(), Vector:Right(), GameHud.velocity) 
    GameHud.flash_light_color = false
    GameHud.flash_light_timer = 0
end

function GameHud.update(dt)
    GameHud.background.velocity = GameHud.velocity * game.comboModifier()
    GameHud.background:update(dt)

    if GameHud.flash_light_color then 
        GameHud.flash_light_timer = GameHud.flash_light_timer - dt 
        
        if GameHud.flash_light_timer <= 0 then
            GameHud.flash_light_color = false
        end
    end
end

function GameHud.setFlashLight(color)
    GameHud.flash_light_color = color
    GameHud.flash_light_timer = FLASH_LIGHT_TIMER
end

function GameHud.draw()
    GameHud.background:draw()
    GameHud.flashLight()

    if game.last_hit then
        love.graphics.setFont(hitFont)
        love.graphics.setColor(game.last_hit.color)
        love.graphics.print(game.last_hit.name.."!",  20, SCREEN_HEIGHT * 0.4)
    end
    
    if game.combo > 0 then
        love.graphics.setFont(comboFont)
        love.graphics.setColor({1, 1, 0})
        love.graphics.print("Combo x "..game.combo,  20, SCREEN_HEIGHT * 0.6)
    end

    love.graphics.setFont(comboFont)
    love.graphics.setColor(COLOR_WHITE)
    love.graphics.print(math.floor(game.timer),  SCREEN_WIDTH * 0.4, SCREEN_HEIGHT * 0.2, 0, 0.55)
    love.graphics.print("Score: "..string.format("%07d",game.score),  SCREEN_WIDTH * 0.8, SCREEN_HEIGHT * 0.9, 0, 0.25) -- 7
    love.graphics.print("Hi-Score: "..string.format("%07d",game.hi_score),  SCREEN_WIDTH * 0.76, SCREEN_HEIGHT * 0.95, 0, 0.25)
end

function GameHud.flashLight()
    if GameHud.flash_light_color then
        love.graphics.setColor(GameHud.flash_light_color)
        love.graphics.rectangle("fill", 0,0, love.graphics.getWidth(), love.graphics.getHeight())
        love.graphics.setColor(COLOR_WHITE)
    end
end



return GameHud;