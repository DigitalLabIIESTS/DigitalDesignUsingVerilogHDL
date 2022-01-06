`timescale 1ns / 1ps
module twos_comp_adder(sum_out,carry_out,overflow,negative,zero,a_in,b_in,carry_in);
    output [3:0] sum_out;
    output carry_out;
    output overflow; // Indicating that the output is not the correct sum
    output negative; // Indicating that the addition result is negative
    output zero; // Indicating that the addition result is zero
    input [3:0] a_in,b_in;
    input carry_in;
    wire carry_out0,carry_out1,carry_out2;
    
    full_adder FA1(.sum_out(sum_out[0]),.carry_out(carry_out0),.a_in(a_in[0]),.b_in(b_in[0]),.carry_in(carry_in));
    full_adder FA2(.sum_out(sum_out[1]),.carry_out(carry_out1),.a_in(a_in[1]),.b_in(b_in[1]),.carry_in(carry_out0));
    full_adder FA3(.sum_out(sum_out[2]),.carry_out(carry_out2),.a_in(a_in[2]),.b_in(b_in[2]),.carry_in(carry_out1));
    full_adder FA4(.sum_out(sum_out[3]),.carry_out(carry_out),.a_in(a_in[3]),.b_in(b_in[3]),.carry_in(carry_out2));
    xor X1(overflow,carry_out,carry_out2);
    assign zero = ~(sum_out[3] | sum_out[2] | sum_out[1] | sum_out[0]);
    assign negative = sum_out[3]^overflow;
    
endmodule

