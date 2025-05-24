`timescale 1ns / 1ps
module signed_comp_tb();
    reg signed [31:0]a,b;
    wire lt,gt,eq;
    signed_comp c1(a,b,lt,gt,eq);
    initial begin
        a=32'sd5398457;b=32'sd90505443;
        #10 a=-32'sd4096580;b=32'sd0956445;
        #10 a=32'sd436907954;b=-32'sd497843978;
        #10 a=-32'sd43984379;b=-32'sd43984379;
        #10 a=-32'sd90319842;b=-32'sd28648976;
        #10 $finish;
    end
    initial
        $monitor("%g %sb %sb %b %b %b",$time,a,b,lt,gt,eq);
endmodule
