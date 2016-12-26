

function newCounter()
     local i = 0
     return function () -- 匿名函数
          i = i + 1
          return i
     end
end

c1 = newCounter()
print(c1())     -->输出什么？
print(c1())     -->又输出什么？


function newCounter(i)
     return function () -- 匿名函数
          i = i + 1
          return i
     end
end

c1 = newCounter(10)
print(c1())     -->输出什么？
print(c1())     -->又输出什么？