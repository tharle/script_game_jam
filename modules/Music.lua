local music = {}

function music.create(tunes, background_music)
    music.tunes = tunes
    music.background_music = background_music or false
    return clone(music)
end

function music.play()
    if music.background_music and not music.background_music:isPlaying( ) then
        love.audio.play(music.background_music)
    end
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