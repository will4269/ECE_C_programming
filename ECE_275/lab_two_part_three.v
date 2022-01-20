 module lab_two_part_three(
 input [8:0] SW,
 output [3:0]LEDG);
	//sw[0] is switch
	//sw[1,3,5,7] x
	//sw[2,4,6,8]
	assign LEDG[0] = ((SW[1]&(!SW[0]))|SW[2]&SW[0]);
	assign LEDG[1] = ((SW[3]&(!SW[0]))|SW[4]&SW[0]);
	assign LEDG[2] = ((SW[5]&(!SW[0]))|SW[6]&SW[0]);
	assign LEDG[3] = ((SW[7]&(!SW[0]))|SW[8]&SW[0]);
endmodule
