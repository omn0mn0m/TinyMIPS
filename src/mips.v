module mips #(parameter WIDTH = 8, REGBITS = 3)
    (input clk,
     input rst,
     input [WIDTH - 1:0] memdata,
     output memread,
     output memwrite,
     output [WIDTH - 1:0] writedata,
     output [WIDTH - 1:0] adr); //added adr for datapath  (see pg 4 of mips overview)

    wire [31:0] instr;
    wire        zero, alusrca, memtoreg, iord, pcen, regwrite, regdst;
    wire [1:0]  aluop, pcsource, alusrcb;
    wire [3:0]  irwrite;
    wire [2:0]  alucont;
    wire pcwrite, branch;

    controller cont(.clk(clk),
                    .rst(rst),
                    .op(instr[31:26]),
                    .zero(zero),
                    .memread(memread),
                    .memwrite(memwrite),
                    .alusrca(alusrca),
                    .memtoreg(memtoreg),
                    .iord(iord),
                    .pcen(pcen),
                    .regwrite(regwrite),
                    .regdst(regdst),
                    .pcsource(pcsource),
                    .alusrcb(alusrcb),
                    .aluop(aluop),
                    .irwrite(irwrite),
                    .pcwrite(pcwrite),
                    .branch(branch));

    alucontrol ac(.aluop(aluop),
                  .funct(instr[5:0]), //changing this from .funct(instr[31:26]) to .funct(instr[5:0])
                  .alucont(alucont));

    datapath dp(.clk(clk),
                .reset(rst),
                .memdata(memdata),
                .adr(adr),
                .writedata(writedata),
                .zero(zero),
                .pcen(pcen),
                .alusrca(alusrca),
                .alusrcb(alusrcb),
                .iord(iord),
                .irwrite(irwrite),
                .memtoreg(memtoreg),
                .pcsource(pcsource),
                .regwrite(regwrite),
                .regdst(regdst),
                .instr(instr),
                .alucontrol(alucont)
                );

    pc_controller pc(.zero(zero),
                     .pcen(pcen),
                     .pcwrite(pcwrite),
                     .branch(branch));

endmodule
