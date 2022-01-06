`timescale 1ns / 1ps
module twos_comp_adder_tb();
wire [3:0] sum_out;
wire carry_out;
wire overflow;
wire negative;
wire zero;
reg [3:0] a_in,b_in;
reg carry_in;

initial
begin
    a_in = 4'd0; b_in = 4'd0; carry_in= 4'd0;
    #20;
    a_in = 4'b1011; b_in = 4'b0100; carry_in= 4'd0;
    #20;
    a_in = 4'b1111; b_in = 4'b1101; carry_in= 4'd1;
    #20
    a_in = 4'b0111; b_in = 4'b0001; carry_in= 4'd0;
end

twos_comp_adder TCA(.sum_out(sum_out),.carry_out(carry_out),.overflow(overflow),.negative(negative),.zero(zero),.a_in(a_in),.b_in(b_in),.carry_in(carry_in));

initial
begin
    $monitor ("sum_out %b%b%b%b carry_out %b overflow %b negative %b zero %b a_in %b%b%b%b b_in %b%b%b%b carry_in %b",sum_out[3],sum_out[2],sum_out[1],sum_out[0],
    carry_out,overflow,negative,zero,a_in[3],a_in[2],a_in[1],a_in[0],b_in[3],b_in[2],b_in[1],b_in[0],carry_in);
end
initial
begin
#90 $stop;
end
endmodule