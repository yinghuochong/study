-- setmetatable(a, {__index = b})  -- a 继承自b


Account = {balance = 0}
function Account:new (o)
	o = o or {} -- create object if user does not provide one 
	setmetatable(o, self)
	self.__index = self
	return o
end
function Account:cal(tax)
	print("Account:cal")
	return self.balance * tax
end
a = Account:new({balance = 100})
a:cal(1.2)
getmetatable(a).__index(cal)

SpecialAccount = Account:new()		
-- setmetatable(SpecialAccount, Account)
-- Account.__index = Account

s = SpecialAccount:new({limit=1000.00})
-- setmetatable(s, SpecialAccount)
-- SpecialAccount.__index = SpecialAccount


function SpecialAccount:cal(tax)
	print("SpecialAccount:cal")
	return self.balance * tax * 2
end
s:cal(1.5)



local  x = {a = 10}
local y = {}
local z = {}
setmetatable(y,{__index = x})
setmetatable(z,{__index = y})

print(z.a)






Account = {balance = 0}
function Account.withDraw(v)
     Account.balance = Account.balance - v
end

Account.withDraw(10) -- 调用函数
print(Account.balance)



a = Account
Account = nil
a.withDraw(100)



Account = {balance = 0}
function Account.withDraw(self, v)
     self.balance = self.balance - v
end

a = Account
Account = nil
a.withDraw(a, 100)
print(a.balance)




Account = {balance = 0}
function Account:withDraw(v) -- 注意这里的冒号":"
     self.balance = self.balance - v
end

a = Account
Account = nil
a:withDraw(100) -- 注意这里的调用时，也需要冒号":"
print(a.balance)
























