module LAB_5_pre2(input [1:0] A,input [1:0] B,output [9:0] C);
assign C = {{2{A}},{2{B}},A};
endmodule