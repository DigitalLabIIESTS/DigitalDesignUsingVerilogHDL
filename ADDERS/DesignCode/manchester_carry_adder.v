`timescale 1ns / 1ps
module adder(sum,carry_out,x,y,carry_in);
  output [3:0] sum;
  output carry_out;
  input [3:0] x,y;
  input carry_in;
  wire carry_out0,carry_out1,carry_out2;
  
  manchester MC1(sum[0],carry_out0,x[0],y[0],carry_in);
  manchester MC2(sum[1],carry_out1,x[1],y[1],carry_out0);
  manchester MC3(sum[2],carry_out2,x[2],y[2],carry_out1);
  manchester MC4(sum[3],carry_out,x[3],y[3],carry_out2);
  
endmodule

module manchester(sum,carry_out,x,y,carry_in);  
    output sum;
    output reg carry_out;
    input x,y,carry_in;
    wire prop,gen,kill;
    assign prop = x ^ y;
    assign gen = x & y;
    assign kill = ~(x | y);
    assign sum = prop ^ carry_in;
    
    always@(*)
    if (kill)
      carry_out = 1'b0;
    else if(prop)
      carry_out = carry_in;
    else
      carry_out = 1'b1;
endmodule
