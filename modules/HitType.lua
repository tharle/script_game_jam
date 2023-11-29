
local function create_hit_type(name, value, distance)
    local hit_type_new = {
        name        = name,
        value       = value,
        distance    = distance
    }

    return hit_type_new
end

local hit_type = {
    GOOD        = create_hit_type("Good", 10, -1),
    WELL_DONE   = create_hit_type("Well Done", 20, 30),
    PERFECT     = create_hit_type("Perfect", 40, 15)
}

return hit_type