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
    
    for i=1,10 do
        local repeat_tune = (i - 1) * 5.8
        table.insert(tunes, Tune.new(TuneType.J, 3 + repeat_tune)) 
        table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 3.3+ repeat_tune)) 

        table.insert(tunes, Tune.new(TuneType.J, 3.8+ repeat_tune)) 

        table.insert(tunes, Tune.new(TuneType.J,4.1+ repeat_tune))
        table.insert(tunes, Tune.new(TuneType.D, 4.9+ repeat_tune))
        table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 5.3+ repeat_tune))

        table.insert(tunes, Tune.new(TuneType.J, 5.5+ repeat_tune))

        table.insert(tunes, Tune.new(TuneType.J, 6+ repeat_tune))
        table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 6.5+ repeat_tune))

        table.insert(tunes, Tune.new(TuneType.J, 7+ repeat_tune))

        table.insert(tunes, Tune.new(TuneType.J, 7.4+ repeat_tune))
        table.insert(tunes, Tune.new(TuneType.D, 7.8+ repeat_tune))
        table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 8+ repeat_tune))

        table.insert(tunes, Tune.new(TuneType.J, 8.5+ repeat_tune))
    end

    table.insert(tunes, Tune.new(TuneType.J, 65)) 
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 65.5)) 

    table.insert(tunes, Tune.new(TuneType.J, 65.8)) 

    table.insert(tunes, Tune.new(TuneType.J, 66))
    table.insert(tunes, Tune.new(TuneType.D, 67))
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 67.5))

    table.insert(tunes, Tune.new(TuneType.J, 68))

    table.insert(tunes, Tune.new(TuneType.J, 68.5)) 
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 69)) 

    table.insert(tunes, Tune.new(TuneType.D, 69.4))
    table.insert(tunes, Tune.new(TuneType.D, 69.7))
    table.insert(tunes, Tune.new(TuneType.D, 70))
    table.insert(tunes, Tune.new(TuneType.J, 71))
    table.insert(tunes, Tune.new(TuneType.D, 71.4))
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 71.8))
    table.insert(tunes, Tune.new(TuneType.SPACE_BAR, 74))
    table.insert(tunes, Tune.new(TuneType.D, 75))


    
    return music.create(tunes, love.audio.newSource("assets/sounds/Queen_-_Another_One_Bites_the_Dust_-_Drumless.mp3", "stream"))
end

return music