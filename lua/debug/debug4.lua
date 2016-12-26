
local function trace(level)
	local info = debug.getinfo(level)
	local path = info.short_src
	local file = nil
	
	local c1 = string.byte("/")
	local c2 = string.byte("\\")
	local i=string.len(path)
	while i > 0 do
		local c = string.byte(path,i)
		if  c == c1 or c == c2 then
			file = string.sub(path, i+1, string.len(path))
			break
		end
		i = i - 1
	end
	if not file then file = path end
	return file, info.currentline, info.name
end	

local function GLog(format, ...)
	-- file line and function
	local detail = ""
	local src,line,func = trace(4)
	if not func then func = "GLOBAL" end
	
	local content = string.format(format, ...)
	
	-- construct
	--local str = string.format("[%s %s] [%s:%d %s]: %s",time, tag, src, line, func, content)	
	local str = string.format("[%s:%d %s]: %s",src, line, func, content)	
	print(str)
end


local function func1()
	GLog("hello %s","world")
end
local function func2()
	func1()
end
func2()
