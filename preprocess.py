"""
usage:
	python preprocess.py TRAIN_FILE_NAME CPU_OR_GPU_FLAG
example:
	python preprocess.py train.py 0
"""
import sys
import re

train_file = sys.argv[1]
# 0: CPU 1:GPU
gpu_flag = sys.argv[2]

with open(train_file) as f:
	print '# coding: utf-8'
	flag = 0
	for line in f:
		# pass comment
		if line[0] == '#':
			continue
		# pass blank line
		elif (not line.strip()) or line == '\n':
			continue
		# CPU or GPU	
		elif 'use_gpu=' in line and 'init' in line:
			if gpu_flag == '1':
				print line.split('use_gpu')[0]+'use_gpu=True, trainer_count=1)'
			else:
				print line.split('use_gpu')[0]+'use_gpu=False, trainer_count=1)'
		# pass plot
		elif '=event_handler_plot' in line:
			print line.replace('event_handler_plot', 'event_handler')
		# num_passed=1
		elif 'num_passes=' in line:
			#print re.sub('\d+', '1', line)
			print re.sub('num_passes=[A-Za-z0-9.-_]+', 'num_passes=1', line)
			#print line.split('num_passed=')[0],
			#print re.sub('[A-Za-z0-9]+', '1', line.split('num_passed=')[1])
		elif re.match('^\s*is_generating\s*=', line) != None:
			print re.sub('False', 'True', line)

		# add reader.firstn
		elif 'paddle.reader.shuffle' in line:
			flag = 1
			s = line
			left = line.count('(')
			right = line.count(')')
		elif flag == 1:
			s += line
			left += line.count('(')
			right += line.count(')')
			if left <= right:
				flag = 0
				sys.stdout.write(s.split('paddle.reader.shuffle')[0]+'paddle.reader.firstn(paddle.reader.shuffle')
				cnt = 0
				flag2 = 0
				for i in s.split('paddle.reader.shuffle')[1]:
					sys.stdout.write(i)
					if i == '(' and flag2 == 0:
						cnt = cnt+1
					if i == ')' and flag2 == 0:
						cnt = cnt-1
					if cnt == 0 and flag2 == 0:
						sys.stdout.write(', 64)')
						flag2 = 1
		else:
			print line,


