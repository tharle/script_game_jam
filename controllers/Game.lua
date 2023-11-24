local game = {}

local sheet_music = require("controllers/SheetMusic")

function game.load()
    sheet_music.load()
end

function game.update(dt)
    sheet_music.update(dt)
end

function game.draw()
    love.graphics.circle("fill", 100, 50, 50)
    sheet_music.draw()
end

return game