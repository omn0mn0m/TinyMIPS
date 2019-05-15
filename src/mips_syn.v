/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue May 14 01:01:39 2019
/////////////////////////////////////////////////////////////


module controller ( clk, rst, op, memread, memwrite, alusrca, memtoreg, iord, 
        regwrite, regdst, pcsource, alusrcb, aluop, irwrite, pcwrite, branch
 );
  input [5:0] op;
  output [1:0] pcsource;
  output [1:0] alusrcb;
  output [1:0] aluop;
  output [3:0] irwrite;
  input clk, rst;
  output memread, memwrite, alusrca, memtoreg, iord, regwrite, regdst, pcwrite,
         branch;
  wire   N45, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n16, n17, n18, n19, n20, n21, n22, n23, n24, n72, n73;
  wire   [3:0] state;

  DFFPOSX1 state_reg_0_ ( .D(N45), .CLK(clk), .Q(state[0]) );
  DFFPOSX1 state_reg_3_ ( .D(n6), .CLK(clk), .Q(state[3]) );
  DFFPOSX1 state_reg_2_ ( .D(n4), .CLK(clk), .Q(state[2]) );
  DFFPOSX1 state_reg_1_ ( .D(n3), .CLK(clk), .Q(state[1]) );
  INVX2 U3 ( .A(n28), .Y(pcsource[1]) );
  INVX2 U4 ( .A(n25), .Y(memtoreg) );
  INVX2 U5 ( .A(n31), .Y(irwrite[3]) );
  INVX2 U7 ( .A(n39), .Y(aluop[1]) );
  INVX2 U8 ( .A(n38), .Y(aluop[0]) );
  AND2X2 U9 ( .A(n11), .B(op[5]), .Y(n62) );
  NAND3X1 U34 ( .A(n25), .B(n19), .C(n26), .Y(regwrite) );
  NOR2X1 U35 ( .A(n72), .B(n27), .Y(regdst) );
  NAND2X1 U36 ( .A(n14), .B(n28), .Y(pcwrite) );
  NAND3X1 U37 ( .A(state[2]), .B(state[3]), .C(n29), .Y(n28) );
  NOR2X1 U38 ( .A(state[1]), .B(n17), .Y(n29) );
  NAND3X1 U39 ( .A(state[3]), .B(n72), .C(n16), .Y(n25) );
  NAND2X1 U40 ( .A(n14), .B(n30), .Y(memread) );
  NAND3X1 U41 ( .A(n30), .B(n18), .C(n26), .Y(iord) );
  NAND3X1 U42 ( .A(state[1]), .B(state[3]), .C(n32), .Y(n26) );
  NOR2X1 U43 ( .A(n27), .B(state[1]), .Y(memwrite) );
  NAND3X1 U44 ( .A(state[0]), .B(n24), .C(state[3]), .Y(n27) );
  NAND2X1 U45 ( .A(n33), .B(n34), .Y(alusrcb[1]) );
  NAND2X1 U46 ( .A(n14), .B(n33), .Y(alusrcb[0]) );
  NAND3X1 U47 ( .A(n31), .B(n21), .C(n36), .Y(n35) );
  NOR2X1 U48 ( .A(irwrite[0]), .B(irwrite[1]), .Y(n36) );
  NAND3X1 U49 ( .A(n38), .B(n39), .C(n34), .Y(alusrca) );
  NAND3X1 U50 ( .A(state[3]), .B(n72), .C(n32), .Y(n38) );
  OAI21X1 U51 ( .A(n41), .B(n42), .C(n73), .Y(n40) );
  OAI21X1 U52 ( .A(n10), .B(n11), .C(n43), .Y(n42) );
  NAND3X1 U53 ( .A(n22), .B(n44), .C(n45), .Y(n43) );
  OAI21X1 U54 ( .A(op[1]), .B(n7), .C(n46), .Y(n44) );
  NAND2X1 U55 ( .A(n30), .B(n39), .Y(n41) );
  NAND3X1 U56 ( .A(state[2]), .B(state[1]), .C(n47), .Y(n30) );
  NOR2X1 U57 ( .A(state[3]), .B(n17), .Y(n47) );
  OAI21X1 U58 ( .A(n49), .B(n50), .C(n73), .Y(n48) );
  OAI21X1 U59 ( .A(n51), .B(n33), .C(n31), .Y(n50) );
  NAND3X1 U60 ( .A(n72), .B(n23), .C(n32), .Y(n31) );
  AOI22X1 U61 ( .A(n45), .B(n52), .C(n9), .D(n7), .Y(n51) );
  OAI21X1 U62 ( .A(n12), .B(n54), .C(n46), .Y(n52) );
  NAND3X1 U63 ( .A(n53), .B(n12), .C(op[1]), .Y(n46) );
  NAND2X1 U64 ( .A(n53), .B(n13), .Y(n54) );
  NAND2X1 U65 ( .A(n21), .B(n55), .Y(n49) );
  NOR2X1 U66 ( .A(n56), .B(n72), .Y(irwrite[2]) );
  OAI21X1 U67 ( .A(n58), .B(n59), .C(n73), .Y(n57) );
  OAI21X1 U68 ( .A(n33), .B(n60), .C(n37), .Y(n59) );
  NAND3X1 U69 ( .A(state[1]), .B(n23), .C(n16), .Y(n37) );
  NAND3X1 U70 ( .A(n55), .B(n39), .C(n20), .Y(n58) );
  NOR2X1 U71 ( .A(n56), .B(state[1]), .Y(irwrite[0]) );
  NAND3X1 U72 ( .A(n24), .B(n23), .C(state[0]), .Y(n56) );
  NAND3X1 U73 ( .A(state[1]), .B(state[3]), .C(n16), .Y(n39) );
  OAI21X1 U74 ( .A(n62), .B(n63), .C(n64), .Y(n55) );
  OR2X1 U75 ( .A(n65), .B(n66), .Y(N45) );
  OAI21X1 U76 ( .A(state[1]), .B(state[0]), .C(n5), .Y(n66) );
  OAI22X1 U77 ( .A(n10), .B(n63), .C(n34), .D(n9), .Y(n67) );
  NOR2X1 U78 ( .A(n11), .B(op[5]), .Y(n63) );
  NOR2X1 U79 ( .A(n60), .B(n34), .Y(n64) );
  NAND3X1 U80 ( .A(state[1]), .B(n23), .C(n32), .Y(n34) );
  NOR2X1 U81 ( .A(n24), .B(state[0]), .Y(n32) );
  NAND3X1 U82 ( .A(n13), .B(n12), .C(n45), .Y(n60) );
  NAND3X1 U83 ( .A(n68), .B(n61), .C(n69), .Y(n65) );
  NOR2X1 U84 ( .A(state[3]), .B(rst), .Y(n69) );
  NAND2X1 U85 ( .A(n24), .B(n17), .Y(n61) );
  OAI21X1 U86 ( .A(n8), .B(n70), .C(n22), .Y(n68) );
  NAND3X1 U87 ( .A(state[2]), .B(state[0]), .C(n71), .Y(n33) );
  NOR2X1 U88 ( .A(state[3]), .B(state[1]), .Y(n71) );
  OAI21X1 U89 ( .A(n53), .B(n12), .C(n13), .Y(n70) );
  NOR2X1 U90 ( .A(op[5]), .B(op[3]), .Y(n53) );
  NOR2X1 U91 ( .A(op[4]), .B(op[0]), .Y(n45) );
  INVX2 U6 ( .A(n38), .Y(pcsource[0]) );
  INVX2 U10 ( .A(n38), .Y(branch) );
  INVX2 U11 ( .A(n57), .Y(n3) );
  INVX2 U12 ( .A(n48), .Y(n4) );
  INVX2 U13 ( .A(n67), .Y(n5) );
  INVX2 U14 ( .A(n40), .Y(n6) );
  INVX2 U15 ( .A(n53), .Y(n7) );
  INVX2 U16 ( .A(n45), .Y(n8) );
  INVX2 U17 ( .A(n60), .Y(n9) );
  INVX2 U18 ( .A(n64), .Y(n10) );
  INVX2 U19 ( .A(op[3]), .Y(n11) );
  INVX2 U20 ( .A(op[2]), .Y(n12) );
  INVX2 U21 ( .A(op[1]), .Y(n13) );
  INVX2 U22 ( .A(n35), .Y(n14) );
  INVX2 U23 ( .A(n37), .Y(irwrite[1]) );
  INVX2 U24 ( .A(n61), .Y(n16) );
  INVX2 U25 ( .A(state[0]), .Y(n17) );
  INVX2 U26 ( .A(memwrite), .Y(n18) );
  INVX2 U27 ( .A(regdst), .Y(n19) );
  INVX2 U28 ( .A(irwrite[0]), .Y(n20) );
  INVX2 U29 ( .A(irwrite[2]), .Y(n21) );
  INVX2 U30 ( .A(n33), .Y(n22) );
  INVX2 U31 ( .A(state[3]), .Y(n23) );
  INVX2 U32 ( .A(state[2]), .Y(n24) );
  INVX2 U33 ( .A(state[1]), .Y(n72) );
  INVX2 U92 ( .A(rst), .Y(n73) );
endmodule


module alucontrol ( alucont, aluop, funct );
  output [2:0] alucont;
  input [1:0] aluop;
  input [5:0] funct;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n1, n2, n3, n4, n5, n6;

  INVX2 U3 ( .A(n14), .Y(alucont[0]) );
  OAI21X1 U10 ( .A(aluop[1]), .B(n6), .C(n8), .Y(alucont[2]) );
  OAI21X1 U11 ( .A(n9), .B(n10), .C(aluop[1]), .Y(n8) );
  OAI21X1 U12 ( .A(funct[2]), .B(n5), .C(funct[5]), .Y(n10) );
  NAND3X1 U13 ( .A(n4), .B(n1), .C(n11), .Y(n9) );
  OAI21X1 U14 ( .A(n12), .B(n13), .C(aluop[1]), .Y(alucont[1]) );
  NAND2X1 U15 ( .A(funct[5]), .B(n11), .Y(n13) );
  NAND2X1 U16 ( .A(funct[3]), .B(n4), .Y(n11) );
  NAND3X1 U17 ( .A(n3), .B(n1), .C(n5), .Y(n12) );
  OAI21X1 U18 ( .A(n15), .B(n16), .C(aluop[1]), .Y(n14) );
  OAI21X1 U19 ( .A(n4), .B(n3), .C(funct[5]), .Y(n16) );
  NAND3X1 U20 ( .A(n2), .B(n1), .C(n5), .Y(n15) );
  INVX2 U4 ( .A(funct[4]), .Y(n1) );
  INVX2 U5 ( .A(funct[3]), .Y(n2) );
  INVX2 U6 ( .A(funct[2]), .Y(n3) );
  INVX2 U7 ( .A(funct[1]), .Y(n4) );
  INVX2 U8 ( .A(funct[0]), .Y(n5) );
  INVX2 U9 ( .A(aluop[0]), .Y(n6) );
endmodule


module dff8bit_8 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n1, n2, n3, n4, n5,
         n6, n7, n8;

  DFFPOSX1 q_reg_7_ ( .D(n1), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n2), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n3), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n4), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n5), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n6), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n7), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n8), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n10), .C(q[0]), .D(n11), .Y(n9) );
  AOI22X1 U11 ( .A(d[1]), .B(n10), .C(q[1]), .D(n11), .Y(n12) );
  AOI22X1 U12 ( .A(d[2]), .B(n10), .C(q[2]), .D(n11), .Y(n13) );
  AOI22X1 U13 ( .A(d[3]), .B(n10), .C(q[3]), .D(n11), .Y(n14) );
  AOI22X1 U14 ( .A(d[4]), .B(n10), .C(q[4]), .D(n11), .Y(n15) );
  AOI22X1 U15 ( .A(d[5]), .B(n10), .C(q[5]), .D(n11), .Y(n16) );
  AOI22X1 U16 ( .A(d[6]), .B(n10), .C(q[6]), .D(n11), .Y(n17) );
  AOI22X1 U17 ( .A(d[7]), .B(n10), .C(q[7]), .D(n11), .Y(n18) );
  NOR2X1 U18 ( .A(n11), .B(rst), .Y(n10) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n11) );
  INVX2 U2 ( .A(n18), .Y(n1) );
  INVX2 U3 ( .A(n17), .Y(n2) );
  INVX2 U4 ( .A(n16), .Y(n3) );
  INVX2 U5 ( .A(n15), .Y(n4) );
  INVX2 U6 ( .A(n14), .Y(n5) );
  INVX2 U7 ( .A(n13), .Y(n6) );
  INVX2 U8 ( .A(n12), .Y(n7) );
  INVX2 U9 ( .A(n9), .Y(n8) );
endmodule


module dff8bit_7 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n1), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n2), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n3), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n4), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n5), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n6), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n7), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n8), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n19), .Y(n1) );
  INVX2 U3 ( .A(n20), .Y(n2) );
  INVX2 U4 ( .A(n21), .Y(n3) );
  INVX2 U5 ( .A(n22), .Y(n4) );
  INVX2 U6 ( .A(n23), .Y(n5) );
  INVX2 U7 ( .A(n24), .Y(n6) );
  INVX2 U8 ( .A(n25), .Y(n7) );
  INVX2 U9 ( .A(n28), .Y(n8) );
endmodule


module dff8bit_6 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n1), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n2), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n3), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n4), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n5), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n6), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n7), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n8), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n19), .Y(n1) );
  INVX2 U3 ( .A(n20), .Y(n2) );
  INVX2 U4 ( .A(n21), .Y(n3) );
  INVX2 U5 ( .A(n22), .Y(n4) );
  INVX2 U6 ( .A(n23), .Y(n5) );
  INVX2 U7 ( .A(n24), .Y(n6) );
  INVX2 U8 ( .A(n25), .Y(n7) );
  INVX2 U9 ( .A(n28), .Y(n8) );
endmodule


module dff8bit_5 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n1), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n2), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n3), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n4), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n5), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n6), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n7), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n8), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n19), .Y(n1) );
  INVX2 U3 ( .A(n20), .Y(n2) );
  INVX2 U4 ( .A(n21), .Y(n3) );
  INVX2 U5 ( .A(n22), .Y(n4) );
  INVX2 U6 ( .A(n23), .Y(n5) );
  INVX2 U7 ( .A(n24), .Y(n6) );
  INVX2 U8 ( .A(n25), .Y(n7) );
  INVX2 U9 ( .A(n28), .Y(n8) );
endmodule


module dff8bit_4 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n8), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n7), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n6), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n5), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n4), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n3), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n2), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n1), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n28), .Y(n1) );
  INVX2 U3 ( .A(n25), .Y(n2) );
  INVX2 U4 ( .A(n24), .Y(n3) );
  INVX2 U5 ( .A(n23), .Y(n4) );
  INVX2 U6 ( .A(n22), .Y(n5) );
  INVX2 U7 ( .A(n21), .Y(n6) );
  INVX2 U8 ( .A(n20), .Y(n7) );
  INVX2 U9 ( .A(n19), .Y(n8) );
endmodule


module dff8bit_3 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n8), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n7), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n6), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n5), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n4), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n3), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n2), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n1), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n28), .Y(n1) );
  INVX2 U3 ( .A(n25), .Y(n2) );
  INVX2 U4 ( .A(n24), .Y(n3) );
  INVX2 U5 ( .A(n23), .Y(n4) );
  INVX2 U6 ( .A(n22), .Y(n5) );
  INVX2 U7 ( .A(n21), .Y(n6) );
  INVX2 U8 ( .A(n20), .Y(n7) );
  INVX2 U9 ( .A(n19), .Y(n8) );
endmodule


module dff8bit_2 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n2), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n3), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n4), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n5), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n6), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n7), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n8), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n1), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n28), .Y(n1) );
  INVX2 U3 ( .A(n19), .Y(n2) );
  INVX2 U4 ( .A(n20), .Y(n3) );
  INVX2 U5 ( .A(n21), .Y(n4) );
  INVX2 U6 ( .A(n22), .Y(n5) );
  INVX2 U7 ( .A(n23), .Y(n6) );
  INVX2 U8 ( .A(n24), .Y(n7) );
  INVX2 U9 ( .A(n25), .Y(n8) );
endmodule


module dff8bit_1 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n2), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n3), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n4), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n5), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n6), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n7), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n8), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n1), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n28), .Y(n1) );
  INVX2 U3 ( .A(n19), .Y(n2) );
  INVX2 U4 ( .A(n20), .Y(n3) );
  INVX2 U5 ( .A(n21), .Y(n4) );
  INVX2 U6 ( .A(n22), .Y(n5) );
  INVX2 U7 ( .A(n23), .Y(n6) );
  INVX2 U8 ( .A(n24), .Y(n7) );
  INVX2 U9 ( .A(n25), .Y(n8) );
endmodule


module dff8bit_0 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;

  DFFPOSX1 q_reg_7_ ( .D(n1), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n2), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n3), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n4), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n5), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n6), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n7), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n8), .CLK(clk), .Q(q[0]) );
  AOI22X1 U10 ( .A(d[0]), .B(n27), .C(q[0]), .D(n26), .Y(n28) );
  AOI22X1 U11 ( .A(d[1]), .B(n27), .C(q[1]), .D(n26), .Y(n25) );
  AOI22X1 U12 ( .A(d[2]), .B(n27), .C(q[2]), .D(n26), .Y(n24) );
  AOI22X1 U13 ( .A(d[3]), .B(n27), .C(q[3]), .D(n26), .Y(n23) );
  AOI22X1 U14 ( .A(d[4]), .B(n27), .C(q[4]), .D(n26), .Y(n22) );
  AOI22X1 U15 ( .A(d[5]), .B(n27), .C(q[5]), .D(n26), .Y(n21) );
  AOI22X1 U16 ( .A(d[6]), .B(n27), .C(q[6]), .D(n26), .Y(n20) );
  AOI22X1 U17 ( .A(d[7]), .B(n27), .C(q[7]), .D(n26), .Y(n19) );
  NOR2X1 U18 ( .A(n26), .B(rst), .Y(n27) );
  NOR2X1 U19 ( .A(en), .B(rst), .Y(n26) );
  INVX2 U2 ( .A(n19), .Y(n1) );
  INVX2 U3 ( .A(n20), .Y(n2) );
  INVX2 U4 ( .A(n21), .Y(n3) );
  INVX2 U5 ( .A(n22), .Y(n4) );
  INVX2 U6 ( .A(n23), .Y(n5) );
  INVX2 U7 ( .A(n24), .Y(n6) );
  INVX2 U8 ( .A(n25), .Y(n7) );
  INVX2 U9 ( .A(n28), .Y(n8) );
endmodule


module mux_2 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n1;

  INVX2 U1 ( .A(n10), .Y(out[7]) );
  INVX2 U2 ( .A(n11), .Y(out[6]) );
  INVX2 U3 ( .A(n12), .Y(out[5]) );
  INVX2 U4 ( .A(n13), .Y(out[4]) );
  INVX2 U5 ( .A(n14), .Y(out[3]) );
  INVX2 U6 ( .A(n15), .Y(out[2]) );
  INVX2 U7 ( .A(n16), .Y(out[1]) );
  INVX2 U8 ( .A(n17), .Y(out[0]) );
  AOI22X1 U10 ( .A(sel), .B(a[7]), .C(b[7]), .D(n1), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(sel), .C(b[6]), .D(n1), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(sel), .C(b[5]), .D(n1), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(sel), .C(b[4]), .D(n1), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(sel), .C(b[3]), .D(n1), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(sel), .C(b[2]), .D(n1), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(sel), .C(b[1]), .D(n1), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(sel), .C(b[0]), .D(n1), .Y(n17) );
  INVX2 U9 ( .A(sel), .Y(n1) );
endmodule


module mux4_1 ( a, b, c, d, sel, out );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] out;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n1;

  AND2X2 U1 ( .A(sel[1]), .B(n1), .Y(n5) );
  AND2X2 U2 ( .A(sel[1]), .B(sel[0]), .Y(n4) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(out[7]) );
  AOI22X1 U5 ( .A(d[7]), .B(n4), .C(c[7]), .D(n5), .Y(n3) );
  AOI22X1 U6 ( .A(b[7]), .B(n6), .C(a[7]), .D(n7), .Y(n2) );
  NAND2X1 U7 ( .A(n8), .B(n9), .Y(out[6]) );
  AOI22X1 U8 ( .A(d[6]), .B(n4), .C(c[6]), .D(n5), .Y(n9) );
  AOI22X1 U9 ( .A(b[6]), .B(n6), .C(a[6]), .D(n7), .Y(n8) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(out[5]) );
  AOI22X1 U11 ( .A(d[5]), .B(n4), .C(c[5]), .D(n5), .Y(n11) );
  AOI22X1 U12 ( .A(b[5]), .B(n6), .C(a[5]), .D(n7), .Y(n10) );
  NAND2X1 U13 ( .A(n12), .B(n13), .Y(out[4]) );
  AOI22X1 U14 ( .A(d[4]), .B(n4), .C(c[4]), .D(n5), .Y(n13) );
  AOI22X1 U15 ( .A(b[4]), .B(n6), .C(a[4]), .D(n7), .Y(n12) );
  NAND2X1 U16 ( .A(n14), .B(n15), .Y(out[3]) );
  AOI22X1 U17 ( .A(d[3]), .B(n4), .C(c[3]), .D(n5), .Y(n15) );
  AOI22X1 U18 ( .A(b[3]), .B(n6), .C(a[3]), .D(n7), .Y(n14) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Y(out[2]) );
  AOI22X1 U20 ( .A(d[2]), .B(n4), .C(c[2]), .D(n5), .Y(n17) );
  AOI22X1 U21 ( .A(b[2]), .B(n6), .C(a[2]), .D(n7), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n19), .Y(out[1]) );
  AOI22X1 U23 ( .A(d[1]), .B(n4), .C(c[1]), .D(n5), .Y(n19) );
  AOI22X1 U24 ( .A(b[1]), .B(n6), .C(a[1]), .D(n7), .Y(n18) );
  NAND2X1 U25 ( .A(n20), .B(n21), .Y(out[0]) );
  AOI22X1 U26 ( .A(d[0]), .B(n4), .C(c[0]), .D(n5), .Y(n21) );
  AOI22X1 U27 ( .A(b[0]), .B(n6), .C(a[0]), .D(n7), .Y(n20) );
  NOR2X1 U28 ( .A(sel[0]), .B(sel[1]), .Y(n7) );
  NOR2X1 U29 ( .A(n1), .B(sel[1]), .Y(n6) );
  INVX2 U3 ( .A(sel[0]), .Y(n1) );
endmodule


module mux4_0 ( a, b, c, d, sel, out );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] out;
  wire   n1, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41;

  AND2X2 U1 ( .A(sel[1]), .B(n1), .Y(n38) );
  AND2X2 U2 ( .A(sel[1]), .B(sel[0]), .Y(n39) );
  NAND2X1 U4 ( .A(n41), .B(n40), .Y(out[7]) );
  AOI22X1 U5 ( .A(d[7]), .B(n39), .C(c[7]), .D(n38), .Y(n40) );
  AOI22X1 U6 ( .A(b[7]), .B(n37), .C(a[7]), .D(n36), .Y(n41) );
  NAND2X1 U7 ( .A(n35), .B(n34), .Y(out[6]) );
  AOI22X1 U8 ( .A(d[6]), .B(n39), .C(c[6]), .D(n38), .Y(n34) );
  AOI22X1 U9 ( .A(b[6]), .B(n37), .C(a[6]), .D(n36), .Y(n35) );
  NAND2X1 U10 ( .A(n33), .B(n32), .Y(out[5]) );
  AOI22X1 U11 ( .A(d[5]), .B(n39), .C(c[5]), .D(n38), .Y(n32) );
  AOI22X1 U12 ( .A(b[5]), .B(n37), .C(a[5]), .D(n36), .Y(n33) );
  NAND2X1 U13 ( .A(n31), .B(n30), .Y(out[4]) );
  AOI22X1 U14 ( .A(d[4]), .B(n39), .C(c[4]), .D(n38), .Y(n30) );
  AOI22X1 U15 ( .A(b[4]), .B(n37), .C(a[4]), .D(n36), .Y(n31) );
  NAND2X1 U16 ( .A(n29), .B(n28), .Y(out[3]) );
  AOI22X1 U17 ( .A(d[3]), .B(n39), .C(c[3]), .D(n38), .Y(n28) );
  AOI22X1 U18 ( .A(b[3]), .B(n37), .C(a[3]), .D(n36), .Y(n29) );
  NAND2X1 U19 ( .A(n27), .B(n26), .Y(out[2]) );
  AOI22X1 U20 ( .A(d[2]), .B(n39), .C(c[2]), .D(n38), .Y(n26) );
  AOI22X1 U21 ( .A(b[2]), .B(n37), .C(a[2]), .D(n36), .Y(n27) );
  NAND2X1 U22 ( .A(n25), .B(n24), .Y(out[1]) );
  AOI22X1 U23 ( .A(d[1]), .B(n39), .C(c[1]), .D(n38), .Y(n24) );
  AOI22X1 U24 ( .A(b[1]), .B(n37), .C(a[1]), .D(n36), .Y(n25) );
  NAND2X1 U25 ( .A(n23), .B(n22), .Y(out[0]) );
  AOI22X1 U26 ( .A(d[0]), .B(n39), .C(c[0]), .D(n38), .Y(n22) );
  AOI22X1 U27 ( .A(b[0]), .B(n37), .C(a[0]), .D(n36), .Y(n23) );
  NOR2X1 U28 ( .A(sel[0]), .B(sel[1]), .Y(n36) );
  NOR2X1 U29 ( .A(n1), .B(sel[1]), .Y(n37) );
  INVX2 U3 ( .A(sel[0]), .Y(n1) );
endmodule


module mux_1 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;

  INVX2 U1 ( .A(n9), .Y(out[7]) );
  INVX2 U2 ( .A(n8), .Y(out[6]) );
  INVX2 U3 ( .A(n7), .Y(out[5]) );
  INVX2 U4 ( .A(n6), .Y(out[4]) );
  INVX2 U5 ( .A(n5), .Y(out[3]) );
  INVX2 U6 ( .A(n4), .Y(out[2]) );
  INVX2 U7 ( .A(n3), .Y(out[1]) );
  INVX2 U8 ( .A(n2), .Y(out[0]) );
  AOI22X1 U10 ( .A(sel), .B(a[7]), .C(b[7]), .D(n1), .Y(n9) );
  AOI22X1 U11 ( .A(a[6]), .B(sel), .C(b[6]), .D(n1), .Y(n8) );
  AOI22X1 U12 ( .A(a[5]), .B(sel), .C(b[5]), .D(n1), .Y(n7) );
  AOI22X1 U13 ( .A(a[4]), .B(sel), .C(b[4]), .D(n1), .Y(n6) );
  AOI22X1 U14 ( .A(a[3]), .B(sel), .C(b[3]), .D(n1), .Y(n5) );
  AOI22X1 U15 ( .A(a[2]), .B(sel), .C(b[2]), .D(n1), .Y(n4) );
  AOI22X1 U16 ( .A(a[1]), .B(sel), .C(b[1]), .D(n1), .Y(n3) );
  AOI22X1 U17 ( .A(a[0]), .B(sel), .C(b[0]), .D(n1), .Y(n2) );
  INVX2 U9 ( .A(sel), .Y(n1) );
endmodule


module mux_0 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;

  INVX2 U1 ( .A(n9), .Y(out[7]) );
  INVX2 U2 ( .A(n8), .Y(out[6]) );
  INVX2 U3 ( .A(n7), .Y(out[5]) );
  INVX2 U4 ( .A(n6), .Y(out[4]) );
  INVX2 U5 ( .A(n5), .Y(out[3]) );
  INVX2 U6 ( .A(n4), .Y(out[2]) );
  INVX2 U7 ( .A(n3), .Y(out[1]) );
  INVX2 U8 ( .A(n2), .Y(out[0]) );
  AOI22X1 U10 ( .A(sel), .B(a[7]), .C(b[7]), .D(n1), .Y(n9) );
  AOI22X1 U11 ( .A(a[6]), .B(sel), .C(b[6]), .D(n1), .Y(n8) );
  AOI22X1 U12 ( .A(a[5]), .B(sel), .C(b[5]), .D(n1), .Y(n7) );
  AOI22X1 U13 ( .A(a[4]), .B(sel), .C(b[4]), .D(n1), .Y(n6) );
  AOI22X1 U14 ( .A(a[3]), .B(sel), .C(b[3]), .D(n1), .Y(n5) );
  AOI22X1 U15 ( .A(a[2]), .B(sel), .C(b[2]), .D(n1), .Y(n4) );
  AOI22X1 U16 ( .A(a[1]), .B(sel), .C(b[1]), .D(n1), .Y(n3) );
  AOI22X1 U17 ( .A(a[0]), .B(sel), .C(b[0]), .D(n1), .Y(n2) );
  INVX2 U9 ( .A(sel), .Y(n1) );
endmodule


module mux_smallData ( a, b, sel, out );
  input [2:0] a;
  input [2:0] b;
  output [2:0] out;
  input sel;
  wire   n5, n6, n7, n1;

  INVX2 U1 ( .A(n5), .Y(out[2]) );
  INVX2 U2 ( .A(n6), .Y(out[1]) );
  INVX2 U3 ( .A(n7), .Y(out[0]) );
  AOI22X1 U5 ( .A(sel), .B(a[2]), .C(b[2]), .D(n1), .Y(n5) );
  AOI22X1 U6 ( .A(a[1]), .B(sel), .C(b[1]), .D(n1), .Y(n6) );
  AOI22X1 U7 ( .A(a[0]), .B(sel), .C(b[0]), .D(n1), .Y(n7) );
  INVX2 U4 ( .A(sel), .Y(n1) );
endmodule


module regfile ( rd1, rd2, clk, regwrite, ra1, ra2, wa, wd );
  output [7:0] rd1;
  output [7:0] rd2;
  input [2:0] ra1;
  input [2:0] ra2;
  input [2:0] wa;
  input [7:0] wd;
  input clk, regwrite;
  wire   N37, N38, N39, N40, N41, N42, N43, N44, N47, N48, N49, N50, N51, N52,
         N53, N54, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287;
  wire   [63:0] REGS;

  DFFPOSX1 REGS_reg_7__7_ ( .D(n153), .CLK(clk), .Q(REGS[63]) );
  DFFPOSX1 REGS_reg_7__6_ ( .D(n152), .CLK(clk), .Q(REGS[62]) );
  DFFPOSX1 REGS_reg_7__5_ ( .D(n151), .CLK(clk), .Q(REGS[61]) );
  DFFPOSX1 REGS_reg_7__4_ ( .D(n150), .CLK(clk), .Q(REGS[60]) );
  DFFPOSX1 REGS_reg_7__3_ ( .D(n149), .CLK(clk), .Q(REGS[59]) );
  DFFPOSX1 REGS_reg_7__2_ ( .D(n148), .CLK(clk), .Q(REGS[58]) );
  DFFPOSX1 REGS_reg_7__1_ ( .D(n147), .CLK(clk), .Q(REGS[57]) );
  DFFPOSX1 REGS_reg_7__0_ ( .D(n146), .CLK(clk), .Q(REGS[56]) );
  DFFPOSX1 REGS_reg_6__7_ ( .D(n145), .CLK(clk), .Q(REGS[55]) );
  DFFPOSX1 REGS_reg_6__6_ ( .D(n144), .CLK(clk), .Q(REGS[54]) );
  DFFPOSX1 REGS_reg_6__5_ ( .D(n143), .CLK(clk), .Q(REGS[53]) );
  DFFPOSX1 REGS_reg_6__4_ ( .D(n142), .CLK(clk), .Q(REGS[52]) );
  DFFPOSX1 REGS_reg_6__3_ ( .D(n141), .CLK(clk), .Q(REGS[51]) );
  DFFPOSX1 REGS_reg_6__2_ ( .D(n140), .CLK(clk), .Q(REGS[50]) );
  DFFPOSX1 REGS_reg_6__1_ ( .D(n139), .CLK(clk), .Q(REGS[49]) );
  DFFPOSX1 REGS_reg_6__0_ ( .D(n138), .CLK(clk), .Q(REGS[48]) );
  DFFPOSX1 REGS_reg_5__7_ ( .D(n137), .CLK(clk), .Q(REGS[47]) );
  DFFPOSX1 REGS_reg_5__6_ ( .D(n136), .CLK(clk), .Q(REGS[46]) );
  DFFPOSX1 REGS_reg_5__5_ ( .D(n135), .CLK(clk), .Q(REGS[45]) );
  DFFPOSX1 REGS_reg_5__4_ ( .D(n134), .CLK(clk), .Q(REGS[44]) );
  DFFPOSX1 REGS_reg_5__3_ ( .D(n133), .CLK(clk), .Q(REGS[43]) );
  DFFPOSX1 REGS_reg_5__2_ ( .D(n132), .CLK(clk), .Q(REGS[42]) );
  DFFPOSX1 REGS_reg_5__1_ ( .D(n131), .CLK(clk), .Q(REGS[41]) );
  DFFPOSX1 REGS_reg_5__0_ ( .D(n130), .CLK(clk), .Q(REGS[40]) );
  DFFPOSX1 REGS_reg_4__7_ ( .D(n129), .CLK(clk), .Q(REGS[39]) );
  DFFPOSX1 REGS_reg_4__6_ ( .D(n128), .CLK(clk), .Q(REGS[38]) );
  DFFPOSX1 REGS_reg_4__5_ ( .D(n127), .CLK(clk), .Q(REGS[37]) );
  DFFPOSX1 REGS_reg_4__4_ ( .D(n126), .CLK(clk), .Q(REGS[36]) );
  DFFPOSX1 REGS_reg_4__3_ ( .D(n125), .CLK(clk), .Q(REGS[35]) );
  DFFPOSX1 REGS_reg_4__2_ ( .D(n124), .CLK(clk), .Q(REGS[34]) );
  DFFPOSX1 REGS_reg_4__1_ ( .D(n123), .CLK(clk), .Q(REGS[33]) );
  DFFPOSX1 REGS_reg_4__0_ ( .D(n122), .CLK(clk), .Q(REGS[32]) );
  DFFPOSX1 REGS_reg_3__7_ ( .D(n121), .CLK(clk), .Q(REGS[31]) );
  DFFPOSX1 REGS_reg_3__6_ ( .D(n120), .CLK(clk), .Q(REGS[30]) );
  DFFPOSX1 REGS_reg_3__5_ ( .D(n119), .CLK(clk), .Q(REGS[29]) );
  DFFPOSX1 REGS_reg_3__4_ ( .D(n118), .CLK(clk), .Q(REGS[28]) );
  DFFPOSX1 REGS_reg_3__3_ ( .D(n117), .CLK(clk), .Q(REGS[27]) );
  DFFPOSX1 REGS_reg_3__2_ ( .D(n116), .CLK(clk), .Q(REGS[26]) );
  DFFPOSX1 REGS_reg_3__1_ ( .D(n115), .CLK(clk), .Q(REGS[25]) );
  DFFPOSX1 REGS_reg_3__0_ ( .D(n114), .CLK(clk), .Q(REGS[24]) );
  DFFPOSX1 REGS_reg_2__7_ ( .D(n113), .CLK(clk), .Q(REGS[23]) );
  DFFPOSX1 REGS_reg_2__6_ ( .D(n112), .CLK(clk), .Q(REGS[22]) );
  DFFPOSX1 REGS_reg_2__5_ ( .D(n111), .CLK(clk), .Q(REGS[21]) );
  DFFPOSX1 REGS_reg_2__4_ ( .D(n110), .CLK(clk), .Q(REGS[20]) );
  DFFPOSX1 REGS_reg_2__3_ ( .D(n109), .CLK(clk), .Q(REGS[19]) );
  DFFPOSX1 REGS_reg_2__2_ ( .D(n108), .CLK(clk), .Q(REGS[18]) );
  DFFPOSX1 REGS_reg_2__1_ ( .D(n107), .CLK(clk), .Q(REGS[17]) );
  DFFPOSX1 REGS_reg_2__0_ ( .D(n106), .CLK(clk), .Q(REGS[16]) );
  DFFPOSX1 REGS_reg_1__7_ ( .D(n105), .CLK(clk), .Q(REGS[15]) );
  DFFPOSX1 REGS_reg_1__6_ ( .D(n104), .CLK(clk), .Q(REGS[14]) );
  DFFPOSX1 REGS_reg_1__5_ ( .D(n103), .CLK(clk), .Q(REGS[13]) );
  DFFPOSX1 REGS_reg_1__4_ ( .D(n102), .CLK(clk), .Q(REGS[12]) );
  DFFPOSX1 REGS_reg_1__3_ ( .D(n101), .CLK(clk), .Q(REGS[11]) );
  DFFPOSX1 REGS_reg_1__2_ ( .D(n100), .CLK(clk), .Q(REGS[10]) );
  DFFPOSX1 REGS_reg_1__1_ ( .D(n99), .CLK(clk), .Q(REGS[9]) );
  DFFPOSX1 REGS_reg_1__0_ ( .D(n98), .CLK(clk), .Q(REGS[8]) );
  DFFPOSX1 REGS_reg_0__7_ ( .D(n97), .CLK(clk), .Q(REGS[7]) );
  DFFPOSX1 REGS_reg_0__6_ ( .D(n96), .CLK(clk), .Q(REGS[6]) );
  DFFPOSX1 REGS_reg_0__5_ ( .D(n95), .CLK(clk), .Q(REGS[5]) );
  DFFPOSX1 REGS_reg_0__4_ ( .D(n94), .CLK(clk), .Q(REGS[4]) );
  DFFPOSX1 REGS_reg_0__3_ ( .D(n93), .CLK(clk), .Q(REGS[3]) );
  DFFPOSX1 REGS_reg_0__2_ ( .D(n92), .CLK(clk), .Q(REGS[2]) );
  DFFPOSX1 REGS_reg_0__1_ ( .D(n91), .CLK(clk), .Q(REGS[1]) );
  DFFPOSX1 REGS_reg_0__0_ ( .D(n90), .CLK(clk), .Q(REGS[0]) );
  AND2X2 U2 ( .A(N47), .B(n276), .Y(rd2[7]) );
  AND2X2 U3 ( .A(N48), .B(n276), .Y(rd2[6]) );
  AND2X2 U4 ( .A(N49), .B(n276), .Y(rd2[5]) );
  AND2X2 U5 ( .A(N50), .B(n276), .Y(rd2[4]) );
  AND2X2 U6 ( .A(N51), .B(n276), .Y(rd2[3]) );
  AND2X2 U7 ( .A(N52), .B(n276), .Y(rd2[2]) );
  AND2X2 U8 ( .A(N53), .B(n276), .Y(rd2[1]) );
  AND2X2 U9 ( .A(N54), .B(n276), .Y(rd2[0]) );
  AND2X2 U10 ( .A(N37), .B(n275), .Y(rd1[7]) );
  AND2X2 U11 ( .A(N38), .B(n275), .Y(rd1[6]) );
  AND2X2 U12 ( .A(N39), .B(n275), .Y(rd1[5]) );
  AND2X2 U13 ( .A(N40), .B(n275), .Y(rd1[4]) );
  AND2X2 U14 ( .A(N41), .B(n275), .Y(rd1[3]) );
  AND2X2 U15 ( .A(N42), .B(n275), .Y(rd1[2]) );
  AND2X2 U16 ( .A(N43), .B(n275), .Y(rd1[1]) );
  AND2X2 U17 ( .A(N44), .B(n275), .Y(rd1[0]) );
  AND2X2 U18 ( .A(wa[2]), .B(regwrite), .Y(n25) );
  NOR3X1 U32 ( .A(ra2[1]), .B(ra2[2]), .C(ra2[0]), .Y(n14) );
  NOR3X1 U33 ( .A(ra1[1]), .B(ra1[2]), .C(ra1[0]), .Y(n15) );
  OAI21X1 U34 ( .A(n274), .B(n286), .C(n17), .Y(n138) );
  NAND2X1 U35 ( .A(REGS[48]), .B(n274), .Y(n17) );
  OAI21X1 U36 ( .A(n274), .B(n285), .C(n18), .Y(n139) );
  NAND2X1 U37 ( .A(REGS[49]), .B(n274), .Y(n18) );
  OAI21X1 U38 ( .A(n274), .B(n284), .C(n19), .Y(n140) );
  NAND2X1 U39 ( .A(REGS[50]), .B(n274), .Y(n19) );
  OAI21X1 U40 ( .A(n274), .B(n283), .C(n20), .Y(n141) );
  NAND2X1 U41 ( .A(REGS[51]), .B(n274), .Y(n20) );
  OAI21X1 U42 ( .A(n274), .B(n282), .C(n21), .Y(n142) );
  NAND2X1 U43 ( .A(REGS[52]), .B(n274), .Y(n21) );
  OAI21X1 U44 ( .A(n274), .B(n281), .C(n22), .Y(n143) );
  NAND2X1 U45 ( .A(REGS[53]), .B(n274), .Y(n22) );
  OAI21X1 U46 ( .A(n274), .B(n280), .C(n23), .Y(n144) );
  NAND2X1 U47 ( .A(REGS[54]), .B(n274), .Y(n23) );
  OAI21X1 U48 ( .A(n274), .B(n279), .C(n24), .Y(n145) );
  NAND2X1 U49 ( .A(REGS[55]), .B(n274), .Y(n24) );
  NAND3X1 U50 ( .A(n25), .B(n278), .C(wa[1]), .Y(n16) );
  OAI21X1 U51 ( .A(n286), .B(n272), .C(n27), .Y(n146) );
  NAND2X1 U52 ( .A(REGS[56]), .B(n272), .Y(n27) );
  OAI21X1 U53 ( .A(n285), .B(n272), .C(n28), .Y(n147) );
  NAND2X1 U54 ( .A(REGS[57]), .B(n272), .Y(n28) );
  OAI21X1 U55 ( .A(n284), .B(n272), .C(n29), .Y(n148) );
  NAND2X1 U56 ( .A(REGS[58]), .B(n272), .Y(n29) );
  OAI21X1 U57 ( .A(n283), .B(n272), .C(n30), .Y(n149) );
  NAND2X1 U58 ( .A(REGS[59]), .B(n272), .Y(n30) );
  OAI21X1 U59 ( .A(n282), .B(n272), .C(n31), .Y(n150) );
  NAND2X1 U60 ( .A(REGS[60]), .B(n272), .Y(n31) );
  OAI21X1 U61 ( .A(n281), .B(n272), .C(n32), .Y(n151) );
  NAND2X1 U62 ( .A(REGS[61]), .B(n272), .Y(n32) );
  OAI21X1 U63 ( .A(n280), .B(n272), .C(n33), .Y(n152) );
  NAND2X1 U64 ( .A(REGS[62]), .B(n272), .Y(n33) );
  OAI21X1 U65 ( .A(n279), .B(n272), .C(n34), .Y(n153) );
  NAND2X1 U66 ( .A(REGS[63]), .B(n272), .Y(n34) );
  NAND3X1 U67 ( .A(wa[1]), .B(n25), .C(wa[0]), .Y(n26) );
  OAI21X1 U68 ( .A(n286), .B(n270), .C(n36), .Y(n90) );
  NAND2X1 U69 ( .A(REGS[0]), .B(n270), .Y(n36) );
  OAI21X1 U70 ( .A(n285), .B(n270), .C(n37), .Y(n91) );
  NAND2X1 U71 ( .A(REGS[1]), .B(n270), .Y(n37) );
  OAI21X1 U72 ( .A(n284), .B(n270), .C(n38), .Y(n92) );
  NAND2X1 U73 ( .A(REGS[2]), .B(n270), .Y(n38) );
  OAI21X1 U74 ( .A(n283), .B(n270), .C(n39), .Y(n93) );
  NAND2X1 U75 ( .A(REGS[3]), .B(n270), .Y(n39) );
  OAI21X1 U76 ( .A(n282), .B(n270), .C(n40), .Y(n94) );
  NAND2X1 U77 ( .A(REGS[4]), .B(n270), .Y(n40) );
  OAI21X1 U78 ( .A(n281), .B(n270), .C(n41), .Y(n95) );
  NAND2X1 U79 ( .A(REGS[5]), .B(n270), .Y(n41) );
  OAI21X1 U80 ( .A(n280), .B(n270), .C(n42), .Y(n96) );
  NAND2X1 U81 ( .A(REGS[6]), .B(n270), .Y(n42) );
  OAI21X1 U82 ( .A(n279), .B(n270), .C(n43), .Y(n97) );
  NAND2X1 U83 ( .A(REGS[7]), .B(n270), .Y(n43) );
  NAND3X1 U84 ( .A(n278), .B(n277), .C(n44), .Y(n35) );
  OAI21X1 U85 ( .A(n286), .B(n268), .C(n46), .Y(n98) );
  NAND2X1 U86 ( .A(REGS[8]), .B(n268), .Y(n46) );
  OAI21X1 U87 ( .A(n285), .B(n268), .C(n47), .Y(n99) );
  NAND2X1 U88 ( .A(REGS[9]), .B(n268), .Y(n47) );
  OAI21X1 U89 ( .A(n284), .B(n268), .C(n48), .Y(n100) );
  NAND2X1 U90 ( .A(REGS[10]), .B(n268), .Y(n48) );
  OAI21X1 U91 ( .A(n283), .B(n268), .C(n49), .Y(n101) );
  NAND2X1 U92 ( .A(REGS[11]), .B(n268), .Y(n49) );
  OAI21X1 U93 ( .A(n282), .B(n268), .C(n50), .Y(n102) );
  NAND2X1 U94 ( .A(REGS[12]), .B(n268), .Y(n50) );
  OAI21X1 U95 ( .A(n281), .B(n268), .C(n51), .Y(n103) );
  NAND2X1 U96 ( .A(REGS[13]), .B(n268), .Y(n51) );
  OAI21X1 U97 ( .A(n280), .B(n268), .C(n52), .Y(n104) );
  NAND2X1 U98 ( .A(REGS[14]), .B(n268), .Y(n52) );
  OAI21X1 U99 ( .A(n279), .B(n268), .C(n53), .Y(n105) );
  NAND2X1 U100 ( .A(REGS[15]), .B(n268), .Y(n53) );
  NAND3X1 U101 ( .A(wa[0]), .B(n277), .C(n44), .Y(n45) );
  OAI21X1 U102 ( .A(n286), .B(n266), .C(n55), .Y(n106) );
  NAND2X1 U103 ( .A(REGS[16]), .B(n266), .Y(n55) );
  OAI21X1 U104 ( .A(n285), .B(n266), .C(n56), .Y(n107) );
  NAND2X1 U105 ( .A(REGS[17]), .B(n266), .Y(n56) );
  OAI21X1 U106 ( .A(n284), .B(n266), .C(n57), .Y(n108) );
  NAND2X1 U107 ( .A(REGS[18]), .B(n266), .Y(n57) );
  OAI21X1 U108 ( .A(n283), .B(n266), .C(n58), .Y(n109) );
  NAND2X1 U109 ( .A(REGS[19]), .B(n266), .Y(n58) );
  OAI21X1 U110 ( .A(n282), .B(n266), .C(n59), .Y(n110) );
  NAND2X1 U111 ( .A(REGS[20]), .B(n266), .Y(n59) );
  OAI21X1 U112 ( .A(n281), .B(n266), .C(n60), .Y(n111) );
  NAND2X1 U113 ( .A(REGS[21]), .B(n266), .Y(n60) );
  OAI21X1 U114 ( .A(n280), .B(n266), .C(n61), .Y(n112) );
  NAND2X1 U115 ( .A(REGS[22]), .B(n266), .Y(n61) );
  OAI21X1 U116 ( .A(n279), .B(n266), .C(n62), .Y(n113) );
  NAND2X1 U117 ( .A(REGS[23]), .B(n266), .Y(n62) );
  NAND3X1 U118 ( .A(wa[1]), .B(n278), .C(n44), .Y(n54) );
  OAI21X1 U119 ( .A(n286), .B(n264), .C(n64), .Y(n114) );
  NAND2X1 U120 ( .A(REGS[24]), .B(n264), .Y(n64) );
  OAI21X1 U121 ( .A(n285), .B(n264), .C(n65), .Y(n115) );
  NAND2X1 U122 ( .A(REGS[25]), .B(n264), .Y(n65) );
  OAI21X1 U123 ( .A(n284), .B(n264), .C(n66), .Y(n116) );
  NAND2X1 U124 ( .A(REGS[26]), .B(n264), .Y(n66) );
  OAI21X1 U125 ( .A(n283), .B(n264), .C(n67), .Y(n117) );
  NAND2X1 U126 ( .A(REGS[27]), .B(n264), .Y(n67) );
  OAI21X1 U127 ( .A(n282), .B(n264), .C(n68), .Y(n118) );
  NAND2X1 U128 ( .A(REGS[28]), .B(n264), .Y(n68) );
  OAI21X1 U129 ( .A(n281), .B(n264), .C(n69), .Y(n119) );
  NAND2X1 U130 ( .A(REGS[29]), .B(n264), .Y(n69) );
  OAI21X1 U131 ( .A(n280), .B(n264), .C(n70), .Y(n120) );
  NAND2X1 U132 ( .A(REGS[30]), .B(n264), .Y(n70) );
  OAI21X1 U133 ( .A(n279), .B(n264), .C(n71), .Y(n121) );
  NAND2X1 U134 ( .A(REGS[31]), .B(n264), .Y(n71) );
  NAND3X1 U135 ( .A(wa[0]), .B(wa[1]), .C(n44), .Y(n63) );
  NOR2X1 U136 ( .A(n287), .B(wa[2]), .Y(n44) );
  OAI21X1 U137 ( .A(n286), .B(n262), .C(n73), .Y(n122) );
  NAND2X1 U138 ( .A(REGS[32]), .B(n262), .Y(n73) );
  OAI21X1 U139 ( .A(n285), .B(n262), .C(n74), .Y(n123) );
  NAND2X1 U140 ( .A(REGS[33]), .B(n262), .Y(n74) );
  OAI21X1 U141 ( .A(n284), .B(n262), .C(n75), .Y(n124) );
  NAND2X1 U142 ( .A(REGS[34]), .B(n262), .Y(n75) );
  OAI21X1 U143 ( .A(n283), .B(n262), .C(n76), .Y(n125) );
  NAND2X1 U144 ( .A(REGS[35]), .B(n262), .Y(n76) );
  OAI21X1 U145 ( .A(n282), .B(n262), .C(n77), .Y(n126) );
  NAND2X1 U146 ( .A(REGS[36]), .B(n262), .Y(n77) );
  OAI21X1 U147 ( .A(n281), .B(n262), .C(n78), .Y(n127) );
  NAND2X1 U148 ( .A(REGS[37]), .B(n262), .Y(n78) );
  OAI21X1 U149 ( .A(n280), .B(n262), .C(n79), .Y(n128) );
  NAND2X1 U150 ( .A(REGS[38]), .B(n262), .Y(n79) );
  OAI21X1 U151 ( .A(n279), .B(n262), .C(n80), .Y(n129) );
  NAND2X1 U152 ( .A(REGS[39]), .B(n262), .Y(n80) );
  NAND3X1 U153 ( .A(n278), .B(n277), .C(n25), .Y(n72) );
  OAI21X1 U154 ( .A(n286), .B(n260), .C(n82), .Y(n130) );
  NAND2X1 U155 ( .A(REGS[40]), .B(n260), .Y(n82) );
  OAI21X1 U156 ( .A(n285), .B(n260), .C(n83), .Y(n131) );
  NAND2X1 U157 ( .A(REGS[41]), .B(n260), .Y(n83) );
  OAI21X1 U158 ( .A(n284), .B(n260), .C(n84), .Y(n132) );
  NAND2X1 U159 ( .A(REGS[42]), .B(n260), .Y(n84) );
  OAI21X1 U160 ( .A(n283), .B(n260), .C(n85), .Y(n133) );
  NAND2X1 U161 ( .A(REGS[43]), .B(n260), .Y(n85) );
  OAI21X1 U162 ( .A(n282), .B(n260), .C(n86), .Y(n134) );
  NAND2X1 U163 ( .A(REGS[44]), .B(n260), .Y(n86) );
  OAI21X1 U164 ( .A(n281), .B(n260), .C(n87), .Y(n135) );
  NAND2X1 U165 ( .A(REGS[45]), .B(n260), .Y(n87) );
  OAI21X1 U166 ( .A(n280), .B(n260), .C(n88), .Y(n136) );
  NAND2X1 U167 ( .A(REGS[46]), .B(n260), .Y(n88) );
  OAI21X1 U168 ( .A(n279), .B(n260), .C(n89), .Y(n137) );
  NAND2X1 U169 ( .A(REGS[47]), .B(n260), .Y(n89) );
  NAND3X1 U170 ( .A(n25), .B(n277), .C(wa[0]), .Y(n81) );
  INVX2 U19 ( .A(n269), .Y(n270) );
  INVX2 U20 ( .A(n35), .Y(n269) );
  INVX2 U21 ( .A(n261), .Y(n262) );
  INVX2 U22 ( .A(n72), .Y(n261) );
  INVX2 U23 ( .A(n2), .Y(n201) );
  INVX2 U24 ( .A(n1), .Y(n256) );
  INVX2 U25 ( .A(n271), .Y(n272) );
  INVX2 U26 ( .A(n26), .Y(n271) );
  INVX2 U27 ( .A(n259), .Y(n260) );
  INVX2 U28 ( .A(n81), .Y(n259) );
  INVX2 U29 ( .A(n267), .Y(n268) );
  INVX2 U30 ( .A(n45), .Y(n267) );
  INVX2 U31 ( .A(n265), .Y(n266) );
  INVX2 U171 ( .A(n54), .Y(n265) );
  INVX2 U172 ( .A(n263), .Y(n264) );
  INVX2 U173 ( .A(n63), .Y(n263) );
  INVX2 U174 ( .A(n273), .Y(n274) );
  INVX2 U175 ( .A(n16), .Y(n273) );
  OR2X1 U176 ( .A(n254), .B(n253), .Y(n1) );
  OR2X1 U177 ( .A(n199), .B(n198), .Y(n2) );
  INVX2 U178 ( .A(n7), .Y(n203) );
  INVX2 U179 ( .A(n5), .Y(n258) );
  INVX2 U180 ( .A(n4), .Y(n257) );
  INVX2 U181 ( .A(n3), .Y(n202) );
  INVX2 U182 ( .A(n8), .Y(n200) );
  INVX2 U183 ( .A(n6), .Y(n255) );
  OR2X1 U184 ( .A(ra1[1]), .B(ra1[2]), .Y(n3) );
  OR2X1 U185 ( .A(ra2[1]), .B(ra2[2]), .Y(n4) );
  OR2X1 U186 ( .A(n253), .B(ra2[2]), .Y(n5) );
  OR2X1 U187 ( .A(n254), .B(ra2[1]), .Y(n6) );
  OR2X1 U188 ( .A(n198), .B(ra1[2]), .Y(n7) );
  OR2X1 U189 ( .A(n199), .B(ra1[1]), .Y(n8) );
  AOI22X1 U190 ( .A(REGS[32]), .B(n200), .C(REGS[48]), .D(n201), .Y(n10) );
  AOI22X1 U191 ( .A(REGS[0]), .B(n202), .C(REGS[16]), .D(n203), .Y(n9) );
  AOI21X1 U192 ( .A(n10), .B(n9), .C(ra1[0]), .Y(n154) );
  AOI22X1 U193 ( .A(REGS[40]), .B(n200), .C(REGS[56]), .D(n201), .Y(n12) );
  AOI22X1 U194 ( .A(REGS[8]), .B(n202), .C(REGS[24]), .D(n203), .Y(n11) );
  AOI21X1 U195 ( .A(n12), .B(n11), .C(n197), .Y(n13) );
  OR2X1 U196 ( .A(n154), .B(n13), .Y(N44) );
  AOI22X1 U197 ( .A(REGS[33]), .B(n200), .C(REGS[49]), .D(n201), .Y(n156) );
  AOI22X1 U198 ( .A(REGS[1]), .B(n202), .C(REGS[17]), .D(n203), .Y(n155) );
  AOI21X1 U199 ( .A(n156), .B(n155), .C(ra1[0]), .Y(n160) );
  AOI22X1 U200 ( .A(REGS[41]), .B(n200), .C(REGS[57]), .D(n201), .Y(n158) );
  AOI22X1 U201 ( .A(REGS[9]), .B(n202), .C(REGS[25]), .D(n203), .Y(n157) );
  AOI21X1 U202 ( .A(n158), .B(n157), .C(n197), .Y(n159) );
  OR2X1 U203 ( .A(n160), .B(n159), .Y(N43) );
  AOI22X1 U204 ( .A(REGS[34]), .B(n200), .C(REGS[50]), .D(n201), .Y(n162) );
  AOI22X1 U205 ( .A(REGS[2]), .B(n202), .C(REGS[18]), .D(n203), .Y(n161) );
  AOI21X1 U206 ( .A(n162), .B(n161), .C(ra1[0]), .Y(n166) );
  AOI22X1 U207 ( .A(REGS[42]), .B(n200), .C(REGS[58]), .D(n201), .Y(n164) );
  AOI22X1 U208 ( .A(REGS[10]), .B(n202), .C(REGS[26]), .D(n203), .Y(n163) );
  AOI21X1 U209 ( .A(n164), .B(n163), .C(n197), .Y(n165) );
  OR2X1 U210 ( .A(n166), .B(n165), .Y(N42) );
  AOI22X1 U211 ( .A(REGS[35]), .B(n200), .C(REGS[51]), .D(n201), .Y(n168) );
  AOI22X1 U212 ( .A(REGS[3]), .B(n202), .C(REGS[19]), .D(n203), .Y(n167) );
  AOI21X1 U213 ( .A(n168), .B(n167), .C(ra1[0]), .Y(n172) );
  AOI22X1 U214 ( .A(REGS[43]), .B(n200), .C(REGS[59]), .D(n201), .Y(n170) );
  AOI22X1 U215 ( .A(REGS[11]), .B(n202), .C(REGS[27]), .D(n203), .Y(n169) );
  AOI21X1 U216 ( .A(n170), .B(n169), .C(n197), .Y(n171) );
  OR2X1 U217 ( .A(n172), .B(n171), .Y(N41) );
  AOI22X1 U218 ( .A(REGS[36]), .B(n200), .C(REGS[52]), .D(n201), .Y(n174) );
  AOI22X1 U219 ( .A(REGS[4]), .B(n202), .C(REGS[20]), .D(n203), .Y(n173) );
  AOI21X1 U220 ( .A(n174), .B(n173), .C(ra1[0]), .Y(n178) );
  AOI22X1 U221 ( .A(REGS[44]), .B(n200), .C(REGS[60]), .D(n201), .Y(n176) );
  AOI22X1 U222 ( .A(REGS[12]), .B(n202), .C(REGS[28]), .D(n203), .Y(n175) );
  AOI21X1 U223 ( .A(n176), .B(n175), .C(n197), .Y(n177) );
  OR2X1 U224 ( .A(n178), .B(n177), .Y(N40) );
  AOI22X1 U225 ( .A(REGS[37]), .B(n200), .C(REGS[53]), .D(n201), .Y(n180) );
  AOI22X1 U226 ( .A(REGS[5]), .B(n202), .C(REGS[21]), .D(n203), .Y(n179) );
  AOI21X1 U227 ( .A(n180), .B(n179), .C(ra1[0]), .Y(n184) );
  AOI22X1 U228 ( .A(REGS[45]), .B(n200), .C(REGS[61]), .D(n201), .Y(n182) );
  AOI22X1 U229 ( .A(REGS[13]), .B(n202), .C(REGS[29]), .D(n203), .Y(n181) );
  AOI21X1 U230 ( .A(n182), .B(n181), .C(n197), .Y(n183) );
  OR2X1 U231 ( .A(n184), .B(n183), .Y(N39) );
  AOI22X1 U232 ( .A(REGS[38]), .B(n200), .C(REGS[54]), .D(n201), .Y(n186) );
  AOI22X1 U233 ( .A(REGS[6]), .B(n202), .C(REGS[22]), .D(n203), .Y(n185) );
  AOI21X1 U234 ( .A(n186), .B(n185), .C(ra1[0]), .Y(n190) );
  AOI22X1 U235 ( .A(REGS[46]), .B(n200), .C(REGS[62]), .D(n201), .Y(n188) );
  AOI22X1 U236 ( .A(REGS[14]), .B(n202), .C(REGS[30]), .D(n203), .Y(n187) );
  AOI21X1 U237 ( .A(n188), .B(n187), .C(n197), .Y(n189) );
  OR2X1 U238 ( .A(n190), .B(n189), .Y(N38) );
  AOI22X1 U239 ( .A(REGS[39]), .B(n200), .C(REGS[55]), .D(n201), .Y(n192) );
  AOI22X1 U240 ( .A(REGS[7]), .B(n202), .C(REGS[23]), .D(n203), .Y(n191) );
  AOI21X1 U241 ( .A(n192), .B(n191), .C(ra1[0]), .Y(n196) );
  AOI22X1 U242 ( .A(REGS[47]), .B(n200), .C(REGS[63]), .D(n201), .Y(n194) );
  AOI22X1 U243 ( .A(REGS[15]), .B(n202), .C(REGS[31]), .D(n203), .Y(n193) );
  AOI21X1 U244 ( .A(n194), .B(n193), .C(n197), .Y(n195) );
  OR2X1 U245 ( .A(n196), .B(n195), .Y(N37) );
  INVX2 U246 ( .A(ra1[0]), .Y(n197) );
  INVX2 U247 ( .A(ra1[1]), .Y(n198) );
  INVX2 U248 ( .A(ra1[2]), .Y(n199) );
  AOI22X1 U249 ( .A(REGS[32]), .B(n255), .C(REGS[48]), .D(n256), .Y(n205) );
  AOI22X1 U250 ( .A(REGS[0]), .B(n257), .C(REGS[16]), .D(n258), .Y(n204) );
  AOI21X1 U251 ( .A(n205), .B(n204), .C(ra2[0]), .Y(n209) );
  AOI22X1 U252 ( .A(REGS[40]), .B(n255), .C(REGS[56]), .D(n256), .Y(n207) );
  AOI22X1 U253 ( .A(REGS[8]), .B(n257), .C(REGS[24]), .D(n258), .Y(n206) );
  AOI21X1 U254 ( .A(n207), .B(n206), .C(n252), .Y(n208) );
  OR2X1 U255 ( .A(n209), .B(n208), .Y(N54) );
  AOI22X1 U256 ( .A(REGS[33]), .B(n255), .C(REGS[49]), .D(n256), .Y(n211) );
  AOI22X1 U257 ( .A(REGS[1]), .B(n257), .C(REGS[17]), .D(n258), .Y(n210) );
  AOI21X1 U258 ( .A(n211), .B(n210), .C(ra2[0]), .Y(n215) );
  AOI22X1 U259 ( .A(REGS[41]), .B(n255), .C(REGS[57]), .D(n256), .Y(n213) );
  AOI22X1 U260 ( .A(REGS[9]), .B(n257), .C(REGS[25]), .D(n258), .Y(n212) );
  AOI21X1 U261 ( .A(n213), .B(n212), .C(n252), .Y(n214) );
  OR2X1 U262 ( .A(n215), .B(n214), .Y(N53) );
  AOI22X1 U263 ( .A(REGS[34]), .B(n255), .C(REGS[50]), .D(n256), .Y(n217) );
  AOI22X1 U264 ( .A(REGS[2]), .B(n257), .C(REGS[18]), .D(n258), .Y(n216) );
  AOI21X1 U265 ( .A(n217), .B(n216), .C(ra2[0]), .Y(n221) );
  AOI22X1 U266 ( .A(REGS[42]), .B(n255), .C(REGS[58]), .D(n256), .Y(n219) );
  AOI22X1 U267 ( .A(REGS[10]), .B(n257), .C(REGS[26]), .D(n258), .Y(n218) );
  AOI21X1 U268 ( .A(n219), .B(n218), .C(n252), .Y(n220) );
  OR2X1 U269 ( .A(n221), .B(n220), .Y(N52) );
  AOI22X1 U270 ( .A(REGS[35]), .B(n255), .C(REGS[51]), .D(n256), .Y(n223) );
  AOI22X1 U271 ( .A(REGS[3]), .B(n257), .C(REGS[19]), .D(n258), .Y(n222) );
  AOI21X1 U272 ( .A(n223), .B(n222), .C(ra2[0]), .Y(n227) );
  AOI22X1 U273 ( .A(REGS[43]), .B(n255), .C(REGS[59]), .D(n256), .Y(n225) );
  AOI22X1 U274 ( .A(REGS[11]), .B(n257), .C(REGS[27]), .D(n258), .Y(n224) );
  AOI21X1 U275 ( .A(n225), .B(n224), .C(n252), .Y(n226) );
  OR2X1 U276 ( .A(n227), .B(n226), .Y(N51) );
  AOI22X1 U277 ( .A(REGS[36]), .B(n255), .C(REGS[52]), .D(n256), .Y(n229) );
  AOI22X1 U278 ( .A(REGS[4]), .B(n257), .C(REGS[20]), .D(n258), .Y(n228) );
  AOI21X1 U279 ( .A(n229), .B(n228), .C(ra2[0]), .Y(n233) );
  AOI22X1 U280 ( .A(REGS[44]), .B(n255), .C(REGS[60]), .D(n256), .Y(n231) );
  AOI22X1 U281 ( .A(REGS[12]), .B(n257), .C(REGS[28]), .D(n258), .Y(n230) );
  AOI21X1 U282 ( .A(n231), .B(n230), .C(n252), .Y(n232) );
  OR2X1 U283 ( .A(n233), .B(n232), .Y(N50) );
  AOI22X1 U284 ( .A(REGS[37]), .B(n255), .C(REGS[53]), .D(n256), .Y(n235) );
  AOI22X1 U285 ( .A(REGS[5]), .B(n257), .C(REGS[21]), .D(n258), .Y(n234) );
  AOI21X1 U286 ( .A(n235), .B(n234), .C(ra2[0]), .Y(n239) );
  AOI22X1 U287 ( .A(REGS[45]), .B(n255), .C(REGS[61]), .D(n256), .Y(n237) );
  AOI22X1 U288 ( .A(REGS[13]), .B(n257), .C(REGS[29]), .D(n258), .Y(n236) );
  AOI21X1 U289 ( .A(n237), .B(n236), .C(n252), .Y(n238) );
  OR2X1 U290 ( .A(n239), .B(n238), .Y(N49) );
  AOI22X1 U291 ( .A(REGS[38]), .B(n255), .C(REGS[54]), .D(n256), .Y(n241) );
  AOI22X1 U292 ( .A(REGS[6]), .B(n257), .C(REGS[22]), .D(n258), .Y(n240) );
  AOI21X1 U293 ( .A(n241), .B(n240), .C(ra2[0]), .Y(n245) );
  AOI22X1 U294 ( .A(REGS[46]), .B(n255), .C(REGS[62]), .D(n256), .Y(n243) );
  AOI22X1 U295 ( .A(REGS[14]), .B(n257), .C(REGS[30]), .D(n258), .Y(n242) );
  AOI21X1 U296 ( .A(n243), .B(n242), .C(n252), .Y(n244) );
  OR2X1 U297 ( .A(n245), .B(n244), .Y(N48) );
  AOI22X1 U298 ( .A(REGS[39]), .B(n255), .C(REGS[55]), .D(n256), .Y(n247) );
  AOI22X1 U299 ( .A(REGS[7]), .B(n257), .C(REGS[23]), .D(n258), .Y(n246) );
  AOI21X1 U300 ( .A(n247), .B(n246), .C(ra2[0]), .Y(n251) );
  AOI22X1 U301 ( .A(REGS[47]), .B(n255), .C(REGS[63]), .D(n256), .Y(n249) );
  AOI22X1 U302 ( .A(REGS[15]), .B(n257), .C(REGS[31]), .D(n258), .Y(n248) );
  AOI21X1 U303 ( .A(n249), .B(n248), .C(n252), .Y(n250) );
  OR2X1 U304 ( .A(n251), .B(n250), .Y(N47) );
  INVX2 U305 ( .A(ra2[0]), .Y(n252) );
  INVX2 U306 ( .A(ra2[1]), .Y(n253) );
  INVX2 U307 ( .A(ra2[2]), .Y(n254) );
  INVX2 U308 ( .A(n15), .Y(n275) );
  INVX2 U309 ( .A(n14), .Y(n276) );
  INVX2 U310 ( .A(wa[1]), .Y(n277) );
  INVX2 U311 ( .A(wa[0]), .Y(n278) );
  INVX2 U312 ( .A(wd[7]), .Y(n279) );
  INVX2 U313 ( .A(wd[6]), .Y(n280) );
  INVX2 U314 ( .A(wd[5]), .Y(n281) );
  INVX2 U315 ( .A(wd[4]), .Y(n282) );
  INVX2 U316 ( .A(wd[3]), .Y(n283) );
  INVX2 U317 ( .A(wd[2]), .Y(n284) );
  INVX2 U318 ( .A(wd[1]), .Y(n285) );
  INVX2 U319 ( .A(wd[0]), .Y(n286) );
  INVX2 U320 ( .A(regwrite), .Y(n287) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .YC(carry[2]), .YS(SUM[1]) );
  FAX1 U1_0 ( .A(A[0]), .B(B[0]), .C(CI), .YC(carry[1]), .YS(SUM[0]) );
endmodule


module alu ( result, a, b, alucont );
  output [7:0] result;
  input [7:0] a;
  input [7:0] b;
  input [2:0] alucont;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12;
  wire   [7:0] b2;
  wire   [7:0] sum;

  AND2X2 U2 ( .A(alucont[1]), .B(sum[7]), .Y(n32) );
  OAI21X1 U13 ( .A(n4), .B(n13), .C(n14), .Y(result[7]) );
  AOI22X1 U14 ( .A(sum[7]), .B(n15), .C(n5), .D(n16), .Y(n14) );
  OR2X1 U15 ( .A(a[7]), .B(b[7]), .Y(n16) );
  NAND2X1 U16 ( .A(a[7]), .B(n1), .Y(n13) );
  OAI21X1 U17 ( .A(n17), .B(n6), .C(n18), .Y(result[6]) );
  AOI22X1 U18 ( .A(b[6]), .B(n19), .C(sum[6]), .D(n15), .Y(n18) );
  OAI21X1 U19 ( .A(alucont[1]), .B(n6), .C(n17), .Y(n19) );
  OAI21X1 U20 ( .A(n17), .B(n7), .C(n20), .Y(result[5]) );
  AOI22X1 U21 ( .A(b[5]), .B(n21), .C(sum[5]), .D(n15), .Y(n20) );
  OAI21X1 U22 ( .A(alucont[1]), .B(n7), .C(n17), .Y(n21) );
  OAI21X1 U23 ( .A(n17), .B(n8), .C(n22), .Y(result[4]) );
  AOI22X1 U24 ( .A(b[4]), .B(n23), .C(sum[4]), .D(n15), .Y(n22) );
  OAI21X1 U25 ( .A(alucont[1]), .B(n8), .C(n17), .Y(n23) );
  OAI21X1 U26 ( .A(n17), .B(n9), .C(n24), .Y(result[3]) );
  AOI22X1 U27 ( .A(b[3]), .B(n25), .C(sum[3]), .D(n15), .Y(n24) );
  OAI21X1 U28 ( .A(alucont[1]), .B(n9), .C(n17), .Y(n25) );
  OAI21X1 U29 ( .A(n17), .B(n10), .C(n26), .Y(result[2]) );
  AOI22X1 U30 ( .A(b[2]), .B(n27), .C(sum[2]), .D(n15), .Y(n26) );
  OAI21X1 U31 ( .A(alucont[1]), .B(n10), .C(n17), .Y(n27) );
  OAI21X1 U32 ( .A(n17), .B(n11), .C(n28), .Y(result[1]) );
  AOI22X1 U33 ( .A(b[1]), .B(n29), .C(sum[1]), .D(n15), .Y(n28) );
  OAI21X1 U34 ( .A(alucont[1]), .B(n11), .C(n17), .Y(n29) );
  NAND2X1 U35 ( .A(n30), .B(n31), .Y(result[0]) );
  AOI22X1 U36 ( .A(n32), .B(alucont[0]), .C(b[0]), .D(n33), .Y(n31) );
  OAI21X1 U37 ( .A(alucont[1]), .B(n12), .C(n17), .Y(n33) );
  AOI22X1 U38 ( .A(sum[0]), .B(n15), .C(a[0]), .D(n5), .Y(n30) );
  NAND2X1 U39 ( .A(alucont[0]), .B(n1), .Y(n17) );
  NOR2X1 U40 ( .A(n1), .B(alucont[0]), .Y(n15) );
  XNOR2X1 U41 ( .A(n4), .B(alucont[2]), .Y(b2[7]) );
  XOR2X1 U42 ( .A(b[6]), .B(alucont[2]), .Y(b2[6]) );
  XOR2X1 U43 ( .A(b[5]), .B(alucont[2]), .Y(b2[5]) );
  XOR2X1 U44 ( .A(b[4]), .B(n3), .Y(b2[4]) );
  XOR2X1 U45 ( .A(b[3]), .B(n3), .Y(b2[3]) );
  XOR2X1 U46 ( .A(b[2]), .B(n3), .Y(b2[2]) );
  XOR2X1 U47 ( .A(b[1]), .B(n3), .Y(b2[1]) );
  XOR2X1 U48 ( .A(b[0]), .B(n3), .Y(b2[0]) );
  alu_DW01_add_0 add_1_root_add_13_2 ( .A(a), .B(b2), .CI(n3), .SUM(sum) );
  INVX2 U3 ( .A(n2), .Y(n3) );
  INVX2 U4 ( .A(alucont[2]), .Y(n2) );
  INVX2 U5 ( .A(alucont[1]), .Y(n1) );
  INVX2 U6 ( .A(b[7]), .Y(n4) );
  INVX2 U7 ( .A(n17), .Y(n5) );
  INVX2 U8 ( .A(a[6]), .Y(n6) );
  INVX2 U9 ( .A(a[5]), .Y(n7) );
  INVX2 U10 ( .A(a[4]), .Y(n8) );
  INVX2 U11 ( .A(a[3]), .Y(n9) );
  INVX2 U12 ( .A(a[2]), .Y(n10) );
  INVX2 U49 ( .A(a[1]), .Y(n11) );
  INVX2 U50 ( .A(a[0]), .Y(n12) );
endmodule


module datapath ( adr, instr, writedata, zero, alucontrol, alusrca, alusrcb, 
        iord, irwrite, memdata, memtoreg, pcen, pcsource, regdst, regwrite, 
        clk, reset, const_gnd );
  output [7:0] adr;
  output [31:0] instr;
  output [7:0] writedata;
  input [2:0] alucontrol;
  input [1:0] alusrcb;
  input [3:0] irwrite;
  input [7:0] memdata;
  input [1:0] pcsource;
  input alusrca, iord, memtoreg, pcen, regdst, regwrite, clk, reset, const_gnd;
  output zero;
  wire   n2, n3, n4, n5, n6, n7, n1, n8, n9, n10;
  wire   [7:0] rd1;
  wire   [7:0] to_mux_to_srca;
  wire   [7:0] rd2;
  wire   [7:0] aluresult;
  wire   [7:0] aluout;
  wire   [7:0] nextpc;
  wire   [7:0] pc;
  wire   [7:0] data;
  wire   [7:0] srca;
  wire   [7:0] srcb;
  wire   [7:0] wd;
  wire   [2:0] wa;

  NOR2X1 U2 ( .A(n2), .B(n3), .Y(zero) );
  NAND2X1 U3 ( .A(n4), .B(n5), .Y(n3) );
  NOR2X1 U4 ( .A(aluresult[3]), .B(aluresult[2]), .Y(n5) );
  NOR2X1 U5 ( .A(aluresult[1]), .B(aluresult[0]), .Y(n4) );
  NAND2X1 U6 ( .A(n6), .B(n7), .Y(n2) );
  NOR2X1 U7 ( .A(aluresult[7]), .B(aluresult[6]), .Y(n7) );
  NOR2X1 U8 ( .A(aluresult[5]), .B(aluresult[4]), .Y(n6) );
  dff8bit_8 instr_dtf1 ( .d(memdata), .clk(clk), .rst(n10), .en(irwrite[0]), 
        .q(instr[31:24]) );
  dff8bit_7 instr_dtf2 ( .d(memdata), .clk(clk), .rst(n10), .en(irwrite[1]), 
        .q(instr[23:16]) );
  dff8bit_6 instr_dtf3 ( .d(memdata), .clk(clk), .rst(reset), .en(irwrite[2]), 
        .q(instr[15:8]) );
  dff8bit_5 instr_dtf4 ( .d(memdata), .clk(clk), .rst(n10), .en(irwrite[3]), 
        .q(instr[7:0]) );
  dff8bit_4 rd_dtf1 ( .d(rd1), .clk(clk), .rst(n10), .en(n1), .q(
        to_mux_to_srca) );
  dff8bit_3 rd_dtf2 ( .d(rd2), .clk(clk), .rst(n10), .en(n1), .q(writedata) );
  dff8bit_2 aluout_dtf ( .d(aluresult), .clk(clk), .rst(reset), .en(n1), .q(
        aluout) );
  dff8bit_1 pc_dtf ( .d(nextpc), .clk(clk), .rst(n10), .en(pcen), .q(pc) );
  dff8bit_0 data_dtf ( .d(memdata), .clk(clk), .rst(reset), .en(n1), .q(data)
         );
  mux_2 rd1_mux ( .a(to_mux_to_srca), .b(pc), .sel(alusrca), .out(srca) );
  mux4_1 rd2_mux ( .a(writedata), .b({n8, n8, n8, n8, n8, n8, n8, n1}), .c(
        instr[7:0]), .d({instr[5:0], n8, n8}), .sel(alusrcb), .out(srcb) );
  mux4_0 nextpc_mux ( .a(aluresult), .b(aluout), .c({instr[5:0], n8, n8}), .d(
        {n8, n8, n8, n8, n8, n8, n8, n8}), .sel(pcsource), .out(nextpc) );
  mux_1 adr_mux ( .a(aluout), .b(pc), .sel(iord), .out(adr) );
  mux_0 wd_mux ( .a(data), .b(aluout), .sel(memtoreg), .out(wd) );
  mux_smallData wa_mux ( .a(instr[13:11]), .b(instr[18:16]), .sel(regdst), 
        .out(wa) );
  regfile test_reg ( .rd1(rd1), .rd2(rd2), .clk(clk), .regwrite(regwrite), 
        .ra1(instr[23:21]), .ra2(instr[18:16]), .wa(wa), .wd(wd) );
  alu inst_alu ( .result(aluresult), .a(srca), .b(srcb), .alucont(alucontrol)
         );
  INVX2 U1 ( .A(n1), .Y(n8) );
  INVX2 U9 ( .A(n9), .Y(n10) );
  INVX2 U10 ( .A(const_gnd), .Y(n1) );
  INVX2 U11 ( .A(reset), .Y(n9) );
endmodule


module pc_controller ( pcwrite, branch, zero, pcen );
  input pcwrite, branch, zero;
  output pcen;
  wire   n2;

  INVX2 U1 ( .A(n2), .Y(pcen) );
  AOI21X1 U2 ( .A(zero), .B(branch), .C(pcwrite), .Y(n2) );
endmodule


module mips ( clk, rst, memdata, memread, memwrite, writedata, adr, const_gnd
 );
  input [7:0] memdata;
  output [7:0] writedata;
  output [7:0] adr;
  input clk, rst, const_gnd;
  output memread, memwrite;
  wire   alusrca, memtoreg, iord, regwrite, regdst, pcwrite, branch, pcen,
         zero, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20;
  wire   [31:0] instr;
  wire   [1:0] pcsource;
  wire   [1:0] alusrcb;
  wire   [1:0] aluop;
  wire   [3:0] irwrite;
  wire   [2:0] alucont;

  controller cont ( .clk(clk), .rst(n2), .op(instr[31:26]), .memread(memread), 
        .memwrite(memwrite), .alusrca(alusrca), .memtoreg(memtoreg), .iord(
        iord), .regwrite(regwrite), .regdst(regdst), .pcsource(pcsource), 
        .alusrcb(alusrcb), .aluop(aluop), .irwrite(irwrite), .pcwrite(pcwrite), 
        .branch(branch) );
  alucontrol ac ( .alucont(alucont), .aluop(aluop), .funct(instr[5:0]) );
  datapath dp ( .adr(adr), .instr({instr[31:26], SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17, 
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, 
        SYNOPSYS_UNCONNECTED_20, instr[5:0]}), .writedata(writedata), .zero(
        zero), .alucontrol(alucont), .alusrca(alusrca), .alusrcb(alusrcb), 
        .iord(iord), .irwrite(irwrite), .memdata({n18, n16, n14, n12, n10, n8, 
        n6, n4}), .memtoreg(memtoreg), .pcen(pcen), .pcsource(pcsource), 
        .regdst(regdst), .regwrite(regwrite), .clk(clk), .reset(n2), 
        .const_gnd(const_gnd) );
  pc_controller pc ( .pcwrite(pcwrite), .branch(branch), .zero(zero), .pcen(
        pcen) );
  INVX2 U1 ( .A(rst), .Y(n1) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(memdata[0]), .Y(n3) );
  INVX2 U4 ( .A(n3), .Y(n4) );
  INVX2 U5 ( .A(memdata[1]), .Y(n5) );
  INVX2 U6 ( .A(n5), .Y(n6) );
  INVX2 U7 ( .A(memdata[2]), .Y(n7) );
  INVX2 U8 ( .A(n7), .Y(n8) );
  INVX2 U9 ( .A(memdata[3]), .Y(n9) );
  INVX2 U10 ( .A(n9), .Y(n10) );
  INVX2 U11 ( .A(memdata[4]), .Y(n11) );
  INVX2 U12 ( .A(n11), .Y(n12) );
  INVX2 U13 ( .A(memdata[5]), .Y(n13) );
  INVX2 U14 ( .A(n13), .Y(n14) );
  INVX2 U15 ( .A(memdata[6]), .Y(n15) );
  INVX2 U16 ( .A(n15), .Y(n16) );
  INVX2 U17 ( .A(memdata[7]), .Y(n17) );
  INVX2 U18 ( .A(n17), .Y(n18) );
endmodule

