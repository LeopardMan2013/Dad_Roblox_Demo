local enemy = workspace:WaitForChild("Enemy")
local health = enemy:WaitForChild("Health")

local function spawnEssence(position)
	local essence = Instance.new("Part")
	essence.Name = "Essence"
	essence.Size = Vector3.new(2,2,2)
	essence.Color = Color3.fromRGB(170, 0, 255)
	essence.Material = Enum.Material.Neon
	essence.Anchored = true
	essence.Position = position
	essence.Parent = workspace
end

enemy.Touched:Connect(function(hitPart)

	local character = hitPart.Parent
	if not character then
		return
	end

	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return
	end

	health.Value -= 1

	if health.Value <= 0 then
		spawnEssence(enemy.Position + Vector3.new(0,3,0))
		enemy:Destroy()
	end

end)

for _, coin in ipairs(coinsFolder:GetChildren()) do
	if coin:IsA("BasePart") then
		coin.Touched:Connect(function(hitPart)
			onCoinTouched(coin, hitPart)
		end)
	end
end

RunService.Heartbeat:Connect(function(deltaTime)
	for _, coin in ipairs(coinsFolder:GetChildren()) do
		if coin:IsA("BasePart") then
			coin.Orientation += Vector3.new(0, 90 * deltaTime, 0)
		end
	end
end)