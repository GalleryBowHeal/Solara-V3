-- fps-boost.lua — простой пример: режет тени/эффекты для FPS
for _, v in pairs(workspace:GetDescendants()) do
  if v:IsA("BasePart") then
    v.Material = Enum.Material.SmoothPlastic
  elseif v:IsA("Decal") or v:IsA("Texture") then
    v:Destroy()
  elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
    v.Enabled = false
  end
end
if lighting then
  local l = game:GetService("Lighting")
  l.GlobalShadows = false
  l.FogEnd = 100000
end
print("FPS boost applied")
