`timescale 1ns / 1ps
module signed_adder_tb();
    reg signed [31:0]a,b;
    reg cin;
    wire signed [31:0]out;
    wire zf,cf,nf,of;
    sign_adder s1(a,b,cin,out,of,cf,zf,nf);
    initial begin
        a=32'sd56455654;b=32'sd454545462;cin=0;
        #10 a=-32'sd55677887;b=-32'sd976465405;
        #10 a=-32'sd986554234;b=32'sd97043262;
        #10 a=32'sd804325653;b=-32'sd146586987;
        #10 a = 32'sd2147483647;b = 32'sd1;
        #10 a=32'sd6754276;b=-32'sd6754276;
        #10 $finish;
    end
    initial 
        $monitor("%g %sb %sb %b %sb %b %b %b %b",$time,a,b,cin,out,of,cf,zf,nf);
endmodule
