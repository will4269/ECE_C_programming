module lab_3part2(input [7:0] SW, output [6:0] HEX0_D, output [6:0] HEX1_D);
	BCD_Display disp_one (SW[7:4],HEX0_D);
	BCD_Display disp_two (SW[3:0], HEX1_D);
endmodule
module BCD_Display(input [3:0] BCD_Value,output [6:0] LED_Segment);
	assign LED_Segment[0] = (((!BCD_Value[3])&(!BCD_Value[2])&(!BCD_Value[1])&(BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1])&(!BCD_Value[0])));
	assign LED_Segment[1] = (((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1])&BCD_Value[0])|(!BCD_Value[3])&(BCD_Value[2])&(BCD_Value[1])&(!BCD_Value[0]));
	assign LED_Segment[2] = ((!BCD_Value[3])&(!BCD_Value[2])&(BCD_Value[1])&(!BCD_Value[0]));
	assign LED_Segment[3] = (((!BCD_Value[2])&(!BCD_Value[1])&(BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1])&(!BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(BCD_Value[1])&(BCD_Value[0])));
	assign LED_Segment[4] = (((!BCD_Value[3])&(BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1]))|((!BCD_Value[2])&(!BCD_Value[1])&(BCD_Value[0])));
	assign LED_Segment[5] = (((!BCD_Value[3])&(!BCD_Value[2])&(BCD_Value[0]))|((!BCD_Value[3])&(!BCD_Value[2])&(BCD_Value[1]))|((!BCD_Value[3])&(BCD_Value[1])&BCD_Value[0]));
	assign LED_Segment[6] = (((!BCD_Value[3])&(!BCD_Value[2])&(!BCD_Value[1]))|((!BCD_Value[3])&(BCD_Value[2])&(BCD_Value[1])&(BCD_Value[0])));
endmodule