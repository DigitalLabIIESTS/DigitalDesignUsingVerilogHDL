`timescale 1ns / 1ps
module ripple_carry_tb();
wire [3:0] sum_out;
wire carry_out;
reg [3:0] a_in,b_in;
reg carry_in;

/*integer i,j;
initial
begin
    for(i=0;i<16;i=i+1)
    begin
        a_in = i;
        #20;
    end
end

initial
begin
    for(j=16;j>0;j=j-1)
    begin
        b_in = j;
        #20;
    end
end
*/

initial
begin
    a_in = 4'd0; b_in = 4'd0; carry_in= 4'd0;
    #20;
    a_in = 4'b1011; b_in = 4'b0100; carry_in= 4'd0;
    #20;
    a_in = 4'b1111; b_in = 4'b1101; carry_in= 4'd1;
end

ripple_carry RCA(.sum_out(sum_out),.carry_out(carry_out),.a_in(a_in),.b_in(b_in),.carry_in(carry_in));

initial
begin
    $monitor ("sum_out %b%b%b%b carry_out %b a_in %b%b%b%b b_in %b%b%b%b carry_in %b",sum_out[3],sum_out[2],sum_out[1],sum_out[0],carry_out,a_in[3],
    a_in[2],a_in[1],a_in[0],b_in[3],b_in[2],b_in[1],b_in[0],carry_in);
end
endmodule
