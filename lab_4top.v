module lab_4top(input [8:0]SW, output [4:0] LEDG);
	testbench one();
endmodule

module adder(input [1:0]IN, input Cin, output led, output Cout);
//0 a
//1 b
//2 Cin
assign led = ((IN[0])&(!IN[1])&(!Cin))|((!IN[0])&(!IN[1])&(Cin))|((IN[0])&(IN[1])&(Cin))|((!IN[0])&(IN[1])&(!Cin)); //s
assign Cout = ((IN[0])&(IN[1]))|((IN[0])&(Cin))|((IN[1])&(Cin)); //cout
endmodule

module four_bit(input [8:0]S, output [4:0] LED);
	wire cout_1;
	wire cout_2;
	wire cout_3;
	adder bi(S[1:0], S[8],LED[0],cout_1);
	adder ci(S[3:2], cout_1,LED[1],cout_2);
	adder di(S[5:4], cout_2,LED[2],cout_3);
	adder ei(S[7:6], cout_3,LED[3],LED[4]);
endmodule

`timescale 10ns / 1ps
 module testbench ();
 wire [4:0]LED;
 reg [8:0]SWI;
 four_bit bitty (SWI[8:0], LED[4:0]);
 initial
 begin
	SWI <= {8{1'b0}};
	#10 SWI <= {8{1'b0}};
	#10 SWI <= {8'b00000001};
	#10 SWI <= {8'b00000010};
	#10 SWI <= {8'b00000011};
	#10 SWI <= {8'b00000100};
	#10 SWI <= {8'b00000101};
	#10 SWI <= {8'b00000110};
	#10 SWI <= {8'b00000111};
	#10 SWI <= {8'b00001000};
	#10 SWI <= {8'b00001001};
	#10 SWI <= {8'b01001000};
	#10 SWI <= {8'b00111000};
	#10 SWI <= {8'b11111111};
 end
endmodule