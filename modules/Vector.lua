local vector = {}

function vector.create(x, y)
    vector.x = x or 0
    vector.y = y or 0
    return clone(vector)
end


-- -------------------------------------------------------------------------
-- CONSTANTS DES VECTORS PRÉDEFINIS
-- -------------------------------------------------------------------------
function vector.Zero()
    -- comentaire
    return vector.create()
end

function vector.Left()
    return vector.create(-1, 0)
end

function vector.Right()
    return vector.create(1, 0)
end

function vector.Up()
    return vector.create(0, -1)
end

function vector.Down()
    return vector.create(0, 1)
end


return vector;