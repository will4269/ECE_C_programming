`include "./shiftadder.v"
`include "./bcd.v"
module Modules (input [7:0]S,output [6:0]HEX0,output [6:0]HEX1,output [6:0]HEX2,output [3:0]LED);
//shftadd3(S[3:0],LED[3:0]);
wire [11:0]BCD;
shiftadder now (S[7:0],BCD[11:0]);
bcd disp_one (BCD[3:0],HEX0);
bcd disp_two (BCD[7:4], HEX1);
bcd disp_three (BCD[11:8], HEX2);
endmodule
