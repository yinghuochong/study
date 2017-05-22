#!/usr/bin/python
import subprocess
import os
os.system("ls -lR|grep '^-'| wc -l")