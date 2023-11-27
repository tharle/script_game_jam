
local function create_tune_type(id, scr_image, key_low_case)
    local sprite = love.graphics.newImage(scr_image);
    local tune_type_new = {
        id        = id,
        key      = key_low_case,
        src_image = scr_image,
        sprite    = sprite,
        width     = sprite:getWidth(),
        height    = sprite:getHeight()
    }

    return tune_type_new
end

local tune_type = {
    A           = create_tune_type(1, "assets/mock/game_tune_a.png", "a"),
    S           = create_tune_type(2, "assets/mock/game_tune_s.png", "s"),
    D           = create_tune_type(3, "assets/mock/game_tune_d.png", "d"),
    F           = create_tune_type(4, "assets/mock/game_tune_f.png", "f"),
    SPACE_BAR   = create_tune_type(5, "assets/mock/game_tune_space_bar.png", " "),
}

return tune_type