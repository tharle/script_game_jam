local Vector = require("modules/Vector")
local Goal = require("modules/Goal")
local music_example = require("modules/MusicExample")

local sheet_music   = {}
function sheet_music.load(game_ref)
    sheet_music.scr_image   = "assets/mock/game_line_background.png"
    sheet_music.sprite      = love.graphics.newImage(sheet_music.scr_image)
    sheet_music.width       = sheet_music.sprite:getWidth()
    sheet_music.height      = sheet_music.sprite:getHeight()
    sheet_music.position    = Vector:Zero()
    sheet_music.goal        = Vector.new(150, 0)
    sheet_music.music       = music_example.load()
    sheet_music.tunes       = {}
end

function sheet_music.update(dt, timer)
    local next_tune = sheet_music.music.getTune(timer)
    if next_tune then
        print("ADD TUNE TO RUN: "..next_tune.toString())
        table.insert(sheet_music.tunes, next_tune)
    end

    for i=1,#sheet_music.tunes do
        sheet_music.tunes[i].update(dt)
    end
end

function sheet_music.draw()
    love.graphics.draw(sheet_music.sprite, sheet_music.position.x, sheet_music.position.y)
    -- sheet_music.goal.draw()

    for i=1,#sheet_music.tunes do
        sheet_music.tunes[i].draw(dt)
    end
end

return sheet_music