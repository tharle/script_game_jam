
tune_type = require("modules/TuneType") -- on laisse le "global" pour TuneType, pour juste charger une fois les sprites des tunes
hit_type = require("modules/HitType")

local sheet_music = require("controllers/SheetMusic")

local game = {}

local cool_down_key_press = 0
local timer_key_press = 0.8

local combo_multipl = 5

function game.load()
    game.timer = 0
    game.score = 0
    game.combo = 0
    sheet_music.load()
end

function game.update(dt)
    if not isStateRun() then return end
    
    game.timer = game.timer + dt
    sheet_music.update(dt, game.timer)

    game.watchKeyboard(dt)
end

function game.watchKeyboard(dt)
    cool_down_key_press = cool_down_key_press + dt
    if cool_down_key_press < timer_key_press then return  end
    local tune_type_pressed = false

    if love.keyboard.isDown(tune_type.A.key) then
        tune_type_pressed = tune_type.A
    elseif love.keyboard.isDown(tune_type.S.key) then
        tune_type_pressed = tune_type.S
    elseif love.keyboard.isDown(tune_type.D.key) then
        tune_type_pressed = tune_type.D
    elseif love.keyboard.isDown(tune_type.F.key) then
        tune_type_pressed = tune_type.F
    elseif love.keyboard.isDown(tune_type.SPACE_BAR.key) then
        tune_type_pressed = tune_type.SPACE_BAR
    end
    
    if tune_type_pressed then 
        cool_down_key_press = cool_down_key_press - timer_key_press
        print("PRESS "..tune_type_pressed.key) 
        game.target_tune(tune_type_pressed)
    end
end

function game.target_tune(tune_type_pressed)
    if sheet_music.tune_in_goal == nil then
        game.combo = 0
        print("MISS")
    elseif sheet_music.tune_in_goal.type ~= tune_type_pressed.type then
        game.combo = 0
        sheet_music.remove_tune_in_goal(false)
        print("MISS")
    elseif sheet_music.tune_in_goal.type == tune_type_pressed.type then
        game.combo = game.combo + 1
        hit_type = sheet_music.remove_tune_in_goal(true)
        game.calcul_score(hit_type)
    end
end

function game.calcul_score(hit_type)
    local score = hit_type.value * math.floor(game.combo/combo_multipl)
    print("ADD "..score.." TO YOUR SCORE")
end

function game.draw()
    love.graphics.circle("fill", 100, 50, 50)
    sheet_music.draw()
end

return game