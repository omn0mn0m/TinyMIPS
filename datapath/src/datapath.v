`timescale 1ns/10ps

module datapath (adr, instr, writedata, zero, 
                 alucontrol, alusrca, alusrcb, iord, irwrite, memdata, 
		           memtoreg, pcen, pcsource, regdst, regwrite,
		           clk, reset, const_gnd) ;

   // INPUTS (13)
   input  [2:0]  alucontrol ;  // control signal for ALU
   input         alusrca    ;  // control signal for 2:1 mux for ALU's srca input
   input  [1:0]  alusrcb    ;  // control signal for 4:1 mux for ALU's srcb input
   input 	       iord       ;  // control signal for 2:1 mux from Program counter
   input  [3:0]  irwrite    ;  // control signal for the 4 DFF's holding the instruction
   input  [7:0]  memdata    ;  // 8-bit line coming from memory's RD line
   input 	       memtoreg   ;  // control signal for the 2:1 mux for memory's WD line
   input         pcen       ;  // control signal for PC's DFF
   input 	       regdst     ;  // control signal for 2:1 mux for memory's WA line
   input 	       regwrite   ;  // control signal for regfile
   input  [1:0]  pcsource   ;  // control signal for 4:1 mux leading to PC register
   input         clk, reset ; 
   input         const_gnd  ;  // Ground for constant values

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
   wire   [7:0]  to_mux_to_srca, srca, srcb, aluresult, aluout ;  // ALU & its MUX's & FF's wires
   wire   [7:0]  constx4      ;	 // output of shift left by 2 module

   // NOTE: notice, no REGS, this is purely comb. module, no always blocks

   // shift left constant field by 2 (constx4)
   // TODO: hint can easily be done using an assign statement
   assign constx4 = {instr[5:0], {2{const_gnd}}};

   // register file address fields
   // TODO: ra1 and ra2 can easily be wired using assign statement
   assign ra1 = instr[23:21];
   assign ra2 = instr[18:16];

   // 4 instruction registers
   // TODO: instance 4 8-bit DFF's to hold the single 32-bit instruction
   dff8bit instr_dtf1(.d(memdata),
           .clk(clk),
           .rst(reset),
           .en(irwrite[0]),
           .q(instr[31:24])
           );

   dff8bit instr_dtf2(.d(memdata),
           .clk(clk),
           .rst(reset),
           .en(irwrite[1]),
           .q(instr[23:16])
           );

   dff8bit instr_dtf3(.d(memdata),
           .clk(clk),
           .rst(reset),
           .en(irwrite[2]),
           .q(instr[15:8])
           );

   dff8bit instr_dtf4(.d(memdata),
           .clk(clk),
           .rst(reset),
           .en(irwrite[3]),
           .q(instr[7:0])
           );

   // instance remaining DFFs
   // TODO:
   dff8bit rd_dtf1(.d(rd1),
           .clk(clk),
           .rst(reset),
           .en(~const_gnd),
           .q(to_mux_to_srca) //wire connection to mux going to srca
           ); 

   dff8bit rd_dtf2(.d(rd2),
         .clk(clk),
         .rst(reset),
         .en(~const_gnd),
         .q(writedata)
         );

   dff8bit aluout_dtf(.d(aluresult),
         .clk(clk),
         .rst(reset),
         .en(~const_gnd),
         .q(aluout)
         );

   dff8bit pc_dtf(.d(nextpc),
         .clk(clk),
         .rst(reset),
         .en(pcen),
         .q(pc)
         );

   dff8bit data_dtf(.d(memdata),
         .clk(clk),
         .rst(reset),
         .en(~const_gnd),
         .q(data)
         );
   

   // instance remaining MUXs
   // TODO:
   mux rd1_mux(.a(to_mux_to_srca),
        .b(pc),
        .sel(alusrca),
        .out(srca)
        );

   mux4 rd2_mux(.a(writedata),
        .b({{7{const_gnd}}, ~const_gnd}),
        .c(instr[7:0]),
        .d(constx4),
        .sel(alusrcb),
        .out(srcb)
        );

   mux4 nextpc_mux(.a(aluresult),
        .b(aluout),
        .c(constx4),
        .d({8{const_gnd}}),
        .sel(pcsource),
        .out(nextpc)
        );

   mux adr_mux(.a(aluout),
        .b(pc),
        .sel(iord),
        .out(adr)
        );
      
   mux wd_mux(.a(data),
        .b(aluout),
        .sel(memtoreg),
        .out(wd)
        );
   
   mux_smallData wa_mux(.a(instr[13:11]),
        .b(instr[18:16]),
        .sel(regdst),
        .out(wa)
        );

   // instance register file
   // TODO:
   regfile test_reg(.rd1(rd1),
                    .rd2(rd2),
                    .clk(clk),
                    .regwrite(regwrite),
                    .ra1(ra1),
                    .ra2(ra2),
                    .wa(wa),
                    .wd(wd)
                    );

   // instance ALU
   // TODO:
   alu inst_alu(.result(aluresult),
                .a(srca),
                .b(srcb),
                .alucont(alucontrol)
                );
   
   // perform zero detect on output of ALU
   // TODO: could use simple assign statement, or NAND gate
   assign zero = (aluresult == 0);

endmodule
