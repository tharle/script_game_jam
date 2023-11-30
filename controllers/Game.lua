
tune_type = require("modules.TuneType") -- on laisse le "global" pour TuneType, pour juste charger une fois les sprites des tunes
HitType = require("modules.HitType")

local sheet_music = require("controllers.SheetMusic")
local GameHud = require("modules.GameHud")

local game = {}

local cool_down_key_press = 0
local timer_key_press = 0.2

local combo_multipl = 5

local function saveHiScore()
    local save = game.hi_score
    love.filesystem.write("save_hi_score.data",save)
end

local function loadHiScore()
    if love.filesystem.getInfo("save_hi_score.data") then
        local hi_score = love.filesystem.read("save_hi_score.data")
        return tonumber(hi_score)
    end
end


function game.load()
    game.timer = 0
    game.score = 0
    game.hi_score = loadHiScore() or 0
    game.combo = 0
    game.is_hi_score_broked = false
    game.last_hit = false
    sheet_music.load(game)
    GameHud.load(game)
    loadHiScore()
end

function game.update(dt)
    if not isStateRun() then return end
    
    game.timer = game.timer + dt
    sheet_music.update(dt)
    GameHud.update(dt)

    game.watchKeyboard(dt)
end

function game.watchKeyboard(dt)
    
    local tune_type_pressed = false
    if love.keyboard.isDown(tune_type.E.key) then
        tune_type_pressed = tune_type.E
    elseif love.keyboard.isDown(tune_type.J.key) then
        tune_type_pressed = tune_type.J
    elseif love.keyboard.isDown(tune_type.D.key) then
        tune_type_pressed = tune_type.D
    elseif love.keyboard.isDown(tune_type.F.key) then
        tune_type_pressed = tune_type.F
    elseif love.keyboard.isDown(tune_type.SPACE_BAR.key) then
        tune_type_pressed = tune_type.SPACE_BAR
    end
    
    cool_down_key_press = cool_down_key_press + dt
    if cool_down_key_press >= timer_key_press and tune_type_pressed then 
        cool_down_key_press = 0
        game.target_tune(tune_type_pressed)
    end
end

function game.target_tune(tune_type_pressed)
    if sheet_music.tune_in_goal == nil then
        game.miss()
    elseif sheet_music.tune_in_goal.type.key ~= tune_type_pressed.key then
        game.miss()
        sheet_music.removeTuneInGoal(false)
    elseif sheet_music.tune_in_goal.type.key == tune_type_pressed.key then
        game.combo = game.combo + 1
        sheet_music.tune_in_goal:play()
        GameHud.setFlashLight(sheet_music.tune_in_goal.type.color)
        game.last_hit = sheet_music.removeTuneInGoal(true)
        game.calcul_score(game.last_hit)
    end
end

function game.miss()
    game.combo = 0
    game.last_hit = HitType.MISS
end

function game.comboModifier()
    return math.floor(game.combo/combo_multipl) + 1
end

function game.calcul_score(hit_type)
    local score = hit_type.value * game.comboModifier()
    game.score = game.score + score
    print("COMBO X "..game.combo)
    print(hit_type.name.."!")
    print("ADD: "..score.." TO YOUR SCORE")
    print("TOTAL SCORE: "..game.score)
end

function game.gameOver()
    if game.score > game.hi_score then
        game.is_hi_score_broked = true
        game.hi_score = game.score
        print("HI SCORE!!!!!!!!")
        saveHiScore()
    end
    changeState(GameState.GAME_WON)
end

function game.draw()
    love.graphics.setColor(1, 1, 1, 1);
    GameHud.draw()
    sheet_music.draw()
end

return game