local Paralax = require("modules.Paralax")
local Vector = require("modules.Vector")

local GameHud = {}
local game;
function GameHud.load(game_ref)
    game = game_ref
    GameHud.velocity = 75;
    GameHud.background = Paralax.new("assets/background/background_paralax.png", Vector:Zero(), Vector:Right(), GameHud.velocity) 
end

function GameHud.update(dt)
    GameHud.background.velocity = GameHud.velocity * game.comboModifier()
    GameHud.background:update(dt)
end

function GameHud.draw()
    GameHud.background:draw()
end



return GameHud;