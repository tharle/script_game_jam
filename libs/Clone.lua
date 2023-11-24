-- https://gist.github.com/tylerneylon/81333721109155b2d244
function clone(obj)
    if type(obj) ~= 'table' then return obj end
    local res = {}
    for k, v in pairs(obj) do res[clone(k)] = clone(v) end
    return res
end