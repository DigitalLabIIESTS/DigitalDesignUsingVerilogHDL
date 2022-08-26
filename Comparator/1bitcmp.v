`timescale 1ns / 1ps
module onebitcmp(equal,greater,less,a,b);
    output equal, greater, less;
    input a, b;
    
    assign equal = a ^~ b;
    assign greater = a & (~b);
    assign less = (~a) & b; 
endmodule
