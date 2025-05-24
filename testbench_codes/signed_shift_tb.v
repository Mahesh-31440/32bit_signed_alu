`timescale 1ns / 1ps
module signed_shift_tb();
    reg signed [31:0]a;
    reg [4:0]b;
    reg sel;
    wire signed [31:0]out;
    wire of;
    signed_shift wew(a,b,sel,out,of);
    initial begin 
        a=32'sd329373247;b=5'd12;sel=1;
        #10 a=-32'sd893483234;b=5'd23;sel=0;
        #10 a=32'sd43932754;b=5'd31;
        #10 a=-32'd32653565;b=5'd31;sel=1;
        #10 $finish;
    end
    initial begin
        $monitor("%g %sb %b %b %sb %b",$time,a,b,sel,out,of);
    end
endmodule
