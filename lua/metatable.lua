local tb1 = {a = 1, b = 2}
local tb2 = {a = 1, b = 2}
local tb3 = tb1

if tb1 == tb2 then
     print("tb1 == tb2")
else
     print("tb1 ~= tb2")
end

tb3.a = 3
print(tb1.a)






-- local t1 = 100
-- local t2 = {}
-- setmetatable(t2,{__add=function( ... )
-- 	print("call here")
-- end})
-- local t3 = t1 + t2
-- local mt = getmetatable(100)



-- local t = {a = 100,b = function( ... )
	
-- end}
-- print(t)

-- local mt = {__tostring = function( ... )
-- 	return "{a = 100,b = function( ... )end}"
-- end}
-- setmetatable(t,mt)
-- -- print(t)

-- print(t.c)

-- mt.__index = function(x,x1)
-- 	print(x)
-- 	print(x1)
-- 	return 0
-- end

-- print(t.c)








--[[

local st = getmetatable("Hello World")
for k,v in pairs(st) do
	print(k,v)
end
for k,v in pairs(st.__index) do
	print(k,v)
end


print(getmetatable(10))

local t = { 100}
print(t[1])
print(getmetatable(t))



local meta = {}
setmetatable(t,meta)
meta.__add = function( ... )
	print("add ")
end

-- meta.__metatable="should not here" 
print(getmetatable(t))
-- setmetatable(t,{})
-- local t1 = t
local metatable = getmetatable(t)
for k,v in pairs(metatable) do
	print(k,v)
end


--]]