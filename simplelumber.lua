function lumber()
	turtle.select(2)
	a,b = turtle.inspect()
	count = 0
	while b["name"] == "minecraft:log" do
		turtle.dig()
		turtle.digUp()
		turtle.up()
		a,b = turtle.inspect()
		count = count + 1
	end
	for i=1,count do
		turtle.down()
	end
	if turtle.getItemCount(2) ~= 0 then
		turtle.turnLeft()
		for i=2,16 do
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

a,b = turtle.inspectDown()
count = 0
if a == false then
	while a == false do
		turtle.down()
		a,b = turtle.inspectDown()
	end
end

a,b = turtle.inspect()
if a == false then
	while b["name"] ~= "minecraft:chest" do
		turtle.turnRight()
		a,b = turtle.inspect()
	end
	turtle.turnRight()
	turtle.select(1)
	turtle.place()
end

while true do
    if turtle.getFuelLevel() < 20 then
        print("LOW FUEL!")
        rs.setOutput("bottom",true)
        break
    else
        lumber()
        planter()
    end
end
