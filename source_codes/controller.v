`timescale 1ns / 1ps
module signed_controller(input wire signed [31:0]a,b,input wire [3:0]sel,output reg signed [31:0]out,reg signed [63:0]out_m,reg cf,zf,of,nf);
    wire signed [31:0]adder_out,sub_out,logic_out,shift_out;
    wire signed [63:0] sign_out_m;
    wire comp_out,cf_out,zf_out,nf_out,of_out,lt,gt,eg,of_sub,cf_sub,zf_sub,nf_sub,of_shift;
    sign_adder s1(a,b,1'b0,adder_out,of_out,cf_out,zf_out,nf_out);
    sign_sub s2(a,b,1'b1,sub_out,of_sub,cf_sub,zf_sub,nf_sub);
    signed_mul s6(a,b,sign_out_m);
    signed_logic s3(a,b,sel[1:0],logic_out);
    signed_shift s4(a,b,sel[0],shift_out,of_shift);
    signed_comp s5(a,b,lt,gt,eq);
    always@(*)begin
        cf=1'b0;zf=1'b0;of=1'b0;nf=1'b0;
        out=32'sd0;out_m=64'sd0;
        case(sel)
            4'b0000: begin out=logic_out;nf=out[31];zf=~|out; end//AND gate
            4'b0001: begin out=logic_out;nf=out[31];zf=~|out; end//OR gate
            4'b0010: begin out=logic_out;nf=out[31];zf=~|out; end//XOR gate
            4'b0011: begin out=logic_out;nf=out[31];zf=~|out; end//NOT gate
            4'b0100: begin out=adder_out;nf=nf_out;zf=zf_out;cf=cf_out;of=of_out; end//add
            4'b0101: begin out=sub_out;nf=nf_sub;zf=zf_sub;cf=cf_sub;of=of_sub; end//sub
            4'b0110: begin out_m=sign_out_m;nf=out_m[63];zf=~|out_m; end//multiplication (code written at higher abstraction level)
            4'b0111: begin out=shift_out;nf=out[31];zf=~|out;of=of_shift; end//right shift
            4'b1000: begin out=shift_out;nf=out[31];zf=~|out;of=of_shift; end//left shift
            4'b1001: begin out=lt;zf=~out; end//compare result less than
            4'b1010: begin out=eq;zf=~out; end// compare result equal
            4'b1011: begin out=gt;zf=~out; end//compare result greater than 
            default:  begin out=32'sd0;out_m=64'sd0; end//default case
        endcase    
    end
endmodule
