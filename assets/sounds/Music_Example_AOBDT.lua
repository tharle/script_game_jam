local Tune = require("modules.Tune")
local TuneType = require("modules.TuneType")
local music_example = require("modules.Music")

function music_example.load()
    local tunes = {}




        Tune.new(TuneType.J, 1), 
        Tune.new(TuneType.J, 2), 
        Tune.new(TuneType.J, 3),  
        Tune.new(TuneType.J, 4), 







        for i = 1, 17 do
            table.insert(tunes, Tune.new(TuneType.J, 5)) 
            table.insert(tunes, Tune.new(TuneType.Space, 5)) 
    
            table.insert(tunes, Tune.new(TuneType.J, 5.5)) 
    
            table.insert(tunes, Tune.new(TuneType.J, 6))
            table.insert(tunes, Tune.new(TuneType.D, 6))
            table.insert(tunes, Tune.new(TuneType.Space, 6))
    
            table.insert(tunes, Tune.new(TuneType.J, 6.5))
    
            table.insert(tunes, Tune.new(TuneType.J, 7))
            table.insert(tunes, Tune.new(TuneType.Space, 7))
    
            table.insert(tunes, Tune.new(TuneType.J, 7.5))
    
            table.insert(tunes, Tune.new(TuneType.J, 8))
            table.insert(tunes, Tune.new(TuneType.D, 8))
            table.insert(tunes, Tune.new(TuneType.Space, 8))
    
            table.insert(tunes, Tune.new(TuneType.J, 8.5))
        end

        (tunes, Tune.new(TuneType.J, 75)) 
        (tunes, Tune.new(TuneType.Space, 75)) 

        (tunes, Tune.new(TuneType.J, 75.5)) 

        (tunes, Tune.new(TuneType.J, 76))
        (tunes, Tune.new(TuneType.D, 76))
        (tunes, Tune.new(TuneType.Space, 76))

        (tunes, Tune.new(TuneType.J, 76.5))

        (tunes, Tune.new(TuneType.J, 77)) 
        (tunes, Tune.new(TuneType.Space, 77)) 

        (tunes, Tune.new(TuneType.D, 77.5))
        (tunes, Tune.new(TuneType.D, 78))
        (tunes, Tune.new(TuneType.D, 78.5))
        (tunes, Tune.new(TuneType.J, 79))
        (tunes, Tune.new(TuneType.D, 79))
        (tunes, Tune.new(TuneType.Space, 79))
        (tunes, Tune.new(TuneType.Space, 79.5))







    
        return music_example.create(tunes)
    end
    
    return music_example
