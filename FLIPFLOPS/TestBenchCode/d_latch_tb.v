`timescale 1ns / 1ps
module d_latch_tb;
    reg  c,d;
    wire q,qn;
    d_latch dl (.c_in(c),.d_in(d),.q_out(q),.qbar_out(qn));
    initial begin
           c = 0;
           d = 0;
        #2 d = 1;
        #2 d = 0;
        #1 c = 1;
        #1 d = 1;
        #2 d = 0;
        #1 d = 1;
        #1 c = 0;
        #1 d = 0;
        #3 d = 1;
        #1 c = 1;
        #1 d = 0;
        #2 d = 1;
        #1 d = 0;
        #1 c = 0;
        #1 d = 1;
        #3 d = 0;
        #1 c = 1;
        #5 $finish;
    end
endmodule
