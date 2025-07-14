
if isClient() then return end
require 'SharedPortalTools'
require 'Spawner/SSpawn'

Portal.Spawn = Portal.Spawn or {}
Portal.Spawn.SecretMilitaryBase = Portal.Spawn.SecretMilitaryBase or {x=5539,y=12490,z=0,cItem=Portal.PortGun,respawn=true}
Portal.Spawn.LouisVilleHotelLibrary = Portal.Spawn.LouisVilleHotelLibrary or {x=13696,y=1538,z=0,cItem='Base.FakeBook',hItem=Portal.PortGun,rKey='LouisVilleHotelLibrary'}
Portal.Spawn.MallToolStore = Portal.Spawn.MallToolStore or {x=13918,y=5798,z=0,cItem=Portal.PortGun,rKey='MallToolStore'}
Portal.Spawn.SouthPond = Portal.Spawn.SouthPond or {x=4279,y=7289,z=0,sprite='location_community_cemetary_01_30',sItem=Portal.PortGun,rKey='SouthPond'}
Portal.Spawn.MuldraughBakery = Portal.Spawn.MuldraughBakery or {x=10652,y=9923,z=0,cItem='Base.CakeIsALie',hItem=Portal.PortGun,rKey='MuldraughBakery'}

Spawn.addToSpawn(Portal.Spawn.SecretMilitaryBase)
Spawn.addToSpawn(Portal.Spawn.LouisVilleHotelLibrary)
Spawn.addToSpawn(Portal.Spawn.MallToolStore)
Spawn.addToSpawn(Portal.Spawn.SouthPond)
Spawn.addToSpawn(Portal.Spawn.MuldraughBakery)

