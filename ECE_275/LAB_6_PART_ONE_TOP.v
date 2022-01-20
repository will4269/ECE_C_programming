module LAB_6_PART_ONE_TOP(input [7:0]SW,output [6:0]HEX0_D,output [6:0]HEX1_D,output [6:0]HEX2_D,output [3:0]LEDG);
//shftadd3(SW[3:0],LEDG[3:0]);
wire [11:0]BCD;
shiftadder now (SW[7:0],BCD[11:0]);
BCD_Display disp_one (BCD[3:0],HEX0_D);
BCD_Display disp_two (BCD[7:4], HEX1_D);
BCD_Display disp_three (BCD[11:8], HEX2_D);
endmodule

module shftadd3(input [3:0]A, output [3:0]S);
assign S = (A>4'd4) ? (A+4'd3):A;
endmodule

module shiftadder(input [7:0]S,output [11:0]BC);
wire [3:0]a;
wire [3:0]b;
wire[3:0]c;
wire [3:0]d;
wire [3:0]e;
shftadd3 one_ ({1'b0,S[7:5]},a);
shftadd3 two_ ({a[2:0],S[4]},b);
shftadd3 three_ ({b[2:0],S[3]},c);
shftadd3 four_ ({c[2:0],S[2]},d);
shftadd3 five_ ({d[2:0],S[1]},BC[4:1]);
shftadd3 six_ ({1'b0,a[3],b[3],c[3]},e);
shftadd3 seven_ ({e[2:0],d[3]},BC[8:5]);
assign BC[11:10]=2'b00;
assign BC[0]=S[0];
assign BC[9]=e[3];
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
