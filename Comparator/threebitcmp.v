`timescale 1ns / 1ps
module threebitcmp(equal,greater,less,a,b);

    output equal, greater, less;
    input [2:0] a, b;
    assign equal = (a[2] ^~ b[2]) & (a[1] ^~ b[1]) & (a[0] ^~ b[0]);
    assign greater = (a[2] & ~b[2]) | ((a[2] ^~ b[2]) & (a[1] & ~b[1])) | ((a[2] ^~ b[2]) & (a[1] ^~ b[1]) & (a[0] & ~b[0])) ;
    assign less = (~a[2] & b[2]) | ((a[2] ^~ b[2]) & (a[1] & ~b[1])) | ((a[2] ^~ b[2]) & (a[1] ^~ b[1]) & (~a[0] & b[0])) ;

endmodule