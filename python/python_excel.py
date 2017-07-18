# -*- coding: utf-8 -*-
import xlwt
import xlrd
import os

#检查是否存在,如果存在则删除
filePath = '/Users/liulihua/Documents/text.xls'
if(os.path.exists(filePath)):
	os.remove(filePath);
#创建excl
wb = xlwt.Workbook()
#新建sheet
sheet = wb.add_sheet('A Test Sheet')

#写表头
titles = ["表头1","表头2","表头3","表头4","表头5"];
style = xlwt.easyxf('font: bold 1')
for i in xrange(0,len(titles)):
	unicodeTitle = unicode(str(titles[i]),'utf-8')
	sheet.write(0,i,unicodeTitle,style)
#写内容
contents = [["c1","c1","c1","c1","c1"],['004500',1,2.389,3,4]];
for i in xrange(1,len(contents)+1):
	content = contents[i-1];
	sheet.write(i,0,content[0])
	sheet.write(i,1,content[1])
	sheet.write(i,2,content[2])
	sheet.write(i,3,content[3])
	sheet.write(i,4,content[4])
#保存文件
wb.save(filePath)
print("finished")
#读内容
