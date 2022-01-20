module LAB_5_PRE3(input [8:0]SW, output [3:0]LEDG);
	assign LEDG[3:0] = (SW[8] == 1) ? SW[3:0]:SW[7:4];
endmodule
// If you have multiple assign lines in a Verilog program, are they executed in parallel or sequentially? parallel
// If you have multiple lines inside an always block, are they executed in parallel, or sequentially? sequentially
//  If you have multiple always blocks (block A and block B) are the lines of code in block A executed sequentially or in parallel with lines in block B? parallel