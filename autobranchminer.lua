--autobranchminer
--select 1 is torch storage


function forwarder()
	flag = true
	while flag do
		if turtle.forward() then
			turtle.digDown()
			flag = false
		else
			turtle.dig()
		end
	end
end

function torchPlacer()
	flag = true
	turtle.select(1)
	while flag do
		if turtle.placeDown() then
			flag = false
		else
			turtle.digDown()
		end
	end
end

function oneminer(length)
	turtle.digDown()
	for i=1,length do
		forwarder()
		if i%4 == 0 then
			torchPlacer()
		end
	end
	for i=1,length do
		turtle.back()
	end
end

function lr_work(lr)
	if lr == "right" then
		turtle.turnRight()
		forwarder()
		forwarder()
		turtle.turnLeft()
	elseif lr == "left" then
		turtle.turnLeft()
		forwarder()
		forwarder()
		turtle.turnRight()
	end
end

function miner(length,many,lr)
	oneminer(length)
	lr_work(lr)
	for i=1,many-1 do
		oneminer(length)
		if many-1 == i then
			break
		end
		lr_work(lr)
	end
end

args = {...}
if table.getn(args) == 3 then
	length = tonumber(args[1])
	many = tonumber(args[2])
	lr = args[3]
	miner(length,many,lr)
else
	print("autobranchminer <length> <many> <right or left>")
end
