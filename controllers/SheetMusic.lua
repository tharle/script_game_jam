local Vector = require("modules/Vector")
local Goal = require("modules/Goal")
local music_example = require("modules/MusicExample")

local sheet_music   = {}
local time_check_goal_tune = 0.05
local elapsy_check_goal_tune = 0
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
end

function sheet_music.update(dt, timer)
    local next_tune = sheet_music.music.getTune(timer)
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
    print("checkTuneOutGoal: ")
    if #sheet_music.run_tunes == 0 then return end

    local next_tune = sheet_music.run_tunes[1]
    if not sheet_music.goal.checkTuneInGoal(sheet_music.tune_in_goal) then
        print("MISS TUNE: "..sheet_music.tune_in_goal:toString())
        sheet_music.remove_tune_in_goal(false)
    end
end

function sheet_music.checkNextTuneGoal()
    if #sheet_music.run_tunes == 0 then return end
    
    local next_tune = sheet_music.run_tunes[1]
    
    if sheet_music.goal.checkTuneInGoal(next_tune) then
        sheet_music.tune_in_goal = next_tune
    end
end

function sheet_music.remove_tune_in_goal(is_was_a_hit)
    -- TODO maybe faire une animation de miss
    sheet_music.tune_in_goal = nil
    table.remove(sheet_music.run_tunes, 1)

    if is_was_a_hit then 
        return sheet_music.goal.get_hit_type(tune)
    end
end

function sheet_music.draw()
    love.graphics.draw(sheet_music.sprite, sheet_music.position.x, sheet_music.position.y)
    
    for i=1,#sheet_music.run_tunes do
        sheet_music.run_tunes[i]:draw(dt)
    end
    
    sheet_music.goal.draw()
end

return sheet_music