-- ************************************************************************
-- **        ██████  ██████   █████  ██    ██ ███████ ███    ██          **
-- **        ██   ██ ██   ██ ██   ██ ██    ██ ██      ████   ██          **
-- **        ██████  ██████  ███████ ██    ██ █████   ██ ██  ██          **
-- **        ██   ██ ██   ██ ██   ██  ██  ██  ██      ██  ██ ██          **
-- **        ██████  ██   ██ ██   ██   ████   ███████ ██   ████          **
-- ************************************************************************
-- ** All rights reserved. This content is protected by © Copyright law. **
-- ************************************************************************

local group = AttachedLocations.getGroup("Human")
group:getOrCreateLocation("holsterbackb"):setAttachmentName("holster_back_b")

local lowerBack = {
	type = "LowerBack",
	name = "Lower Back",
	animset = "holster right",
	attachments = {
		Holster = "holsterbackb",
	},
}

table.insert(ISHotbarAttachDefinition, lowerBack)