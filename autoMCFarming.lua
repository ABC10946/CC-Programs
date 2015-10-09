-- autoMCFarming.lua

function checkGlow()
	bool,data = turtle.inspectDown()
	if bool then
		if data.metadata == 7 then
			return 1
		elseif metadata ~= 7 then
			return 0
		end
	else
		return -1
	end
end

function harvester(value)
	if value == 1 then
		turtle.digDown()
		return 1
	else
		return 0
	end
end

function planter(value)
	if value == -1 and turtle.getItemCount(1) > 1 then
		turtle.placeDown()
		return 1
	else 
		return 0
	end
end

function main()
	for i=1,4,1 do
		for i=1,2,1 do
			turtle.forward()
			harvester(checkGlow())
			planter(checkGlow())
		end
		turtle.turnLeft()
	end
end

while true do
	if rs.getInput("back") == false then
		print("please turn on redstone signal from back")
		break
	end
	main()
	for i=2,16,1 do
		turtle.select(i)
		turtle.dropUp(64 - turtle.getItemSpace(i))
	end
	turtle.select(1)
	os.sleep(900)
end
