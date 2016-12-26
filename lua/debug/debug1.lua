-- 1、Debug库是一些C API
-- 2、Debug库性能不高，而且会打破一些固有规则，如在函数外访问函数内部创建的局部变量，最终版中不应该调用
-- 3、主要有两部分组成：自省函数 和 钩子 。
--    自省函数允许检查一个正在运行中程序的各个方面，如活动函数栈，当前执行的行，局部变量名和值等。
--    钩子允许跟踪一个程序的执行
-- 4、栈层（stack level） 调用调试库的函数的层是1 ，调用这个函数的函数的层是2



-- test1
-- local function foo( a,b )
-- 	-- 
-- 	local c = a + b
-- 	return c
-- end
-- local info = debug.getinfo(foo)
-- for k,v in pairs(info) do
-- 	print(k,v)
-- end

-- source : 函数定义的位置
-- short_src : source的短版本（最多60个字符）
-- linedefined : 该函数定义的源代码中第一行的行号
-- lastlinedefined : 该函数定义的源代码中最后一行的行号
-- what : 函数的类型。如果为普通lua函数应为 Lua,如果是C函数则为C,如果是Lua程序块的主程序部分，则为main
-- name : 该函数的名字
-- namewhat: 上一个字段的含义，可能是 global、local、method、field或"",空串表示没找到该函数的名称
-- nups : 该函数的upvalue的数量
-- activelines: 一个table,包含了该函数的所有活动行的集合。活动行就是含有代码的行，相对于空行或者只包含注释的行
-- func: 函数本身 ， 当函数是C函数时，lua没有关于他的更多信息 只有 name ,namewhat,what 

--====================  test 2
-- local function func1( ... )
-- 	local info = debug.getinfo(2,"Sn")
-- 	for k,v in pairs(info) do
-- 		print(k,v)
-- 	end
-- end
-- local function func2( ... )
-- 	func1()
-- end

-- func2()

-- currentline  当前执行的行

-- 'n' : name 和 namewhat
-- 'f' : func
--'S' : source 、short_src 、what、linedefined、lastlinedefined
-- 'l' : currentline
-- 'L' : activelines
-- 'u' : nups



function traceback( ... )
	for level = 1,math.huge do
		local info = debug.getinfo(level,"Sln")
		if not info then break end
		-- print("============================= \n")
		-- for k,v in pairs(info) do
		-- 	print(k,v)
		-- end
		if info.what == "C" then
			print(level,"C function".. (info.name or "nil"))
		else
			print(string.format("[%s]:%d  %s",info.short_src,info.currentline,info.name or "nil"))
		end
	end
end

local function func1( ... )
	traceback()
end
local function func2( ... )
	func1()
end
local function func3( ... )
	func2()
end
func3()





