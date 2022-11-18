getgenv().handler = { built_in_commands = {} }
getgenv().console = { metadata = { default_color = 37 } }
getgenv().rrkit_sdk = { version = "1.0-release" }

function console.print(text, colorcode)
    local text = text or ""
    local colorcode = colorcode or console.metadata.default_color
    rconsoleprint("\27[" .. tostring(colorcode) .. "m" .. tostring(text) .. "\27[0m\n")
end

function console.clear()
    rconsoleprint("\27[0m")
    rconsoleclear()
end

function console.error(text)
    rconsoleprint("\27[31m" .. tostring(text) .. "\27[0m\n")
end

function console.success(text)
    rconsoleprint("\27[32m" .. tostring(text) .. "\27[0m\n")
end

function console.set(name, sdk)
    if name and not sdk then
        rconsolename(tostring(name))
    end

    if name and sdk then
        rconsolename(tostring(name) .. " - SDK Version: " .. rrkit_sdk.version)
    end
end

function handler:add(command, callback)
    local success, err = pcall(function()
        handler.built_in_commands[string.lower(tostring(command))] = callback
    end)

    if not success and err then
        console.error(err)
    end
end

function handler:request(request)
    local request = request or ""
    local commandRequest = request:lower():split(" ")

    for command,_ in pairs(handler.built_in_commands) do
        if (command == commandRequest[1]) then
            local success, err = pcall(function()
                handler.built_in_commands[commandRequest[1]](commandRequest[2] or nil, commandRequest[3] or nil, commandRequest[4] or nil)
            end)
            
            if not success and err then
                console.error(err)
            end
        else
            console.error("Sorry '" .. commandRequest[1] .. "' is not a command!")
        end
    end

    local input = rconsoleinput()
    handler:request(input)
end

function rrkit_sdk:terminate()
    getgenv().handler = nil
    getgenv().console = nil
    getgenv().rrkit_sdk = nil
end
