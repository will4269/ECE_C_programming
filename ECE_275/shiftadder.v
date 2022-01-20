`include "./shftadd3.v"
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
