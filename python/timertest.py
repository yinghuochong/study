#!/usr/bin/python
import time
import threading

progress = 0
duration = 0.1
def printProgress(progress):
	print progress
	progress = progress + 1
	if progress > 100 :
		return
	global timer
	timer = threading.Timer(duration, printProgress,[progress])
	timer.start()
if __name__ == "__main__":
	timer = threading.Timer(duration, printProgress,[progress])
	timer.start()
