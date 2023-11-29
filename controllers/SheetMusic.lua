local Vector = require("modules/Vector")
local Goal = require("modules/Goal")
local music_example = require("modules/MusicExample")

local sheet_music   = {}
local time_check_goal_tune = 0.05
local elapsy_check_goal_tune = 0
local game;
function sheet_music.load(game_ref)
    sheet_music.scr_image       = "assets/mock/game_line_background.png"
    sheet_music.sprite          = love.graphics.newImage(sheet_music.scr_image)
    sheet_music.width           = sheet_music.sprite:getWidth()
    sheet_music.height          = sheet_music.sprite:getHeight()
    sheet_music.position        = Vector:Zero()
    sheet_music.goal            = Goal.create(Vector.new(150, 0))
    sheet_music.music           = music_example.load()
    sheet_music.run_tunes       = {}
    sheet_music.tune_in_goal    = nil

    game = game_ref
end

function sheet_music.update(dt)
    local next_tune = sheet_music.music.getTune(game.timer)
    if next_tune then
        table.insert(sheet_music.run_tunes, next_tune)
    end
    
    
    for i=1,#sheet_music.run_tunes do
        sheet_music.run_tunes[i]:update(dt)
    end
    
    elapsy_check_goal_tune = elapsy_check_goal_tune + dt
    if elapsy_check_goal_tune >=  time_check_goal_tune then
        elapsy_check_goal_tune = elapsy_check_goal_tune - time_check_goal_tune
        sheet_music.checkTuneInGoal()
    end


    -- print(#sheet_music.run_tunes)
    -- print(#sheet_music.music.tunes)
    if #sheet_music.run_tunes == 0 and sheet_music.music.isEmpty() then
        game.gameOver()
    end
end

function sheet_music.checkTuneInGoal()
    if sheet_music.tune_in_goal ~= nil then
        sheet_music.checkTuneOutGoal()
    end
    
    if sheet_music.tune_in_goal == nil then
        sheet_music.checkNextTuneGoal()
    end
end

function sheet_music.checkTuneOutGoal()
    if #sheet_music.run_tunes == 0 then return end

    local next_tune = sheet_music.run_tunes[1]
    if not sheet_music.goal.checkTuneInGoal(sheet_music.tune_in_goal) then        
        sheet_music.removeTuneInGoal(false)
        game.miss()
    end
end

function sheet_music.checkNextTuneGoal()
    if #sheet_music.run_tunes == 0 then return end
    
    local next_tune = sheet_music.run_tunes[1]
    
    if sheet_music.goal.checkTuneInGoal(next_tune) then
        sheet_music.tune_in_goal = next_tune
    end
end

function sheet_music.removeTuneInGoal(is_was_a_hit)
    -- TODO maybe faire une animation de miss
    local hit_type
    if is_was_a_hit then 
        hit_type = sheet_music.goal.getHitType(sheet_music.tune_in_goal)
    end

    sheet_music.tune_in_goal = nil
    table.remove(sheet_music.run_tunes, 1)

    return hit_type

end

function sheet_music.draw()
    love.graphics.draw(sheet_music.sprite, sheet_music.position.x, sheet_music.position.y)
    
    for i=1,#sheet_music.run_tunes do
        sheet_music.run_tunes[i]:draw()
    end
    
    sheet_music.goal.draw()
end

return sheet_music