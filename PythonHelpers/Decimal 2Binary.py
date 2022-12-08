## DECIMAL or FLOAT to FIXED POINT BINARY CONVERSION in 2's COMPLEMENT FORMAT
def DtoB(num,dataWidth,fracBits):
    if num >= 0:
        num = num * (2**fracBits)
        num = int(num)
        #e = bin(num)[2:]
        e = '0'+str(bin(num)[2:])
    else:
        num = -num
        num = num * (2**fracBits)#number of fractional bits
        num = int(num)
        if num == 0:
            d = 0
        else:
            d = 2**dataWidth - num
        e = bin(d)[2:]
    return e

x = DtoB(5.2,16,12)
y = DtoB(-5.2,16,12)
print(x)
print(y)

def BtoD(num,dataWidth,fracBits):
    if num[0] == str(0):
        print('BKP')
        num = num / (2**fracBits)
        print('BKP')
    
    return num

x = BtoD('0101001100110011',16,12) # Ans =  5.2
y = BtoD('1010110011001101',16,12) # Ans = -5.2
print(x)
print(y)

