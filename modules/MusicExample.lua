local Tune          = require("modules.Tune")
local TuneType      = require("modules.TuneType")
local music_example = require("modules.Music") 


function music_example.load()
    local tunes = {
        Tune.new(TuneType.A, 2), 
        Tune.new(TuneType.A, 5), 
        Tune.new(TuneType.A, 6), 
        Tune.new(TuneType.S, 7), 
        Tune.new(TuneType.SPACE_BAR, 8), 
        Tune.new(TuneType.F, 10), 
        Tune.new(TuneType.F, 11), 
        Tune.new(TuneType.S, 12), 
        Tune.new(TuneType.D, 14), 
        Tune.new(TuneType.A, 19), 
        Tune.new(TuneType.D, 25), 
        Tune.new(TuneType.A, 26)
    }

    return music_example.create(tunes)
end



return music_example