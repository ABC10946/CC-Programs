width = 9
depth = 9


function checkgrow()
	a,b = turtle.inspectDown()
	if b["metadata"] == 7 then
		turtle.digDown()
		turtle.placeDown()
	end
end

while true do
	if rs.getInput("back") == false then
		print("please turn on redstone signal from back")
		break
	end

	lr_flag = 0

	for i=0,width-1,1 do
		for i=1,depth-1,1 do
			turtle.forward()
			checkgrow()
		end
		if i ~= width-1 then
			if lr_flag == 0 then
				turtle.turnLeft()
				turtle.forward()
				checkgrow()
				turtle.turnLeft()
				lr_flag = 1
			elseif lr_flag == 1 then
				turtle.turnRight()
				turtle.forward()
				checkgrow()
				turtle.turnRight()
				lr_flag = 0
			end
		end
	end

	turtle.turnRight()
	for i=0,width-2,1 do
		turtle.forward()
	end
	turtle.turnRight()
	for i=1,depth-1,1 do
		turtle.forward()
	end
	
	checkgrow()
	turtle.turnRight()
	turtle.turnRight()

	for i=2,16,1 do
		turtle.select(i)
		turtle.dropUp()
	end
	turtle.select(1)
	os.sleep(1800)
end
