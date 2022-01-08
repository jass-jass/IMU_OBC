//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:33 01/04/2022 
// Design Name: 
// Module Name:    shift_register_piso 
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
module shift_register_piso(clk,on,pi,so);

input clk, on;
input [15:0]pi;
reg [15:0]q;
output so;
reg load = 1'b1;

always @(posedge clk)
	if(on)
	begin
		if(load == 1'b1)
			begin
				q = pi;
				load <= 1'b0;
			end
		q[0] <= 1'b0;
		q[1] <= q[0];
		q[2] <= q[1];
		q[3] <= q[2];
		q[4] <= q[3];
		q[5] <= q[4];
		q[6] <= q[5];
		q[7] <= q[6];
		q[8] <= q[7];
		q[9] <= q[8];
		q[10] <= q[9];
		q[11] <= q[10];
		q[12] <= q[11];
		q[13] <= q[12];
		q[14] <= q[13];
		q[15] <= q[14];
	end
assign so = q[15];	
endmodule