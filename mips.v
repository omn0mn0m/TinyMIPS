module mips #(parameter WIDTH = 8, REGBITS = 3)
    (input clk,
     input rst,
     input [WIDTH - 1:0] memdata,
     output memread,
     output memwrite,
     output [WIDTH - 1:0] writedata);

    wire [31:0] instr;
    wire        zero, alusrca, memtoreg, iord, pcen, regwrite, regdst;
    wire [1:0]  aluop, pcsource, alusrcb;
    wire [3:0]  inwrite;
    wire [2:0]  alucont;

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
                    .irwrite(irwrite));

    alucontrol ac(.aluop(aluop),
                  .funct(instr[31:26]),
                  .alucont(alucont));

    

endmodule