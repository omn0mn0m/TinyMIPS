//-------------------------------------------------------
// mips_mem.v - connect mips to memory
// Erik Brunvand
//-------------------------------------------------------

// top level design includes both mips processor and memory
module mips_mem (clk, reset);
   input clk, reset;

   parameter WIDTH = 8;
   parameter REGBITS = 3;
   wire    memread, memwrite;
   wire    [WIDTH-1:0] adr, writedata;
   wire    [WIDTH-1:0] memdata;
   wire	   en = 1;

   

   // instantiate the mips processor
   mips mips1(.clk(clk), .rst(reset), .memdata(memdata), .memread(memread), .memwrite(memwrite), .adr(adr), .writedata(writedata));

   // instantiate memory for code and data
   exmem exmem1(.clk(clk), .en(en), .memwrite(memwrite), .adr(adr), .writedata(writedata), .memdata(memdata));

endmodule
