def float_to_fixed(num,integer_precision,fraction_precision):
    if(num<0):
        sign_bit = 1
        num = -1*num  #sign bit is 1 for negative numbers in 2's complement representation
    else:
        sign_bit = 0
        
    precision = '0' + str(integer_precision) + 'b'
    integral_part = format(int(num),precision)
    fractional_part_f = num - int(num)
    
    fractional_part = []
    for i in range(fraction_precision):
        d = fractional_part_f*2
        fractional_part_f = d - int(d)
        fractional_part.append(int(d))

    fraction_string = ''.join(str(e) for e in fractional_part)
    
    if(sign_bit==1):
        binary = str(sign_bit) + twos_comp(integral_part +  fraction_string,integer_precision,fraction_precision)
    else:
        binary = str(sign_bit) + integral_part+fraction_string
    return str(binary)

def twos_comp(val,integer_precision,fraction_precision):
    flipped = ''.join(str(1-int(x))for x in val)
    length = '0' + str(integer_precision+fraction_precision)+'b'
    bin_literal = format((int(flipped,2)+1),length)
    return bin_literal

#TWO'S COMPLEMENT
print(twos_comp('0110011110110110', 3, 12)) ## Ans: -> 1001100001001010

#CONVERTING A POSITIVE FLOAT NUMBER TO FIXED-POINT
print(float_to_fixed(2.356,3,12)) ## Ans: -> 0010010110110010

#CONVERTING A NEGATIVE FLOAT NUMBER TO FIXED-POINT
print(float_to_fixed(-5.2,3,12)) ## Ans: -> 1101101001001110
