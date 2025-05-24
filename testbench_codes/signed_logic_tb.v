`timescale 1ns / 1ps
module signed_logic_tb();
    reg signed [31:0]a,b;
    reg [1:0]sel;
    wire signed [31:0]out;
    signed_logic ued(a,b,sel,out);
    initial begin
        a=-32'sd354323;b=32'sd3532656;sel=2'b10;
        #10 a=32'sd765432543;b=-32'sd854344434;sel=2'b01;
        #10 a=-32'sd57434535;b=32'sd832402423;sel=2'b00;
        #10 sel=2'b11;
        #10 $finish;
    end
    initial begin
        $monitor("%g %sb %sb %b %sb",$time,a,b,sel,out);
    end
endmodule
