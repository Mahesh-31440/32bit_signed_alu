`timescale 1ns / 1ps
module sign_sub(input wire signed [31:0]a,b,input wire cin,output wire signed [31:0]out,output wire of,cf,zf,nf);
    wire signed [31:0] comp;
    assign comp=~b;
    wire [31:0]c;
    genvar i;
    full_adder f0(a[0],comp[0],cin,out[0],c[0]);
    generate 
    for (i=1;i<32;i=i+1)begin
        full_adder fi(a[i],comp[i],c[i-1],out[i],c[i]);
    end
    endgenerate
    assign of=c[31]^c[30];
    assign cf=c[31];
    assign zf=~|out;
    assign nf=out[31];
endmodule

