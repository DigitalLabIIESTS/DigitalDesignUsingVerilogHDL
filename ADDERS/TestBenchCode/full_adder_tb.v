`timescale 1ns / 1ps
module full_adder_tb();
wire sum_out,carry_out;
reg a_in,b_in,carry_in;

integer i;
initial
begin
    for (i=0; i<8; i=i+1) 
    begin
    {a_in,b_in,carry_in} = i;
    #10;
    end
end
full_adder FA(.sum_out(sum_out),.carry_out(carry_out),.a_in(a_in),.b_in(b_in),.carry_in(carry_in));
initial
begin
    $monitor ("sum_out %b carry_out %b a_in %b b_in %b carry_in %b",sum_out,carry_out,a_in,b_in,carry_in);
end

initial
begin
    #100 $stop;
end
endmodule
