require "wp_gmd"
require "wp_utils"
require "wp_vsquare"

WPEmmiters = {}

function WPEmmiters.AddEmitter(x, y, z)
    if isServer() then return end

    local cell = getCell()
    local square = cell:getGridSquare(x, y, z)

    if square then
        local md = square:getModData()
        local emitter = md['wpemitter']

        if emitter then
            printd ("WPEMITTERS: emitter already present")
        else
            printd ("WPEMITTERS: starting new emitter")
            emitter = getWorld():getFreeEmitter(x, y, z)
            emitter:playSoundLooped("WaterPumpLoop")
            emitter:setVolumeAll(0.4)
            md['wpemitter'] = emitter
        end
    end
end

function WPEmmiters.RemoveEmitter(x, y, z)
    if isServer() then return end

    local cell = getCell()
    local square = cell:getGridSquare(x, y, z)

    if square then
        local md = square:getModData()
        local emitter = md['wpemitter']

        if emitter then
            printd ("WPEMITTERS: stopping emitter")
            emitter:stopAll()
            md['wpemitter'] = nil
        else
            printd ("WPEMITTERS: emitter not found")
        end
    end
   
end