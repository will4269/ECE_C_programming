module LAB_5_part2 (input CLOCK_50 ,output [9:0] LEDG);
// Register can only be on left hand side of equation inside an always block
reg [32:0] summed_counter ; // stores current count
// Runs once when posedge SW [0] is true . This is when SW [0] goes from off to on
always @ ( posedge CLOCK_50) begin
//1 ’b1 is the representation of binary 1 in Verilog
// This adds one to the current sum each posedge of SW [0]
summed_counter=summed_counter+ 1'b1;
end
// Display the current sum on the first four green LEDs
assign LEDG [9:0] = summed_counter [32:23];
endmodule
//maximum value represented is 2^4-1 or 15
// to increase the amount of leds increase summed counter and led in the assign statment