`timescale 1ns / 1ps
module twobitcmp(equal,greater,less,a,b);

    output equal, greater, less;
    input [1:0] a, b;
    assign equal = (a[1] ^~ b[1]) & (a[0] ^~ b[0]);
    assign greater = (a[1] & ~b[1]) | ((a[1] ^~ b[1]) & (a[0] & ~b[0])) ;
    assign less = (~a[1] & b[1]) | ((a[1] ^~ b[1]) & (~a[0] & b[0])) ; 

endmodule