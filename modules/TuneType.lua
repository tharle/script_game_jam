
local function create_tune_type(id, scr_image, name)
    local sprite = love.graphics.newImage(scr_image);
    local tune_type_new = {
        id        = id,
        name      = name,
        src_image = scr_image,
        sprite    = sprite,
        width     = sprite:getWidth(),
        height    = sprite:getHeight()
    }

    return tune_type_new
end

local tune_type = {
    A           = create_tune_type(1, "assets/mock/game_tune_a.png", "A"),
    S           = create_tune_type(2, "assets/mock/game_tune_s.png", "S"),
    D           = create_tune_type(3, "assets/mock/game_tune_d.png", "D"),
    F           = create_tune_type(4, "assets/mock/game_tune_f.png", "F"),
    SPACE_BAR   = create_tune_type(5, "assets/mock/game_tune_space_bar.png", "Space bar"),
}

return tune_type