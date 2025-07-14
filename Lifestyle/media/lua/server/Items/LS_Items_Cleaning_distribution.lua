--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------

require "Items/ProceduralDistributions"
LSItemsDistribution = LSItemsDistribution or {}

-- Cleaning items distribution
function LSItemsDistribution.Cleaning()
--BarCounterMisc
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 2);

--BathroomCabinet
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, 3);
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, 1);
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, 3);
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, 4);
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, 4);
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["BathroomCabinet"].items, 4);

--BathroomCounter
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, 0.6);
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, 0.8);
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, 0.6);
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, 0.8);
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, 0.6);
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, 1);

--BathroomCounterNoMeds
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, 4);
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, 2);
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, 4);
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, 10);
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["BathroomCounterNoMeds"].items, 10);

--BathroomShelf
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.8);
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.6);
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.8);
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.6);
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.8);
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.8);
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.6);

--BreakRoomCounter
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, 4);
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, 4);
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, 8);
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, 8);

--ClosetShelfGeneric
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, 4);
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, 2);
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, 4);
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, 8);
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, 8);
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["ClosetShelfGeneric"].items, 4);

--CrateCarpentry
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, 0.8);
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, 0.8);
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["CrateCarpentry"].items, 0.8);

--CrateRandomJunk
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.8);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.8);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.6);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.8);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.8);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.8);

--CrateTools
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 3);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 4);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 2);

--DaycareShelves
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 2);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 1);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 2);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 0.5);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 2);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 2);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 1);

--DinerBackRoomCounter
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, 3);
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, 4);
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, 3);
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, 1);
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, 4);
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, 4);
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["DinerBackRoomCounter"].items, 3);

--DishCabinetGeneric
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 6);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 10);
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["DishCabinetGeneric"].items, 4);

--GarageCarpentry
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, 4);
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, 4);
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, 4);
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, 1);
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, 4);
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, 4);
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["GarageCarpentry"].items, 3);

--GarageTools
table.insert(ProceduralDistributions["list"]["GarageTools"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 4);
table.insert(ProceduralDistributions["list"]["GarageTools"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 4);
table.insert(ProceduralDistributions["list"]["GarageTools"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 6);
table.insert(ProceduralDistributions["list"]["GarageTools"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 6);

--GigamartHousewares
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 6);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 6);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 6);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 6);

--GigamartTools
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 4);
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 4);
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 4);
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 2);

--GymLaundry
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, 1);
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, 1);
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, 1);
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, 1);
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, 2);
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, 2);
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["GymLaundry"].items, 1);

--Homesteading
table.insert(ProceduralDistributions["list"]["Homesteading"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["Homesteading"].items, 1);
table.insert(ProceduralDistributions["list"]["Homesteading"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["Homesteading"].items, 2);
table.insert(ProceduralDistributions["list"]["Homesteading"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["Homesteading"].items, 1);
table.insert(ProceduralDistributions["list"]["Homesteading"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["Homesteading"].items, 0.5);
table.insert(ProceduralDistributions["list"]["Homesteading"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["Homesteading"].items, 2);
table.insert(ProceduralDistributions["list"]["Homesteading"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["Homesteading"].items, 3);
table.insert(ProceduralDistributions["list"]["Homesteading"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["Homesteading"].items, 1);

--JanitorTools
table.insert(ProceduralDistributions["list"]["JanitorTools"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["JanitorTools"].items, 10);
table.insert(ProceduralDistributions["list"]["JanitorTools"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["JanitorTools"].items, 10);

--KitchenRandom
table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, 4);
table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, 6);

--LaundryCleaning
table.insert(ProceduralDistributions["list"]["LaundryCleaning"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["LaundryCleaning"].items, 10);

--LaundryHospital
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, 10);
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, "Base.BucketEmpty");
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, 10);
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, 10);
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, "Base.Bleach");
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, 10);
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, "Base.Sponge");
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, 10);
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, "Base.CleaningLiquid2");
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, 10);
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["LaundryHospital"].items, 10);

--OtherGeneric
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, 2);
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, 2);
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["OtherGeneric"].items, 2);

--RandomFiller
table.insert(ProceduralDistributions["list"]["RandomFiller"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["RandomFiller"].items, 2);
table.insert(ProceduralDistributions["list"]["RandomFiller"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["RandomFiller"].items, 2);
table.insert(ProceduralDistributions["list"]["RandomFiller"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["RandomFiller"].items, 2);

--StoreCounterCleaning
table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, "Base.Mop");
table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, 4);
table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, "Base.Broom");
table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, 4);
table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, "Base.Plunger");
table.insert(ProceduralDistributions["list"]["StoreCounterCleaning"].items, 4);

	ItemPickerJava.Parse()
end