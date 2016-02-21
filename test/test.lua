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
