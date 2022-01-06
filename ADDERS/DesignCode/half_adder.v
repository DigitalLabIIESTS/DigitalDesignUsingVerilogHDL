`timescale 1ns / 1ps
/*
Adds 2 bits a_in & b_in and produces sum_out & carry_out as Outputs
*/
module half_adder(sum_out,carry_out,a_in,b_in);
    output sum_out,carry_out;
    input a_in,b_in;
    
    /*
    and a1(carry_out,a_in,b_in);
    not i1 (Cbar,carry_out);
    or o1 (p, a_in,b_in);
    and a2 (sum_out,Cbar,p);
    */
    
    assign sum_out = a_in ^ b_in;
    assign carry_out = a_in & b_in;
endmodule
