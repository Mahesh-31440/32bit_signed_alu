`timescale 1ns / 1ps
module signed_comp(input wire signed [31:0]a,b,output wire lt,gt,eq);
    wire zf,cf,nf,of;
    wire signed [31:0] diff;
    sign_sub s1(a,b,1'b1,diff,of,cf,zf,nf);
    assign lt=nf^of;
    assign gt=~(lt|eq);
    assign eq=zf;
endmodule
