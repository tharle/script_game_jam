---------------------------------------------------------------
--  LOAD
---------------------------------------------------------------

require("libs/Clone") -- Lib pour clone table

GameState = require("modules/GameState")
local main_menu = require("controllers/MainMenu")
local game = require("controllers/Game")
-- local game_state = GameState.MAIN_MENU
local game_state = GameState.GAME_RUN

mode_debug = false

function  love.load()
    main_menu.load()
    startGame()
end

function startGame()
    game.load()
end

---------------------------------------------------------------
--  UPDATE
---------------------------------------------------------------
function love.update(dt)
    game.update(dt) 

    if isStateMenu() then
        main_menu.update(dt)
    end
end


function isStateRun()
    return game_state ==  GameState.GAME_RUN;
end

function isStateMenu()
    return game_state ==  GameState.MAIN_MENU;
end

function isStateGameOver()
    return game_state ==  GameState.GAME_OVER;
end

function changeState(state)
    game_state = state
end

---------------------------------------------------------------
--  DRAW
---------------------------------------------------------------
function love.draw()
    if isStateMenu() then
        main_menu.draw()
    else
        game.draw()
    end
end