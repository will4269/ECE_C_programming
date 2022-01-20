module lab7three (input CLOCK_50,input [2:0]SW,output [1:0]LEDG);
RS_Latch one (.Clk(CLOCK_50),.R(SW[0]),.S(SW[1]),.Q(LEDG[0]));
endmodule
module RS_Latch (
input Clk ,
input R,
input S,output Q);

wire R_g , S_g , Qa , Qb;
assign R_g = R & Clk;
assign S_g = S & Clk;
assign Qa = ~( R_g | Qb );
assign Qb = ~( S_g | Qa );
assign Q = Qa;
endmodule
//s=SW[0]
//clk=sw
