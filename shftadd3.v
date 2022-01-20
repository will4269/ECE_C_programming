module shftadd3(input [3:0]A, output [3:0]S);
assign S = (A>4'd4) ? (A+4'd3):A;
endmodule