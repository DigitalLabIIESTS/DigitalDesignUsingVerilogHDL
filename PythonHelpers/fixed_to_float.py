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

def twos_comp(val,integer_precision,fraction_precision):
    flipped = ''.join(str(1-int(x))for x in val)
    length = '0' + str(integer_precision+fraction_precision)+'b'
    bin_literal = format((int(flipped,2)+1),length)
    return bin_literal

print(fixed_to_float('1101101001001110',3,12)) ## Ans = -2.35595703125
print(fixed_to_float('0010110111111011',3,12)) ## Ans = 2.87353515625