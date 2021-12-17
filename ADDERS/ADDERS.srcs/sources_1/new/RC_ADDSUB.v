`timescale 1ns / 1ps
// 4 bit ripple carry adder/subtractor using 2's compliment as sub_in is used as carry_in of FA1
module RC_ADDSUB(sum_out,carry_out,a_in,b_in,sub_in);
    output [3:0] sum_out;
    output carry_out;
    input [3:0] a_in,b_in;
    input sub_in;
    
    wire [3:0] w;
    wire [2:0] carry_wire;
    
    xor X1(w[0],b_in[0],sub_in);
    full_adder FA1(sum_out[0],carry_wire[0],a_in[0],w[0],sub_in);
    xor X2(w[1],b_in[1],sub_in);
    full_adder FA2(sum_out[1],carry_wire[1],a_in[1],w[1],carry_wire[0]);
    xor X3(w[2],b_in[2],sub_in);
    full_adder FA3(sum_out[2],carry_wire[2],a_in[2],w[2],carry_wire[1]);
    xor X4(w[3],b_in[3],sub_in);
    full_adder FA4(sum_out[3],carry_out,a_in[3],w[3],carry_wire[2]);
    
endmodule
