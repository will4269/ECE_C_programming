module bcd(input [3:0] BCD,output [6:0] LED);
	assign LED[0] = (((!BCD[3])&(!BCD[2])&(!BCD[1])&(BCD[0]))|((!BCD[3])&(BCD[2])&(!BCD[1])&(!BCD[0])));
	assign LED[1] = (((!BCD[3])&(BCD[2])&(!BCD[1])&BCD[0])|(!BCD[3])&(BCD[2])&(BCD[1])&(!BCD[0]));
	assign LED[2] = ((!BCD[3])&(!BCD[2])&(BCD[1])&(!BCD[0]));
	assign LED[3] = (((!BCD[2])&(!BCD[1])&(BCD[0]))|((!BCD[3])&(BCD[2])&(!BCD[1])&(!BCD[0]))|((!BCD[3])&(BCD[2])&(BCD[1])&(BCD[0])));
	assign LED[4] = (((!BCD[3])&(BCD[0]))|((!BCD[3])&(BCD[2])&(!BCD[1]))|((!BCD[2])&(!BCD[1])&(BCD[0])));
	assign LED[5] = (((!BCD[3])&(!BCD[2])&(BCD[0]))|((!BCD[3])&(!BCD[2])&(BCD[1]))|((!BCD[3])&(BCD[1])&BCD[0]));
	assign LED[6] = (((!BCD[3])&(!BCD[2])&(!BCD[1]))|((!BCD[3])&(BCD[2])&(BCD[1])&(BCD[0])));
endmodule
