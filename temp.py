import math
import numpy as np
for x in range(0,91):
	x = x * math.pi /180
	val = math.sin(x)
	# print(math.sin(x))
	print (bin(np.float16().view('H'))[2:].zfill(16) )
