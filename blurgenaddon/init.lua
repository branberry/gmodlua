AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_phx/construct/metal_tube.mdl") 
    self:PhysicsInit(SOLID_VPHYSICS) -- default physics
    self:SetMoveType(MOVETYPE_VPHYSICS) --default movetype
    self:SetSolid(SOLID_VPHYSICS) --default solid
end
