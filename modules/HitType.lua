
local function create_hit_type(name, value, distance, color)
    local hit_type_new = {
        name        = name,
        value       = value,
        distance    = distance,
        color       = color
    }

    return hit_type_new
end

local hit_type = {
    MISS        = create_hit_type("Miss", 0, -1, {0.2, 1, 1}),
    GOOD        = create_hit_type("Good", 10, -1, {1, 0.2, 1}),
    WELL_DONE   = create_hit_type("Well Done", 20, 30, {1, 0.2, 0.2}),
    PERFECT     = create_hit_type("Perfect", 40, 15, {0.2, 1, 0.2})
}

return hit_type