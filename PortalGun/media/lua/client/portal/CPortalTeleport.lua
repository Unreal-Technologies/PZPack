
require 'SharedPortalTools'

function Portal.updateTeleport(playerObj)
    if not playerObj:isLocalPlayer() or playerObj:isDead() then return end
    Portal.updateTeleportCharacter(playerObj,true)
end

Events.OnPlayerUpdate.Add(Portal.updateTeleport)
