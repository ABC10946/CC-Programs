function lumber()
	turtle.select(2)
	while turtle.compare() do
        turtle.select(3)
		turtle.dig()
		turtle.digUp()
		turtle.up()
        turtle.select(2)
	end

    a,b = turtle.inspectDown()
    while a == false do
        turtle.down()
        a,b = turtle.inspectDown()
    end

	if turtle.getItemCount(3) ~= 0 then
		turtle.turnLeft()
		for i=3,16 do
			turtle.select(i)
			turtle.drop()
		end
		turtle.turnRight()
		turtle.select(2)
	end
end

function planter()
	a,b = turtle.inspect()
	if a == false then
		turtle.select(1)
		turtle.place()
	end
end

-- turtle float when turtle start.
a,b = turtle.inspectDown()
if a == false then
    turtle.up()
    lumber()
end

chestSearchCount = 0
a,b = turtle.inspect()
if a == false then
	while b["name"] ~= "minecraft:chest" and ChestSearchCount < 4 do
		turtle.turnRight()
		a,b = turtle.inspect()
        chestSearchCount = ChestSearchCount + 1
	end
    if chestSearchCount ~= 4 then
        turtle.turnRight()
        turtle.select(1)
        turtle.place()
    else
        print("error:please put chest on turtle's left side.")
    end
end


while true and chestSearchCount ~= 4 do
    if turtle.getFuelLevel() < 20 then
        print("LOW FUEL!")
        rs.setOutput("bottom",true)
        break
    else
        if turtle.getItemCount(2) == 0 then
            print("error:please put log Block on 2 slot.")
            break
        else
            lumber()
            planter()
        end
    end
end
