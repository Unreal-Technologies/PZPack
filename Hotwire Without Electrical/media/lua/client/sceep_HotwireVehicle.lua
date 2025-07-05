-- for the hotwiring action without electrical. Uses the mechanics skills instead for calculation (duration/probability to hotwire)

function ISHotwireVehicle:complete()
    self.character:getVehicle():tryHotwire(self.character:getPerkLevel(Perks.Mechanics));
    return true
end

function ISHotwireVehicle:getDuration()
    if self.character:isTimedActionInstant() then
        return 1
    end
    return 200 - (self.character:getPerkLevel(Perks.Mechanics) * 3);
end