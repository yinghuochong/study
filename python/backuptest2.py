#!/usr/bin/python
import os
import time

source = ['/Users/david/github/study/pythonTest','/Users/david/github/study/lua']
target_dir = '/Users/david/github/study/'
today = target_dir + time.strftime("%Y%m%d")
now = time.strftime("%H%M%S")
if not os.path.exists(today):
	os.mkdir(today)
	print 'success create directory',today
target = today+os.sep+now+'.zip'
zip_command = "zip -qr '%s' %s"%(target,' '.join(source))
print zip_command
if os.system(zip_command) == 0:
	print 'successful back up to',target
else:
	print 'backup failed'