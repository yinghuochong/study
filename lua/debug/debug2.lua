-- debug.getlocal(parm1, parm2)
--parm1:希望查询的函数栈层
--parm2:变量的索引


local function func1( a ,b)
	local x 
	do local c = a - b end
	local n = 1
	while true do 
		local name ,value = debug.getlocal(1,n)  -- 局部变量只有初始化过后才可见
		if not name then break end
		print(name,value)
		n = n + 1 
		-- debug.setlocal(1,3,100)
	end
end

-- func1(10,20)



function getvarvalue( name )
	local value ,found
	-- 尝试 局部变量
	for i=1,math.huge do

		-- print(i)
		local n ,v = debug.getlocal(2,i)
		-- print(11,n,v)
		if not n then break end
		if n == name then
			value = v
			found = true
		end
	end
	if found then return value end
	--尝试 upvalue
	local t = debug.getinfo(2,"f")
	local func = t.func
		
		-- for k,v in pairs(t) do
		-- 	print(k,v)
		-- end


	for i=1,math.huge do
		local n ,v = debug.getupvalue(func,i)
		-- print(22,n,v)
		if not n then break end
		if n == name then print(func,n,i) return v end
	end
	--还没找到 访问环境
	return getfenv(func)[name]
end



local function f1( n )
	local function f2( )
		n = n * 2
		print(getvarvalue("n"))
		-- return n 
	end

	return f2
end



-- print(f1(100)())

-- x()  
-- x()  
-- print(x())

function f1(n) -- 函数参数也是局部变量
  local function f2()
   	print(n) -- 引用外包函数的局部变量 
  end 
  return f2
end
-- g1 = f1(1979)  
-- g1() -- 打印出1979g2 = f1(500)g2() -- 打印出500




function f1(n) 
  local function f2() 
     print(n) 
  end
  n = n + 10 
  return f2
end
-- g1 = f1(1979)
-- g1() -- 打印出1989
-- g1()

function Create() 
  local foo1 = function () 
    print(n) 
  end
  local foo2 = function () 
    n = n + 10 
  end
  return foo1,foo2
end
f1,f2 = Create(1979)
f1() -- 打印1979 
f2() f1() -- 打印1989 
f2() f1() -- 打印1999












