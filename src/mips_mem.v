//-------------------------------------------------------
// mips_mem.v - connect mips to memory
// Erik Brunvand
//-------------------------------------------------------

// top level design includes both mips processor and memory
module mips_mem #(parameter WIDTH = 8, REGBITS = 3)(clk, reset);
   input clk, reset;

   wire    memread, memwrite;
   wire    [WIDTH-1:0] adr, writedata;
   wire    [WIDTH-1:0] memdata;
   wire	   en = 1;

   // instantiate the mips processor
   mips #(WIDTH,REGBITS) mips1(clk, reset, memdata, memread, memwrite, adr, writedata);

   // instantiate memory for code and data
   exmem #(WIDTH) exmem1(clk, en, memwrite, adr, writedata, memdata);

endmodule
