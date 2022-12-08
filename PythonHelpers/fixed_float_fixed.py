"""
Module for conversion of a floating-point number to fixed-point number.
"""

### HELPER FUNCTION ###
def twos_comp(val,integer_precision,fraction_precision):
    flipped = ''.join(str(1-int(x))for x in val)
    length = '0' + str(integer_precision+fraction_precision)+'b'
    bin_literal = format((int(flipped,2)+1),length)
    return bin_literal

### TO FIXED-POINT CONVERSION FUNCTION ###
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

### TO FLOATING-POINT CONVERSION FUNCTION ###
def fixed_to_float(s,integer_precision,fraction_precision):
    number = 0.0
    i = integer_precision - 1
    j = 0
    if(s[0] =='1'):
        s_complemented = twos_comp((s[1:]), integer_precision, fraction_precision)
    else:
        s_complemented = s[1:]
    while(j != integer_precision+fraction_precision-1):
        number += int(s_complemented[j])*(2**i)
        i -= 1
        j += 1
        
    if(s[0] == '1'):
        return (-1)*number
    else:
        return number


#TWO'S COMPLEMENT
print(twos_comp('0110011110110110', 3, 12)) ## Ans: -> 1001100001001010

### FUNCTION TEST ###
print(fixed_to_float('1101101001001110',3,12)) ## Ans = -2.35595703125
print(fixed_to_float('0010110111111011',3,12)) ## Ans = 2.87353515625


#CONVERTING A POSITIVE FLOAT NUMBER TO FIXED-POINT
print(float_to_fixed(1,3,12)) ## 
print(float_to_fixed(-5,3,12)) ## 
#CONVERTING A NEGATIVE FLOAT NUMBER TO FIXED-POINT
print(float_to_fixed(-0.555,3,12)) ## Ans: -> 1101101001001110
