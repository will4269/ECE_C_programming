module lab3(input [3:0] SW, output [6:0] HEX0_D);
	wire [3:0] BCDValue;
	wire [6:0] LED_Segment;
	assign BCDValue[3:0] = SW[3:0];
	assign HEX0_D[6:0] = LED_Segment[6:0];
	assign LED_Segment[0] = (((!SW[3])&(!SW[2])&(!SW[1])&(SW[0]))|((!SW[3])&(SW[2])&(!SW[1])&(!SW[0])));
	assign LED_Segment[1] = (((!SW[3])&(SW[2])&(!SW[1])&SW[0])|(!SW[3])&(SW[2])&(SW[1])&(!SW[0]));
	assign LED_Segment[2] = ((!SW[3])&(!SW[2])&(SW[1])&(!SW[0]));
	assign LED_Segment[3] = (((!SW[2])&(!SW[1])&(SW[0]))|((!SW[3])&(SW[2])&(!SW[1])&(!SW[0]))|((!SW[3])&(SW[2])&(SW[1])&(SW[0])));
	assign LED_Segment[4] = (((!SW[3])&(SW[0]))|((!SW[3])&(SW[2])&(!SW[1]))|((!SW[2])&(!SW[1])&(SW[0])));
	assign LED_Segment[5] = (((!SW[3])&(!SW[2])&(SW[0]))|((!SW[3])&(!SW[2])&(SW[1]))|((!SW[3])&(SW[1])&SW[0]));
	assign LED_Segment[6] = (((!SW[3])&(!SW[2])&(!SW[1]))|((!SW[3])&(SW[2])&(SW[1])&(SW[0])));
endmodule