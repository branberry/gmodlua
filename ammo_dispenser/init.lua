AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Intialize()
    self:SetModel("models/props_lab/reciever_cart.mdl") -- not sure if spelling is correct yet
    self:PhysicsInit(SOLID_VPHYSICS) -- default physics
    self:SetMoveType(MOVETYPE_VPHYSICS) --default movetype
    self:SetSolid(SOLID_VPHYSICS) --default solid

    local phys = self:GetPhysicsObject() -- returns physics object set for ammo dispenser

    if(IsValid(phys)) then
        phys:Wake() --activates the physics
    end
end

function ENT:SpawnFunction(ply,tr, ClassName)
    if(!tr.Hit) then return end  -- makes sure that player must be looking at a surface near by for entity to spawn

    local SpawnPos = ply:GetShootPos() + ply:GetForward() * 80

    local ent = ents.Create(ClassName)
    ent:SetPos(SpawnPos)
    ent:Spawn()
    ent:Activate()

    return ent
end

function ENT:Use(activator, caller)
-- called whenever a player uses the entity; when they press E
end

function ENT:Think()
-- Called every tick
end
