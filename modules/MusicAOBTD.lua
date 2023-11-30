local Tune = require("modules.Tune")
local TuneType = require("modules.TuneType")
local music = require("modules.Music")

function music.load()
    local tunes = {
        Tune.new(TuneType.J, 0), 
        Tune.new(TuneType.J, 0.9), 
        Tune.new(TuneType.J, 1.5),  
        Tune.new(TuneType.J, 2)
    }
    

    for i = 1, 17 do
        local reapeat = 3.5 * (i-1)
        table.insert(tunes, Tune.new(TuneType.J, 10 + reapeat)) 
        -- table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 5+ reapeat)) 

        table.insert(tunes, Tune.new(TuneType.J, 5+ reapeat)) 

        table.insert(tunes, Tune.new(TuneType.J,7+ reapeat))
        -- table.insert(tunes, Tune.new(TuneType.D, 6+ reapeat))
        -- table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 6+ reapeat))

        table.insert(tunes, Tune.new(TuneType.J, 8.5+ reapeat))

        --table.insert(tunes, Tune.new(TuneType.J, 7+ reapeat))
        table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 9+ reapeat))

        table.insert(tunes, Tune.new(TuneType.J, 10+ reapeat))

        --table.insert(tunes, Tune.new(TuneType.J, 8+ reapeat))
        table.insert(tunes, Tune.new(TuneType.D, 11+ reapeat))
        --table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 8+ reapeat))

        table.insert(tunes, Tune.new(TuneType.J, 13+ reapeat))
    end

    table.insert(tunes, Tune.new(TuneType.J, 75)) 
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 75)) 

    table.insert(tunes, Tune.new(TuneType.J, 75.5)) 

    table.insert(tunes, Tune.new(TuneType.J, 76))
    table.insert(tunes, Tune.new(TuneType.D, 76))
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 76))

    table.insert(tunes, Tune.new(TuneType.J, 76.5))

    table.insert(tunes, Tune.new(TuneType.J, 77)) 
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 77)) 

    table.insert(tunes, Tune.new(TuneType.D, 77.5))
    table.insert(tunes, Tune.new(TuneType.D, 78))
    table.insert(tunes, Tune.new(TuneType.D, 78.5))
    table.insert(tunes, Tune.new(TuneType.J, 79))
    table.insert(tunes, Tune.new(TuneType.D, 79))
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 79))
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 79.5))
    
    return music.create(tunes, love.audio.newSource("assets/sounds/Queen_-_Another_One_Bites_the_Dust_-_Drumless.mp3", "stream"))
end

return music