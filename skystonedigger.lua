while true do
	a,b = turtle.inspectDown()
	if b["name"] ~= "appliedenergistics2:tile.BlockSkyStone" then
		break
	end
	turtle.dig()
	turtle.digDown()
	turtle.down()
	turtle.dig()
end  
