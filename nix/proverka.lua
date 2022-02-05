local http = require 'nix/http'
local username = client.get_username()

function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)

    for each in str:gmatch(regex) do
       table.insert(result, each)
    end

    return result
end

function includes(t, element, is_key)
    for key, value in pairs(t) do
        if is_key and key == element then return true end
        if not is_key and value == element then return true end 
    end

    return false
end

http.get('site', function (s, response)
    if not s or response.status ~= 200 then return end
    
    local whitelist = split(response.body, ' ')

    if includes(whitelist, username) then
        -- есть в вайтлисте
    else
        -- нету в вайтлисте
    end
end)
