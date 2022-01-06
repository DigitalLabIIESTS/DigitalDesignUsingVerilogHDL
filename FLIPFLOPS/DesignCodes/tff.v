`timescale 1ns / 1ps
module tff (t,clk,clrn,q);                  // tff with asynchronous reset
    input      t, clk, clrn;                // inputs t, clock, reset
    output reg q;                           // output q, register type
    always @ (posedge clk or negedge clrn) begin // always block, "or"
        if (!clrn) q <= 0;                  // if clrn is active, reset tff
        else       q <= t & ~q | ~t & q;    // else update tff
    end
endmodule
