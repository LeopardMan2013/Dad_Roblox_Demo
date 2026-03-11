local Players = game:GetService("Players")

local essence = workspace:WaitForChild("Essence")

local function onTouched(hitPart)
	local character = hitPart.Parent
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
		end
	end

	essence:Destroy()
end

essence.Touched:Connect(onTouched)