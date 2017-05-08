#!/usr/bin/python
import os
import time



source = ['/Users/david/github/study/pythonTest','/Users/david/github/study/lua']
target_dir = '/Users/david/github/study/'
today = target_dir + time.strftime("%Y%m%d")
now = time.strftime("%H%M%S")

comment = raw_input('Enter a commnet->')
if len(comment) == 0:
	target = today+os.sep+now+'.zip'
else:
	print "enter here"
	target = today+os.sep+now+'_'+comment.replace(' ','_')+'.zip'

if not os.path.exists(today):
	os.mkdir(today)
	print 'success create directory',today
zip_command = "zip -qr '%s' %s"%(target,' '.join(source))
print zip_command
if os.system(zip_command) == 0:
	print 'successful back up to',target
else:
	print 'backup failed'