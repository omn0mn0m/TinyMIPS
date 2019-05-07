//-------------------------------------------------------
// Test the mips together with memory
// Created by: Erik Brunvand of UofU
// Modified by: William Gibb at GWU, 2010
//-------------------------------------------------------
`timescale 1ns/10ps

// top level design for testing
module top_tb #(parameter WIDTH = 8, REGBITS = 3)();

   parameter FINISHTIME = 20000;
   parameter CLKPERIOD  = 40;


   reg clk = 0;
   reg reset = 1;

   // instantiate devices to be tested
   mips_mem #(WIDTH,REGBITS) dut(.clk(clk),
                                 .reset(reset));

   // initialize the test, then quit after a while
   initial
      begin
         reset <= 1; 
         #(4*CLKPERIOD) reset <= 0;
         #FINISHTIME 
	 $display("Finishing Simulation due to simulation constraint.");
	$finish; 
      end

   // generate clock to sequence the tests
   always #CLKPERIOD clk <= ~clk; 

   // check the data on the memory interface of the mips_dut
   // Check whenever the memwrite signal is active
   always@(negedge clk) begin
      if(dut.memwrite) begin
         if(dut.adr == 8'hff & dut.writedata == 8'h0D) begin
            $display("Fibonacci Simulation was successful!!!");
		      #(4*CLKPERIOD)
	         $display("Ending Simulation.");
            $finish;
		   end
         else begin 
            $display("Fibonacci Simulation has failed...");
            $display("Data at address FF should be 0D");
		      #(4*CLKPERIOD)
	         $display("Ending Simulation.");
            $finish;
         end
      end
   end

	initial	
	begin
		// for generic verilog
		//$dumpfile("waves.lxt");
		//$dumpvars(0,top_tb);
		// for cadence
		$shm_open("top_tb.db");
		$shm_probe(top_tb,"AS");

	end

endmodule
