require "wp_emitters"

WPClient = {}
WPClient.wp_commands = {}

WPClient.wp_commands.removeemmiter = function(args)
    printd ("client stopping emitter x: " .. args.x .. " y:" .. args.y .. " z:" .. args.x)
    WPEmmiters.RemoveEmitter(args.x, args.y, args.z)
end

-- main
local onWaterPipesServerCommand = function(module, command, args)
    if WPClient[module] and WPClient[module][command] then
        local argStr = ""
        for k, v in pairs(args) do
            argStr = argStr .. " " .. k .. "=" .. tostring(v)
        end
        printd ("client received " .. module .. "." .. command .. " "  .. argStr)
        WPClient[module][command](args)
    end
end

print ("-------------------------------")
print ("--- waterpipes server ready ---")
print ("-------------------------------")

Events.OnServerCommand.Add(onWaterPipesServerCommand)

--

