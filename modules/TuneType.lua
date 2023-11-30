
local function create_tune_type(id, scr_image, key_low_case, color, sound)
    local sprite = love.graphics.newImage(scr_image);
    local tune_type_new = {
        id          = id,
        key         = key_low_case,
        src_image   = scr_image,
        sprite      = sprite,
        width       = sprite:getWidth(),
        height      = sprite:getHeight(),
        color       = color,
        sound       = sound
    }

    return tune_type_new
end

local tune_type = {
    E           = create_tune_type(1, "assets/mock/game_tune_e.png", "e", {1, 0.6, 0.6}, love.audio.newSource("assets/sounds/CRASH_E.wav", "static")),
    J           = create_tune_type(2, "assets/mock/game_tune_j.png", "j", {0.8, 1, 1}, love.audio.newSource("assets/sounds/HIHAT_J.wav", "static")),
    D           = create_tune_type(3, "assets/mock/game_tune_d.png", "d", {1, 0.7, 0.4}, love.audio.newSource("assets/sounds/SNARE_D.wav", "static")),
    F           = create_tune_type(4, "assets/mock/game_tune_f.png", "f", {0, 0, 1}, love.audio.newSource("assets/sounds/SNARE_D.wav", "static")),
    SPACE_BAR   = create_tune_type(5, "assets/mock/game_tune_space_bar.png", "space", {0.8, 0.8, 0.8}, love.audio.newSource("assets/sounds/BASSDRUM_SPACE.wav", "static")),
}

return tune_type