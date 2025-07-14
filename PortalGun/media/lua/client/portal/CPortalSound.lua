require 'SharedPortalTools'

function Portal.playSoundTeleport()
    getSoundManager():PlaySound("PortalGunTeleport", false, 0.5);
end
function Portal.playSoundCreatePortal()
    getSoundManager():PlaySound("MakePortal", false, 0.5);
end
