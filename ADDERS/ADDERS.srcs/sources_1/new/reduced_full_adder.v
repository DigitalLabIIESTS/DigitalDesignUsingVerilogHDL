`timescale 1ns / 1ps
module reduced_full_adder(sum_out,a_in,b_in,carry_in);
    output sum_out;
    input a_in,b_in,carry_in;
    wire w1;
    
    half_adder HA1(.sum_out(w1),.a_in(a_in),.b_in(b_in));
    half_adder HA2(.sum_out(sum_out),.a_in(w1),.b_in(carry_in));
endmodule
