-- 钩子函数在 函数运行中某个特定事件发生时被调用  
--  call  lua调用一个函数
--  return  函数返回
--  line  开始执行一行新代码  调用时第二个参数表示代码行号
--  count 执行完指定数量的指令后产生


local function hook( event,line ) -- event 事件 
	print(event,line)
	local t = debug.getinfo(2)
	for k,v in pairs(t) do
		print(k,v)
	end
	print("===========")
end

local function f(x,y )
	local z = x + y
	print(z)
end

-- debug.sethook(hook,"l") -- 第一个参数 钩子函数 ，第二个要监控的事件 'c''r''l'   ，
-- f(10,100)
-- debug.sethook()
-- f(20,200)




local counters = {}
local names = {}


local function hook( ... )
	local f = debug.getinfo(2,"f").func
	if counters[f] == nil then
		counters[f] = 1
		names[f] = debug.getinfo(2,"Sn")
	else
		counters[f] = counters[f] + 1
	end
end
debug.sethook(hook,"c")
-- debug.sethook()

local function getname( func )
	local n = names[func]
	if n.what == "C" then
		return n.name
	end
	local lc = string.format("[%s]:%s",n.short_src, n.linedefined)
	if n.namewhat ~= "" then
		return string.format("%s (%s)",lc,n.name)
	else
		return lc
	end
end

for func,count in pairs(counters) do
	print(getname(func),count)
end



local function func1( ... )
	print("hello")
end
local function func2( ... )
	for i=1,100 do
		func1()
	end
	
end
local function func3( ... )
	func2()
end
-- func3()
-- debug.sethook()

-- for func,count in pairs(counters) do
-- 	-- print("===============")
-- 	-- for k,v in pairs(names[func]) do
-- 	-- 	print(k,v)
-- 	-- end
-- 	print(getname(func),count)
-- end
