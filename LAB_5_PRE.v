// Write code a 4 bit variable X, and a 6 bit wire Y, X=0101, assign Y value 8
module LAB_5_PRE(input [8:0]SW, output[4:0]LEDG);
   wire[3:0] X=4'b0101;
	wire[5:0] Y=6'd8;
	plus_adder(SW[8:0],LEDG[4:0]);
	
endmodule
module plus_adder(input [8:0]IN, output [4:0]SUM); //sw0-3(4 bit),sw4-7 (4-bot),sw8c in
	assign{SUM}=IN[3:0]+IN[7:4]+IN[8];
endmodule 

