`timescale 1ns / 1ps
module d_latch (c_in,d_in,q_out,qbar_out);                          // d latch
    input  c_in, d_in;                              // inputs:  c_in, d_in
    output q_out, qbar_out;                         // outputs: q_out, qbar_out
    wire   r, s;                                    // internal wires
    nand nand1 (s,  d_in, c_in);                    // nand (out, in1, in2);
    nand nand2 (r, ~d_in, c_in);                    // nand (out, in1, in2);
    rs_latch rs (s, r, q_out, qbar_out);             // use rs_latch module
endmodule
