#!/usr/bin/python
class Person:
	def __init__(self,name):
		self.name = name

	def sayHi(self):
		print "hello how are you",self.name
p = Person('firefly')
print p
p.sayHi()