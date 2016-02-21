# lua-uuid
---
## Instructions

generate uuid for lua, use libuuid of C library:

- uuid1: use uuid_generate_time
- uuid4: use uuid_generate_random

notice: uuid1 may expose your mac address of your server

## Dependence

depend on libuuid-devel, install:

	yum install libuuid libuuid-devel

## API

- uuid1()

	return UUID object of the alternative algorithm which uses the current time and the local ethernet MAC address (if available)

- uuid4()

	return UUID object of the all-random UUID format

- uuid_hex()

	return 32 bytes hex string of UUID just like: 1e15b616fa8d4087820926fde1c9bf73

- uuid_str()

	return 36 bytes uuid string of UUID just like: 1e15b616-fa8d-4087-8209-26fde1c9bf73

- uuid_num()

	return 128 bit number of UUID just like: 3.9989571326686e+37

## Example

	local uuid = require("uuid")
	
	uu = uuid:uuid1()
	hex = uu:uuid_hex()
	str = uu:uuid_str()
	num = uu:uuid_num()
	
	print(hex)
	print(str)
	print(num)

## Performance

- test script

		local uuid = require("uuid")
		
		i = 0
		while i < 100000
		do
		    uu = uuid:uuid1()
		    hex = uu:uuid_hex()
		    str = uu:uuid_str()
		    num = uu:uuid_num()
		    i = i + 1
		end
		
		print(hex)
		print(str)
		print(num)

- time spent

		[root@123 lua]# time luajit test.lua
		1e15b616fa8d4087820926fde1c9bf73
		1e15b616-fa8d-4087-8209-26fde1c9bf73
		3.9989571326686e+37
		
		real	0m1.394s
		user	0m0.874s
		sys	0m0.513s