`timescale 1ns / 1ps
module signed_logic(input wire signed [31:0]a,b,input wire [1:0]sel,output reg signed [31:0]out);
    always@(*)begin
        out=32'sd0;
        case(sel)
            2'b00: out=a&b;
            2'b01: out=a|b;
            2'b10: out=a^b;
            2'b11: out=~a;
            default: out=32'sd0;
        endcase
    end
endmodule
