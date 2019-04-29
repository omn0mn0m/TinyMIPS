module datapath (adr, instr, writedata, zero, 
                 alucontrol, alusrca, alusrcb, iord, irwrite, memdata, 
		 memtoreg, pcen, pcsource, regdst, regwrite,
		 clk, reset ) ;

   // INPUTS (13)
   input  [2:0]  alucontrol ;  // control signal for ALU
   input         alusrca    ;  // control signal for 2:1 mux for ALU's srca input
   input  [1:0]  alusrcb    ;  // control signal for 4:1 mux for ALU's srcb input
   input 	 iord       ;  // control signal for 2:1 mux from Program counter
   input  [3:0]  irwrite    ;  // control signal for the 4 DFF's holding the instruction
   input  [7:0]  memdata    ;  // 8-bit line coming from memory's RD line
   input 	 memtoreg   ;  // control signal for the 2:1 mux for memory's WD line
   input         pcen       ;  // control signal for PC's DFF
   input 	 regdst     ;  // control signal for 2:1 mux for memory's WA line
   input 	 regwrite   ;  // control signal for regfile
   input  [1:0]  pcsource   ;  // control signal for 4:1 mux leading to PC register
   input         clk, reset ;  

   // OUTPUTS (4)
   output [ 7:0] adr        ;  // output coming from 2:1 mux from program counter
   output [31:0] instr      ;  // output coming from all 4 DFF's holding the instruction
   output [ 7:0] writedata  ;  // output leading to WD line on memory
   output        zero       ;  // output coming from zero detect module

   // WIRES (15) -- no additional wires needed
   wire   [2:0]  ra1, ra2, wa ;  // regfile's 3-bit inputs
   wire   [7:0]  rd1, rd2, wd ;  // regfile's 8-bit outputs/inputs
   wire   [7:0]  pc, nextpc   ;	 // program counter's wires
   wire   [7:0]  data         ;  // output of memdata's register
   wire   [7:0]  a, srca, srcb, aluresult, aluout ;  // ALU & its MUX's & FF's wires
   wire   [7:0]  constx4      ;	 // output of shift left by 2 module

   // NOTE: notice, no REGS, this is purely comb. module, no always blocks



   // shift left constant field by 2 (constx4)
   // TODO: hint can easily be done using an assign statement

   // register file address fields
   // TODO: ra1 and ra2 can easily be wired using assign statement

   // 4 instruction registers
   // TODO: instance 4 8-bit DFF's to hold the single 32-bit instruction

   // instance remaining DFFs
   // TODO:

   // instance remaining MUXs
   // TODO:

   // instance register file
   // TODO:

   // instance ALU
   // TODO:
   
   // perform zero detect on output of ALU
   // TODO: could use simple assign statement, or NAND gate

endmodule
