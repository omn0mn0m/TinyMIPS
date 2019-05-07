`timescale 1ns/10ps

module mips
    ( clk, rst, memdata, memread, memwrite, writedata, adr, const_gnd); //added adr for datapath  (see pg 4 of mips overview)

    parameter WIDTH = 8;
    parameter REGBITS = 3;

    input clk;
    input rst;
    input [WIDTH - 1:0] memdata;
    input const_gnd;
    output memread;
    output memwrite;
    output [WIDTH - 1:0] writedata;
    output [WIDTH - 1:0] adr;

    wire [31:0] instr;
    wire        zero, alusrca, memtoreg, iord, pcen, regwrite, regdst;
    wire [1:0]  aluop, pcsource, alusrcb;
    wire [3:0]  irwrite;
    wire [2:0]  alucont;
    wire pcwrite, branch;

    controller cont(.clk(clk),
                    .rst(rst),
                    .op(instr[31:26]),
                    .memread(memread),
                    .memwrite(memwrite),
                    .alusrca(alusrca),
                    .memtoreg(memtoreg),
                    .iord(iord),
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
                .alusrca(alusrca),
                .alusrcb(alusrcb),
                .iord(iord),
                .pcen(pcen),
                .zero(zero),
                .irwrite(irwrite),
                .memtoreg(memtoreg),
                .pcsource(pcsource),
                .regwrite(regwrite),
                .regdst(regdst),
                .instr(instr),
                .alucontrol(alucont),
                .const_gnd(const_gnd)
                );

    pc_controller pc(.zero(zero),
                     .pcen(pcen),
                     .pcwrite(pcwrite),
                     .branch(branch));

endmodule
