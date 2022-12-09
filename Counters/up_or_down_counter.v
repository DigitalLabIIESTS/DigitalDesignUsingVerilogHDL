`timescale 1ns / 1ps

module up_counter(led, clk, rst, updown);
    output [3:0] led;
    input clk, rst,updown;
    reg [3:0] led;
    
    reg [26:0] count;
    reg clkdiv;

    initial
    begin
        count = 0;
        clkdiv = 0;
    end
    
    always @ (posedge clk)
    begin
        count <= count + 1;
        if(count == 10000000-1)
            begin
                count <= 0;
                clkdiv <= ~clkdiv;
            end
    end
    
    always @ (posedge clkdiv)
      begin
      if(rst)
      led <= 4'b1111;
      else if(updown)
        led <= led + 1; // upcounter
      else
        led <= led - 1; // downcounter
      end
endmodule

