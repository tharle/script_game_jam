
tune_type = require("modules/TuneType") -- on laisse le "global" pour TuneType, pour juste charger une fois les sprites des tunes

local sheet_music = require("controllers/SheetMusic")

local game = {}

function game.load()
    game.timer = 0
    sheet_music.load()
end

function game.update(dt)
    game.timer = game.timer + dt
    sheet_music.update(dt, game.timer)
end

function game.draw()
    love.graphics.circle("fill", 100, 50, 50)
    sheet_music.draw()
end

return game