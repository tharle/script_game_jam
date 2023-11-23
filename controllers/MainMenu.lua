local GameState = require("modules/GameState")

local main_menu = {}

function main_menu.load()

end

function main_menu.update(dt)
    -- changeState(GameState.GAME_RUN)
end

function main_menu.draw()
    love.graphics.circle("fill", 50, 50, 5)
end

return main_menu