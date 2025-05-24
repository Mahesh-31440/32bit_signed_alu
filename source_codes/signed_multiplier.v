`timescale 1ns / 1ps
module signed_mul(input wire signed [31:0]a,b,output reg signed [63:0]out);
    integer i;
    reg signed [31:0] abs_a,abs_b;
    always @(*) begin
        out = 64'sd0;
        abs_a=a[31]? -a:a;
        abs_b=b[31]? -b:b;
        for (i=0;i<32;i=i+1) begin
            if (abs_b[i]) begin
                out = out + (abs_a << i);
            end
        end
        if (a[31] ^ b[31]) begin
            out=~out +1;
        end
    end
endmodule
