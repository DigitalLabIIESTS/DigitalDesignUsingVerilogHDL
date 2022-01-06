`timescale 1ns / 1ps

module full_adder(sum_out,carry_out,a_in,b_in,carry_in);
    output sum_out,carry_out;
    input a_in,b_in,carry_in;
    wire w1,w2,w3;
    
    half_adder HA1(.sum_out(w1),.carry_out(w2),.a_in(a_in),.b_in(b_in));
    half_adder HA2(.sum_out(sum_out),.carry_out(w3),.a_in(w1),.b_in(carry_in));
    or OR1(carry_out,w2,w3);
    
endmodule