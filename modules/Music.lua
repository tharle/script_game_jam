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
    local tune = music.tunes[0]

    if tune.time == time then
        return table.remove(music.tunes, 0)
    end
end


return music