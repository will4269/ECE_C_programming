`include "../../vmodules/Modules.v"
module lab7two (input [7:0] SW ,output [6:0] HEX0_D ,output [6:0] HEX1_D ,output [6:0] HEX2_D);
Modules c2bcd1 (.S(SW[7:0]) ,.HEX0(HEX0_D[6:0]),.HEX1(HEX1_D[6:0]),.HEX2(HEX2_D[6:0]));
//bcd axe (.BCD(converted_BCD[3:0]) , .HEX0(HEX0_D));
//bcd axes (.BCD(converted_BCD [7:4]) , .HEX1(HEX1_D));
//bcd baxes (.BCD(converted_BCD [11:8]) , .HEX2(HEX2_D));
endmodule 
