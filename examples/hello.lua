-- hello.lua — smoke-test SolaraV3
-- Вставь в редактор Solara и нажми Execute
print("SolaraV3 OK | " .. os.date("%Y-%m-%d %H:%M:%S"))
if game and game:GetService("Players") then
  local p = game:GetService("Players").LocalPlayer
  if p then print("LocalPlayer: " .. p.Name) end
end
-- если видишь это в консоли / notification — inject работает
