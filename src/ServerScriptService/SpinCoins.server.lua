local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local coinsFolder = workspace:WaitForChild("Coins")

local function onCoinTouched(coin, hitPart)
	
    if coin:GetAttribute("Collected") then
	return
end

coin:SetAttribute("Collected", true)local character = hitPart.Parent
	if not character then
		return
	end

	local player = Players:GetPlayerFromCharacter(character)
	if not player then
		return
	end

		local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local coins = leaderstats:FindFirstChild("Coins")
		if coins then
			coins.Value += 1

if coins.Value >= 5 then
	local baseplate = workspace:FindFirstChild("Baseplate")
	if baseplate then
		baseplate.Color = Color3.fromRGB(0, 255, 0)
	end
end
		end
	end

	coin:Destroy()
end

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