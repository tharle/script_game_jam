
local function create_hit_type(name, value, distance)
    local tune_type_new = {
        name        = name,
        value       = value,
        distance    = distance
    }

    return tune_type_new
end

local hit_tune = {
    GOOD        = create_hit_type("Good", 10, -1),
    WELL_DONE   = create_hit_type("Well Done", 25, 25),
    PERFECT     = create_hit_type("Perfect", 50, 25)
}

return hit_tune