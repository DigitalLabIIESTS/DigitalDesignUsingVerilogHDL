`timescale 1ns / 1ps
module d_ff_async(d,clk,clrn,q);                 // dff with asynchronous reset
    input d, clk, clrn;                          // inputs d, clk, clrn (active low)
    output reg q;                                // output q, register type
    always @ (posedge clk or negedge clrn) begin // always block, "or"
        if (!clrn) q <= 0;                       // if clrn is asserted, reset dff
        else q <= d;                             // else store d to dff
    end
endmodule