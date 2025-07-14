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

-- Item distribution
function LSItemsDistribution.Books()
	if SandboxVars.Text.DividerMusicNew then
--BOOKSTORES
--Books
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 1);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 1);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 0.8);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 0.6);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 0.4);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 1);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 1);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 0.8);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 0.6);
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 0.4);

--CLASSROOM DESK
--Magazines and special books
table.insert(ProceduralDistributions.list.ClassroomDesk.items, "Lifestyle.SheetMusicBook");
table.insert(ProceduralDistributions.list.ClassroomDesk.items, 1);

--CLASSROOM MISC
--Books
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.6);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.4);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.2);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.6);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.4);
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.2);
--Magazines and special books
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.SheetMusicBook");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.2);

--CLASSROOM SHELVES
--Books
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.6);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.4);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.2);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.8);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.6);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.4);
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.2);
--Magazines and special books
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.SheetMusicBook");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.2);

--BOOK CRATE
--Books
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.8);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.8);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.6);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.4);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.2);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.8);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.8);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.6);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.4);
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.2);

--LIBRARY
--Books
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 1);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 1);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 0.8);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 0.6);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 0.4);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 1);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 1);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 0.8);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 0.6);
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 0.4);

--LIVINGROOM SHELVES
--Books
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.02);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.02);
--Magazines and special books
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.SheetMusicBook");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.05);

--LIVINGROOM SHELVES NO VHS
--Books
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.02);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.08);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.05);
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.02);
--Magazines and special books
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.SheetMusicBook");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.05);

--POST OFFICE
--Books
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.08);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.08);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.05);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.05);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.02);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.08);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.08);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.05);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.05);
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.02);

--GENERIC SHELF
--Books
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookMusic1");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.06);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookMusic2");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.06);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookMusic3");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.03);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookMusic4");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.03);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookMusic5");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.01);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookDancing1");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.06);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookDancing2");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.06);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookDancing3");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.03);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookDancing4");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.03);
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.BookDancing5");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.01);
--Magazines and special books
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.SheetMusicBook");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.05);

	end

--BOOKSTORES
--Books

--Magazines
table.insert(ProceduralDistributions.list.BookstoreBooks.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.BookstoreBooks.items, 0.4);

--CLASSROOM DESK
--Magazines and special books
table.insert(ProceduralDistributions.list.ClassroomDesk.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.ClassroomDesk.items, 1);

--CLASSROOM MISC
--Books

--Magazines and special books
table.insert(ProceduralDistributions.list.ClassroomMisc.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.ClassroomMisc.items, 0.2);

--CLASSROOM SHELVES
--Books

--Magazines and special books
table.insert(ProceduralDistributions.list.ClassroomShelves.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.ClassroomShelves.items, 0.2);

--BOOK CRATE
--Books

--Magazines
table.insert(ProceduralDistributions.list.CrateBooks.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.CrateBooks.items, 0.2);

--CRATE MAGAZINES
--Magazines
table.insert(ProceduralDistributions.list.CrateMagazines.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.CrateMagazines.items, 1);

--LIBRARY
--Books

--Magazines
table.insert(ProceduralDistributions.list.LibraryBooks.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.LibraryBooks.items, 0.4);

--LIVINGROOM SHELVES
--Books

--Magazines and special books
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.LivingRoomShelf.items, 0.05);

--LIVINGROOM SHELVES NO VHS
--Books

--Magazines and special books
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.LivingRoomShelfNoTapes.items, 0.05);

--POST OFFICE
--Books

--Magazines
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.PostOfficeBooks.items, 0.05);

--GENERIC SHELF
--Books

--Magazines and special books
table.insert(ProceduralDistributions.list.ShelfGeneric.items, "Lifestyle.LSMagazineEdition1");
table.insert(ProceduralDistributions.list.ShelfGeneric.items, 0.01);

	ItemPickerJava.Parse()
end