`timescale 1ns / 1ps
module signed_shift(input wire signed [31:0]a,input wire [4:0]b,input wire sel,output reg signed [31:0]out,output reg of);
    reg signed[31:0] shift1,shift2,shift3,shift4,shift5;
    always@(*)begin
    of=0;
       case(sel)
            1'b0: begin shift1=b[0]?{a[30:0],1'b0}:a;//left shift
                        shift2=b[1]?{shift1[29:0],2'b00}:shift1;
                        shift3=b[2]?{shift2[27:0],4'b0000}:shift2;
                        shift4=b[3]?{shift3[23:0],8'b0}:shift3;
                        shift5=b[4]?{shift4[15:0],16'b0}:shift4;
                        out=shift5;
                        of=out[31]^a[31];
                  end
             1'b1:begin shift1=b[0]?{a[31],a[31:1]}:a;//arithmetic right shift
                        shift2=b[1]?{{2{a[31]}},shift1[31:2]}:shift1;
                        shift3=b[2]?{{4{a[31]}},shift2[31:4]}:shift2;
                        shift4=b[3]?{{8{a[31]}},shift3[31:8]}:shift3;
                        shift5=b[4]?{{16{a[31]}},shift4[31:16]}:shift4;
                        out=shift5;
                  end
       endcase
    end
endmodule
