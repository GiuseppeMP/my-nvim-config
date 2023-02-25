local function format_any_value(obj, buffer)
    local _type = type(obj)
    if _type == "table" then
        buffer[#buffer + 1] = '{"'
        for key, value in next, obj, nil do
            buffer[#buffer + 1] = tostring(key) .. '":'
            format_any_value(value, buffer)
            buffer[#buffer + 1] = ',"'
        end
        buffer[#buffer] = '}' -- note the overwrite
    elseif _type == "string" then
        buffer[#buffer + 1] = '"' .. obj .. '"'
    elseif _type == "boolean" or _type == "number" then
        buffer[#buffer + 1] = tostring(obj)
    else
        buffer[#buffer + 1] = '"???' .. _type .. '???"'
    end
end

local function  format_as_json(obj)
    if obj == nil then return "null" else
        local buffer = {}
        format_any_value(obj, buffer)
        return table.concat(buffer)
    end
end

return function(obj)
    print(format_as_json(obj))
end
