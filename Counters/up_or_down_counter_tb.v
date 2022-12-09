`timescale 1ns / 1ps
module up_or_down_counter_tb();
parameter N=2;
reg clk,up_or_down;
wire [N-1:0] count;

    up_down_counter #(.N(N))UPDOWN (clk,up_or_down,count);

initial clk = 0;

always #5 clk = ~clk;

initial
    begin
        up_or_down = 1;
        #75;
        up_or_down = 0;
        #75;
        $stop;
    end
    
always @(*)
begin
    $monitor("time=%d,up_or_down=%d,count=%d",$time,up_or_down,count);
end    
endmodule
