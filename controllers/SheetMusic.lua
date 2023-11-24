local Vector = require("modules/Vector")
local Goal = require("modules/Goal")
local music_example = require("modules/MusicExample")

local sheet_music = {}

function sheet_music.load()
    sheet_music.scr_image   = "assets/mock/game_line_background.png"
    sheet_music.sprite      = love.graphics.newImage(sheet_music.scr_image)
    sheet_music.width       = sheet_music.sprite:getWidth()
    sheet_music.height      = sheet_music.sprite:getHeight()
    sheet_music.position    = Vector.Zero()
    sheet_music.goal        = Goal.create(Vector.create(150, 0))
    sheet_music.music       = music_example.load()
end

function sheet_music.update(dt)
end

function sheet_music.draw()
    love.graphics.draw(sheet_music.sprite, sheet_music.position.x, sheet_music.position.y)
    sheet_music.goal.draw()
end

return sheet_music