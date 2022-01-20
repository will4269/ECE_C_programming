 module lab_two_top(
	input [2:0] SW,
	output LEDG
);
	assign LEDG = ((SW[1]&(!SW[0]))|SW[1]&SW[0]);
endmodule
