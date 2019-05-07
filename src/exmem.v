//-------------------------------------------------------
// Model of 256-word 8-bit memory for the mips processor. 
// Erik Brunvand
//-------------------------------------------------------
`timescale 1ns/10ps

module exmem
   (input clk, memwrite,
    input [7:0] adr,
    input [7:0] writedata,
    output reg [7:0] memdata
    );

	integer i;
   reg [7:0] mips_ram [0:256];

	parameter WIDTH = 8; 
	parameter RAM_ADDR_BITS = 8;

	// The following $readmemh statement initializes the RAM contents 
	// via an external file (use $readmemb for binary data). The fib.dat 
	// file is a list of bytes, one per line, starting at address 0.  
	initial begin
		for(i=0; i<256; i=i+1) begin
			mips_ram[i]=8'b0;
		end

		$display("RAM: Memory initialized to 0");

		$readmemh("./src/memory_files/fib.dat", mips_ram);
//		$readmemb("./src/memory_files/add.dat", mips_ram);
		$display ("RAM: External Memory File: ram.dat loaded into RAM.");
	end

	integer k;
	initial begin
		$display("RAM: Contents of Mem after reading data file:");
		for (k=0; k<256; k=k+1) $display("%d:%h",k,mips_ram[k]);
	end

 // The behavioral description of the RAM - note clocked behavior
   always @(negedge clk) begin
		if (memwrite) begin
			mips_ram[adr] <= writedata;
			$writememb("./src/memory_files/ram.after.dat", mips_ram) ; //write out contents of ram to file
		end

		memdata <= mips_ram[adr];
	end
endmodule
