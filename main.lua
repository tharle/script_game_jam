---------------------------------------------------------------
--  LOAD
---------------------------------------------------------------

require("libs/Clone") -- Lib pour clone table

GameState = require("modules/GameState")
local main_menu = require("controllers/MainMenu")
local game = require("controllers/Game")
local gameOver_menu = require("controllers/GameOverScreen")
local gameWon_menu = require("controllers/WonScreen")

local game_state = GameState.MAIN_MENU 

mode_debug = false

function  love.load()
    main_menu.load()
    gameOver_menu.load()
    gameWon_menu.load()
    startGame()
end

function startGame()
   -- game.load()
end

---------------------------------------------------------------
--  UPDATE
---------------------------------------------------------------
function love.update(dt)
    game.update(dt) 

    if isStateMenu() then
        main_menu.update(dt)
    elseif isStateGameOver() then
        gameOver_menu.update(dt)
    elseif isStateGameWon() then
        gameWon_menu.update(dt);
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

function isStateGameWon()
    return game_state ==  GameState.GAME_WON;
end

function changeState(state)
    if state == GameState.GAME_RUN then
        game.load()
    end

    game_state = state
end

---------------------------------------------------------------
--  DRAW
---------------------------------------------------------------
function love.draw()
    if isStateMenu() then
        main_menu.draw()
    elseif isStateRun() then
        game.draw()
    elseif isStateGameOver() then
        gameOver_menu.draw()
    elseif isStateGameWon() then
        gameWon_menu.draw()
    end

end