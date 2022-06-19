`include "master.v"
module TB_master;

	// Inputs
	reg [15:0] add;
	reg clk;
	reg cs;
	reg MISO;

	// Outputs
	wire MOSI;
	wire [15:0] data;

	// Instantiate the Unit Under Test (UUT)
	master uut (
		.add(add), 
		.clk(clk), 
		.cs(cs), 
		.MISO(MISO), 
		.MOSI(MOSI), 
		.data(data)
	);

	initial begin
        $dumpfile("mastertb.vcd");
        $dumpvars(0, TB_master);
		// Initialize Inputs
		add = 16'b1000101101010010;
		clk = 0;
		cs = 1;
		#3 cs = 0;
	end
	
	initial
		begin
			#10 MISO = 1;
			#10 MISO = 0;
			#10 MISO = 0;
			#10 MISO = 0;
			#10 MISO = 1;
			#10 MISO = 0;
			#10 MISO = 0;
			#10 MISO = 1;
			#10 MISO = 1;
			#10 MISO = 1;
			#10 MISO = 0;
			#10 MISO = 0;
			#10 MISO = 1;
			#10 MISO = 0;
			#10 MISO = 0;
			#10 MISO = 1;
			#20 $finish;
		end

	always #5 clk = ~clk;
	
endmodule
