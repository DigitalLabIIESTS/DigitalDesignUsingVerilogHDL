`timescale 1ns / 1ps
module rs_latch (s_in,r_in,q_out,qbar_out);              // rs latch
    input  s_in, r_in;                                   // inputs:  set, reset
    output q_out, qbar_out;                              // outputs: q_out, qbar_out
    nand nand1 (q_out,  s_in, qbar_out);                 // nand (out, in1, in2);
    nand nand2 (qbar_out, r_in, q_out);                  // nand (out, in1, in2);
endmodule
