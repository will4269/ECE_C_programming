module LAB_one(input CLOCK_50 ,input [2:0]SW,output [1:0] LEDG);
// This should be the same code from the end of lab last week.
//Instantiate the module with SW[0] as your clock, SW[1] as R, SW[2] as S, and
//LED[0] as Q.
// RS_Latch UNO(CLOCK_50,SW[1:1],SW[2:2],LEDG[0:0]);
testbench one();
endmodule

module RS_Latch (input Clk ,input R,input S,output Q);
wire R_g , S_g , Qa , Qb /* synthesis keep */;
assign R_g = R & Clk;
assign S_g = S & Clk;
assign Qa = ~( R_g | Qb );
assign Qb = ~( S_g | Qa );
assign Q = Qa;
endmodule 


`timescale 10ns / 1ps
 module testbench ();
 reg Clk ;
 reg R;
 reg S;
 wire Q;
 RS_Latch rs1 (Clk ,R,S,Q);
 initial
 begin
	Clk <= 0; R <= 0; S <= 0;
	#1 Clk <= 0; R <= 0; S <= 1;
	#1 Clk <= 1; R <= 0; S <= 1;
	#1 Clk <= 0; R <= 0; S <= 0;
	#1 Clk <= 0; R <= 1; S <= 0;
	#1 Clk <= 1; R <= 1; S <= 0;
	#1 Clk <= 0; R <= 0; S <= 0;
 end
endmodule



