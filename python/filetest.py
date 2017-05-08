#!/usr/bin/python

poem = """\
programeing isfun
dfsafsdafdsafdsafdafdsafdsafda
if fdasfdasfdsafdsafdasfafdsafsa fun:
		use python!
"""
f = file('poem.txt','w')
f.write(poem)
f.close()

f = file('poem.txt')
while True:
	line = f.readline()
	if len(line) == 0:
		break
	print line,
f.close()