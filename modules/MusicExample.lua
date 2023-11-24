local Tune          = require("modules/Tune")
local TuneType      = require("modules/TuneType")
local music_example = require("modules/music") 


function music_example.load()
    local tunes = {
        Tune.create(TuneType.A, 2), 
        Tune.create(TuneType.A, 5), 
        Tune.create(TuneType.A, 6), 
        Tune.create(TuneType.S, 7), 
        Tune.create(TuneType.SPACE_BAR, 8), 
        Tune.create(TuneType.F, 10), 
        Tune.create(TuneType.F, 11), 
        Tune.create(TuneType.S, 12), 
        Tune.create(TuneType.D, 14), 
        Tune.create(TuneType.A, 19), 
        Tune.create(TuneType.D, 25), 
        Tune.create(TuneType.A, 26), 
    }

    return music_example.create(tunes)
end



return music_example