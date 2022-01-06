`timescale 1ns / 1ps
module half_adder_tb();
    wire sum_out,carry_out;
    reg a_in,b_in;
    /*
    initial
        begin
            a_in = 1'b0;
            b_in = 1'b0;
            #10;
    
            a_in = 1'b0;
            b_in = 1'b1;
            #10;
            
            a_in = 1'b1;
            b_in = 1'b0;
            #10;
            
            a_in = 1'b1;
            b_in = 1'b1;
            #10 $stop;
        end
        */
    integer i,j;
    initial
    begin
        for (i=0; i<2; i=i+1)
        begin
            a_in = i;
            for (j=0; j<2; j=j+1)
            begin
                b_in = j;
                #10;
            end
        end
    end
    half_adder half_adder_inst(.sum_out(sum_out),.carry_out(carry_out),.a_in(a_in),.b_in(b_in));
    initial
        begin
            $monitor ("sum_out %b carry_out %b a_in %b b_in %b",sum_out,carry_out,a_in,b_in);
        end
endmodule    

