local music = {}

function music.create(tunes)
    music.tunes = tunes

    return clone(music)
end

-- @param tune (type: Tune)
function music.addTune(tune)
    table.insert(music.tunes, tune)
end


function music.getTune(time)
    if not music.isEmpty() then 
        local tune = music.tunes[1]

        if tune.time <= time then
            return table.remove(music.tunes, 1)
        end
    end

    return false
end

function music.isEmpty()
    return #music.tunes == 0
end


return music