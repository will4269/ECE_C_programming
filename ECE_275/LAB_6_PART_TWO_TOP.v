module LAB_6_PART_TWO_TOP(input CLOCK_50 ,input [7:0]SW,output [6:0]HEX0_D,output [6:0]HEX1_D,output [6:0]HEX2_D,output [9:0] LEDG);
reg [7:0] S;
reg [7:0] bb;
reg [11:0] c;
reg [7:0] i;
always @ ( posedge CLOCK_50) begin
c[11:0]={12{1'b0}};
bb[7:0]=SW[7:0];
	for(i=0;i<7;i=i+1) begin //cycle through switches
	c[0]=bb[7];
	bb=bb<<1;
			if(c[11:8]>4'b0100) begin
				c[11:8]=c[11:8]+3'b011;
			end
			if(c[7:4]>4'b0100) begin
				c[7:4]=c[7:4]+3'b011;
			end
			if(c[3:0]>4'b0100) begin
			c[3:0]=c[3:0]+3'b011;
			end
		c=c<<1;
	end
c[0]=bb[7];
end
assign LEDG [9:0] = c[9:0];
BCD_Display disp_one (c[3:0],HEX0_D);
BCD_Display disp_two (c[7:4], HEX1_D);
BCD_Display disp_three (c[11:8], HEX2_D);
endmodule




//module LAB_6_PART_TWO_TOP(input CLOCK_50, input [7:0]SW,output [6:0]HEX0_D,output [6:0]HEX1_D,output [6:0]HEX2_D,output [7:0]LEDG);
////wire [11:0]Z;
////shfter(CLOCK_50,SW[7:0],Z,LEDG);
////BCD_Display disp_one (Z[3:0],HEX0_D);
////BCD_Display disp_two (Z[7:4], HEX1_D);
////BCD_Display disp_three (Z[11:8], HEX2_D);
////endmodule
////module shfter(input CLOCK_50, input [7:0]S,output reg [11:0]b,output reg[7:0]LED);
////reg [11:0] bb;
////reg [7:0] i;
////reg [32:0]SO;
//reg [32:0] summed_counter ; // stores current count
//always @( posedge CLOCK_50 ) begin
//// SO=S;
////		for(i=0;i<4;i=i+1) begin //cycle thriugh switches
////		// cycle through hunds,tens,ones
////			bb[0]=SO[7];
////			if(bb[3:0]>4'b0100) begin
////				bb[3:0]=bb[3:0]+3'd4;
////			end
////			if(bb[7:4]>4'b0100) begin
////				bb[7:4]=bb[3:0]+3'd4;
////			end
////			if(bb[11:8]>4'b0100) begin
////				bb[11:8]=bb[3:0]+3'd4;
////			end
////		bb=bb<<1;
////		SO=SO<<1;
////LED[7:0]=SO[7:0];
////	end
////	bb=bb<<1;
////	bb[0]=SO[7];
////	b=SO;
////	
//summed_counter=summed_counter+ 1'b1;
//end
//assign LEDG[7:0]=summed_counter[32:26];
//endmodule


module BCD_Display(input [3:0] BCD_Value,output [6:0] LED_Segment);
	assign LED_Segment[0] = (((!BCD_Value[3])&(!BCD_Value[2])&(!BCD_Value[1])&(BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1])&(!BCD_Value[0])));
	assign LED_Segment[1] = (((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1])&BCD_Value[0])|(!BCD_Value[3])&(BCD_Value[2])&(BCD_Value[1])&(!BCD_Value[0]));
	assign LED_Segment[2] = ((!BCD_Value[3])&(!BCD_Value[2])&(BCD_Value[1])&(!BCD_Value[0]));
	assign LED_Segment[3] = (((!BCD_Value[2])&(!BCD_Value[1])&(BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1])&(!BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(BCD_Value[1])&(BCD_Value[0])));
	assign LED_Segment[4] = (((!BCD_Value[3])&(BCD_Value[0]))|((!BCD_Value[3])&(BCD_Value[2])&(!BCD_Value[1]))|((!BCD_Value[2])&(!BCD_Value[1])&(BCD_Value[0])));
	assign LED_Segment[5] = (((!BCD_Value[3])&(!BCD_Value[2])&(BCD_Value[0]))|((!BCD_Value[3])&(!BCD_Value[2])&(BCD_Value[1]))|((!BCD_Value[3])&(BCD_Value[1])&BCD_Value[0]));
	assign LED_Segment[6] = (((!BCD_Value[3])&(!BCD_Value[2])&(!BCD_Value[1]))|((!BCD_Value[3])&(BCD_Value[2])&(BCD_Value[1])&(BCD_Value[0])));
endmodule
