//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:26 01/04/2022 
// Design Name: 
// Module Name:    shift_register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module shift_register_sipo(clk,si,po);

input clk,si;
output reg [15:0]po;
reg counter = 0;
integer i;

always @(negedge clk)
	begin
		po[0] <= si;
		po[1] <= po[0];
		po[2] <= po[1];
		po[3] <= po[2];
		po[4] <= po[3];
		po[5] <= po[4];
		po[6] <= po[5];
		po[7] <= po[6];
		po[8] <= po[7];
		po[9] <= po[8];
		po[10] <= po[9];
		po[11] <= po[10];
		po[12] <= po[11];
		po[13] <= po[12];
		po[14] <= po[13];
		po[15] <= po[14];	
	end

endmodule
