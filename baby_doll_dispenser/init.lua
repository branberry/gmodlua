AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include ("shared.lua")

function ENT:Initialize()
    self:setModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if (IsValid(phys)) then
        phys:Wake()
    end

    self:SetHealth(self.BaseHealth)
end

function ENT:SpawnFunction(ply,tr,ClassName)
    -- body
    if(!tr.Hit) then return end

    for k,v in pairs(tr) do
        print(k,v)
    end

    local entCount = ply:GetNWInt(ClassName.."count")

    if(entCount < self.Limit) then
        local spawnPos = ply:GetShootPos() + ply:GetForward() * 80

        self.Owner = ply

        local ent = ents.Create(ClassName)
        ent:SetPos(SpawnPos)
        ent:Spawn()
        ent:Activate()

        ply:SetNWInt(ClassName.."count", entCount + 1)
        return ent
    end
    return
end

function ENT:Use(activator, caller)

end

function ENT:Think()

end
