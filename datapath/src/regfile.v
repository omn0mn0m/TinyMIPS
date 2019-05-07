module regfile
    (rd1, rd2, clk, regwrite, ra1, ra2, wa, wd) ;

// This reg file will only have registers $zero, $s0->$s7
// On a READ, takes in addresses on lines: ra1 and ra2
// Spits out data for those registers on lines: rd1 and rd2

// On a WRITE, regwrite must equal 1 (to signal a write)
// Takes in address of register to write to on line: wa
// Takes in data to write to register on line: wd
// Only performs a WRITE on posedge of clk

    parameter WIDTH = 8;
   parameter REGBITS = 3;

   input        clk ;
   input        regwrite ;  // signal to command regfile to 'write' to a reg
   input  [REGBITS - 1:0] ra1 ;	    // 3-bit address of $s0 --> $s7 (source reg: RS)
   input  [REGBITS - 1:0] ra2 ;	    // 3-bit address of $s0 --> $s7 (source reg: RT)
   input  [REGBITS - 1:0] wa  ;  	    // 3-bit address of $s0 --> $s7 (destin reg: RD)

   input  [WIDTH - 1:0] wd  ;	    // 8-bit data to write to RD
   output [WIDTH - 1:0]  rd1, rd2 ; // 8-bit data to read from RS and RT

   // 2-dimensional register (8x8) -- holds actual registers $s0 through $s7
   reg  [WIDTH - 1:0] REGS [(1 << REGBITS) - 1:0];

   

   // WRITE
   always @(posedge clk)
      if (regwrite) REGS[wa] <= wd;	

   // READ
   assign rd1 = ra1 ? REGS[ra1] : 0;   // looks up address ra1 in reg array
   assign rd2 = ra2 ? REGS[ra2] : 0;   // looks up address ra2 in reg array
   				       // note: register 0 hardwired to 0

   // initial
	//begin
	//$monitor("Reg0 = %d :: Reg1 = %d :: Reg2 = %d :: Reg3 = %d :: Reg4 = %d Reg5 = %d :: Reg6 = %d :: Reg7 = %d", REGS[0], REGS[1], REGS[2], REGS[3], REGS[4], REGS[5], REGS[6], REGS[7]);
	//end
endmodule
