#!/usr/bin/python
number = 10
running = True
while running:
	guessnumber = int(raw_input("input your guess number:"))
	if number == guessnumber:
		print "cool ,you are right"
		running = False
	elif (number < guessnumber):
		print "little then your number"
	else:
		print "big then your number"
else:
	print "fuck enter else"
print "done"

