#!/usr/bin/python
import os
import time

source = ['/Users/david/newdev/studyPython','/Users/david/newdev/ProductList']
target_dir = '/Users/david/newdev/studyPython/'
target = target_dir+time.strftime("%Y%m%d%H%M%S")+'.zip'
zip_command = "zip -qr '%s' %s"%(target,' '.join(source))
print zip_command
if os.system(zip_command) == 0:
	print 'successful back up to',target
else:
	print 'backup failed'