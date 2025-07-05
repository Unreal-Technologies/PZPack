
require("MDFT_CharacterCreationProfession")
require("ISCharacterScreen")

ISCharacterScreen = ISCharacterScreen or {}

render_old = ISCharacterScreen.render;
loadTraits_old = ISCharacterScreen.loadTraits;


ISCharacterScreen.loadTraits = function(self)
    for _,image in ipairs(self.traits) do
		self:removeChild(image)
	end
	table.wipe(self.traits);
	self:setDisplayedTraits()
	for _,trait in ipairs(self.displayedTraits) do
		local textImage = ISImage:new(0, 0, trait:getTexture():getWidthOrig(), trait:getTexture():getHeightOrig(), trait:getTexture());
		textImage:initialise();

		local setMouseOverText = trait:getLabel() .. getText(" : <br>") .. trait:getDescription();
		setMouseOverText = MDFT.addDescriptionToTooltip(trait, setMouseOverText)
		textImage:setMouseOverText(setMouseOverText)

		textImage:setVisible(false);
		textImage.trait = trait;
		self:addChild(textImage);
		table.insert(self.traits, textImage);
	end
	self.Strength = self.char:getPerkLevel(Perks.Strength)
	self.Fitness = self.char:getPerkLevel(Perks.Fitness)
end



ISCharacterScreen.render = function(self)
    render_old(self);
    if self.profImage and self.profession and self.professionDescription then
        self.profImage:setMouseOverText(self.profession .. getText(" : <br>") .. self.professionDescription);
    end 
end

ISCharacterScreen.loadProfession = function(self)
	self.professionTexture = nil;
	self.profession = nil;
	self.professionDescription = nil;
	if self.char:getDescriptor() and self.char:getDescriptor():getProfession() then
		local prof = ProfessionFactory.getProfession(self.char:getDescriptor():getProfession());
		if prof then
			self.profession = prof:getName();
			self.professionDescription = MDFT.addDescriptionToTooltip(prof, prof:getDescription());

			self.professionTexture = prof:getTexture();
		end
	end
end