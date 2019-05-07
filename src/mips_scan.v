/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue May  7 02:51:51 2019
/////////////////////////////////////////////////////////////


module alucontrol ( alucont, aluop, funct );
  output [2:0] alucont;
  input [1:0] aluop;
  input [5:0] funct;
  wire   n8, n9, n10, n11, n12, n13, n14, n7, n15, n16, n17, n18, n19;

  INVX2 U3 ( .A(n13), .Y(alucont[0]) );
  OAI21X1 U10 ( .A(aluop[1]), .B(n19), .C(n8), .Y(alucont[2]) );
  OAI21X1 U11 ( .A(n9), .B(n10), .C(aluop[1]), .Y(n8) );
  OAI21X1 U12 ( .A(funct[2]), .B(n18), .C(n17), .Y(n10) );
  OAI21X1 U13 ( .A(n11), .B(n12), .C(aluop[1]), .Y(alucont[1]) );
  OAI21X1 U14 ( .A(funct[1]), .B(n15), .C(funct[5]), .Y(n12) );
  NAND3X1 U15 ( .A(n16), .B(n7), .C(n18), .Y(n11) );
  OAI21X1 U16 ( .A(n9), .B(n14), .C(aluop[1]), .Y(n13) );
  OAI21X1 U17 ( .A(n17), .B(n16), .C(n18), .Y(n14) );
  NAND3X1 U18 ( .A(n15), .B(n7), .C(funct[5]), .Y(n9) );
  INVX2 U4 ( .A(funct[4]), .Y(n7) );
  INVX2 U5 ( .A(funct[3]), .Y(n15) );
  INVX2 U6 ( .A(funct[2]), .Y(n16) );
  INVX2 U7 ( .A(funct[1]), .Y(n17) );
  INVX2 U8 ( .A(funct[0]), .Y(n18) );
  INVX2 U9 ( .A(aluop[0]), .Y(n19) );
endmodule


module pc_controller ( pcwrite, branch, zero, pcen );
  input pcwrite, branch, zero;
  output pcen;
  wire   n2;

  INVX2 U1 ( .A(n2), .Y(pcen) );
  AOI21X1 U2 ( .A(zero), .B(branch), .C(pcwrite), .Y(n2) );
endmodule


module mux_2 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n2;

  INVX2 U1 ( .A(n10), .Y(out[7]) );
  INVX2 U2 ( .A(n11), .Y(out[6]) );
  INVX2 U3 ( .A(n12), .Y(out[5]) );
  INVX2 U4 ( .A(n13), .Y(out[4]) );
  INVX2 U5 ( .A(n14), .Y(out[3]) );
  INVX2 U6 ( .A(n15), .Y(out[2]) );
  INVX2 U7 ( .A(n16), .Y(out[1]) );
  INVX2 U8 ( .A(n17), .Y(out[0]) );
  AOI22X1 U10 ( .A(sel), .B(a[7]), .C(b[7]), .D(n2), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(sel), .C(b[6]), .D(n2), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(sel), .C(b[5]), .D(n2), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(sel), .C(b[4]), .D(n2), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(sel), .C(b[3]), .D(n2), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(sel), .C(b[2]), .D(n2), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(sel), .C(b[1]), .D(n2), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(sel), .C(b[0]), .D(n2), .Y(n17) );
  INVX2 U9 ( .A(sel), .Y(n2) );
endmodule


module mux4_1 ( a, b, c, d, sel, out );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] out;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  AND2X2 U1 ( .A(sel[0]), .B(sel[1]), .Y(n5) );
  AND2X2 U2 ( .A(sel[1]), .B(n22), .Y(n4) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(out[7]) );
  AOI22X1 U5 ( .A(c[7]), .B(n4), .C(d[7]), .D(n5), .Y(n3) );
  AOI22X1 U6 ( .A(a[7]), .B(n6), .C(b[7]), .D(n7), .Y(n2) );
  NAND2X1 U7 ( .A(n8), .B(n9), .Y(out[6]) );
  AOI22X1 U8 ( .A(c[6]), .B(n4), .C(d[6]), .D(n5), .Y(n9) );
  AOI22X1 U9 ( .A(a[6]), .B(n6), .C(b[6]), .D(n7), .Y(n8) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(out[5]) );
  AOI22X1 U11 ( .A(c[5]), .B(n4), .C(d[5]), .D(n5), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(n6), .C(b[5]), .D(n7), .Y(n10) );
  NAND2X1 U13 ( .A(n12), .B(n13), .Y(out[4]) );
  AOI22X1 U14 ( .A(c[4]), .B(n4), .C(d[4]), .D(n5), .Y(n13) );
  AOI22X1 U15 ( .A(a[4]), .B(n6), .C(b[4]), .D(n7), .Y(n12) );
  NAND2X1 U16 ( .A(n14), .B(n15), .Y(out[3]) );
  AOI22X1 U17 ( .A(c[3]), .B(n4), .C(d[3]), .D(n5), .Y(n15) );
  AOI22X1 U18 ( .A(a[3]), .B(n6), .C(b[3]), .D(n7), .Y(n14) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Y(out[2]) );
  AOI22X1 U20 ( .A(c[2]), .B(n4), .C(d[2]), .D(n5), .Y(n17) );
  AOI22X1 U21 ( .A(a[2]), .B(n6), .C(b[2]), .D(n7), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n19), .Y(out[1]) );
  AOI22X1 U23 ( .A(c[1]), .B(n4), .C(d[1]), .D(n5), .Y(n19) );
  AOI22X1 U24 ( .A(a[1]), .B(n6), .C(b[1]), .D(n7), .Y(n18) );
  NAND2X1 U25 ( .A(n20), .B(n21), .Y(out[0]) );
  AOI22X1 U26 ( .A(c[0]), .B(n4), .C(d[0]), .D(n5), .Y(n21) );
  AOI22X1 U27 ( .A(a[0]), .B(n6), .C(b[0]), .D(n7), .Y(n20) );
  NOR2X1 U28 ( .A(n22), .B(sel[1]), .Y(n7) );
  NOR2X1 U29 ( .A(sel[0]), .B(sel[1]), .Y(n6) );
  INVX2 U3 ( .A(sel[0]), .Y(n22) );
endmodule


module mux4_0 ( a, b, c, d, sel, out );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] out;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n42;

  AND2X2 U1 ( .A(sel[0]), .B(sel[1]), .Y(n5) );
  AND2X2 U2 ( .A(sel[1]), .B(n42), .Y(n4) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(out[7]) );
  AOI22X1 U5 ( .A(c[7]), .B(n4), .C(d[7]), .D(n5), .Y(n3) );
  AOI22X1 U6 ( .A(a[7]), .B(n6), .C(b[7]), .D(n7), .Y(n2) );
  NAND2X1 U7 ( .A(n8), .B(n9), .Y(out[6]) );
  AOI22X1 U8 ( .A(c[6]), .B(n4), .C(d[6]), .D(n5), .Y(n9) );
  AOI22X1 U9 ( .A(a[6]), .B(n6), .C(b[6]), .D(n7), .Y(n8) );
  NAND2X1 U10 ( .A(n10), .B(n11), .Y(out[5]) );
  AOI22X1 U11 ( .A(c[5]), .B(n4), .C(d[5]), .D(n5), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(n6), .C(b[5]), .D(n7), .Y(n10) );
  NAND2X1 U13 ( .A(n12), .B(n13), .Y(out[4]) );
  AOI22X1 U14 ( .A(c[4]), .B(n4), .C(d[4]), .D(n5), .Y(n13) );
  AOI22X1 U15 ( .A(a[4]), .B(n6), .C(b[4]), .D(n7), .Y(n12) );
  NAND2X1 U16 ( .A(n14), .B(n15), .Y(out[3]) );
  AOI22X1 U17 ( .A(c[3]), .B(n4), .C(d[3]), .D(n5), .Y(n15) );
  AOI22X1 U18 ( .A(a[3]), .B(n6), .C(b[3]), .D(n7), .Y(n14) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Y(out[2]) );
  AOI22X1 U20 ( .A(c[2]), .B(n4), .C(d[2]), .D(n5), .Y(n17) );
  AOI22X1 U21 ( .A(a[2]), .B(n6), .C(b[2]), .D(n7), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n19), .Y(out[1]) );
  AOI22X1 U23 ( .A(c[1]), .B(n4), .C(d[1]), .D(n5), .Y(n19) );
  AOI22X1 U24 ( .A(a[1]), .B(n6), .C(b[1]), .D(n7), .Y(n18) );
  NAND2X1 U25 ( .A(n20), .B(n21), .Y(out[0]) );
  AOI22X1 U26 ( .A(c[0]), .B(n4), .C(d[0]), .D(n5), .Y(n21) );
  AOI22X1 U27 ( .A(a[0]), .B(n6), .C(b[0]), .D(n7), .Y(n20) );
  NOR2X1 U28 ( .A(n42), .B(sel[1]), .Y(n7) );
  NOR2X1 U29 ( .A(sel[0]), .B(sel[1]), .Y(n6) );
  INVX2 U3 ( .A(sel[0]), .Y(n42) );
endmodule


module mux_1 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18;

  INVX2 U1 ( .A(n10), .Y(out[7]) );
  INVX2 U2 ( .A(n11), .Y(out[6]) );
  INVX2 U3 ( .A(n12), .Y(out[5]) );
  INVX2 U4 ( .A(n13), .Y(out[4]) );
  INVX2 U5 ( .A(n14), .Y(out[3]) );
  INVX2 U6 ( .A(n15), .Y(out[2]) );
  INVX2 U7 ( .A(n16), .Y(out[1]) );
  INVX2 U8 ( .A(n17), .Y(out[0]) );
  AOI22X1 U10 ( .A(sel), .B(a[7]), .C(b[7]), .D(n18), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(sel), .C(b[6]), .D(n18), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(sel), .C(b[5]), .D(n18), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(sel), .C(b[4]), .D(n18), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(sel), .C(b[3]), .D(n18), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(sel), .C(b[2]), .D(n18), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(sel), .C(b[1]), .D(n18), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(sel), .C(b[0]), .D(n18), .Y(n17) );
  INVX2 U9 ( .A(sel), .Y(n18) );
endmodule


module mux_0 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26;

  INVX2 U1 ( .A(n26), .Y(out[7]) );
  INVX2 U2 ( .A(n25), .Y(out[6]) );
  INVX2 U3 ( .A(n24), .Y(out[5]) );
  INVX2 U4 ( .A(n23), .Y(out[4]) );
  INVX2 U5 ( .A(n22), .Y(out[3]) );
  INVX2 U6 ( .A(n21), .Y(out[2]) );
  INVX2 U7 ( .A(n20), .Y(out[1]) );
  INVX2 U8 ( .A(n19), .Y(out[0]) );
  AOI22X1 U10 ( .A(sel), .B(a[7]), .C(b[7]), .D(n18), .Y(n26) );
  AOI22X1 U11 ( .A(a[6]), .B(sel), .C(b[6]), .D(n18), .Y(n25) );
  AOI22X1 U12 ( .A(a[5]), .B(sel), .C(b[5]), .D(n18), .Y(n24) );
  AOI22X1 U13 ( .A(a[4]), .B(sel), .C(b[4]), .D(n18), .Y(n23) );
  AOI22X1 U14 ( .A(a[3]), .B(sel), .C(b[3]), .D(n18), .Y(n22) );
  AOI22X1 U15 ( .A(a[2]), .B(sel), .C(b[2]), .D(n18), .Y(n21) );
  AOI22X1 U16 ( .A(a[1]), .B(sel), .C(b[1]), .D(n18), .Y(n20) );
  AOI22X1 U17 ( .A(a[0]), .B(sel), .C(b[0]), .D(n18), .Y(n19) );
  INVX2 U9 ( .A(sel), .Y(n18) );
endmodule


module mux_smallData ( a, b, sel, out );
  input [2:0] a;
  input [2:0] b;
  output [2:0] out;
  input sel;
  wire   n5, n6, n7, n2;

  INVX2 U1 ( .A(n5), .Y(out[2]) );
  INVX2 U2 ( .A(n6), .Y(out[1]) );
  INVX2 U3 ( .A(n7), .Y(out[0]) );
  AOI22X1 U5 ( .A(sel), .B(a[2]), .C(b[2]), .D(n2), .Y(n5) );
  AOI22X1 U6 ( .A(a[1]), .B(sel), .C(b[1]), .D(n2), .Y(n6) );
  AOI22X1 U7 ( .A(a[0]), .B(sel), .C(b[0]), .D(n2), .Y(n7) );
  INVX2 U4 ( .A(sel), .Y(n2) );
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
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n13, n14, n15, n16, n17, n18, n19, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53;
  wire   [7:0] b2;
  wire   [7:0] sum;

  OAI21X1 U21 ( .A(n20), .B(n16), .C(n21), .Y(result[7]) );
  AOI22X1 U22 ( .A(b[7]), .B(n22), .C(n51), .D(a[7]), .Y(n21) );
  OAI21X1 U23 ( .A(alucont[1]), .B(n43), .C(n23), .Y(n22) );
  OAI21X1 U24 ( .A(n20), .B(n17), .C(n24), .Y(result[6]) );
  AOI22X1 U25 ( .A(b[6]), .B(n25), .C(a[6]), .D(n51), .Y(n24) );
  OAI21X1 U26 ( .A(alucont[1]), .B(n44), .C(n23), .Y(n25) );
  OAI21X1 U27 ( .A(n20), .B(n18), .C(n26), .Y(result[5]) );
  AOI22X1 U28 ( .A(b[5]), .B(n27), .C(a[5]), .D(n51), .Y(n26) );
  OAI21X1 U29 ( .A(alucont[1]), .B(n45), .C(n23), .Y(n27) );
  OAI21X1 U30 ( .A(n20), .B(n19), .C(n28), .Y(result[4]) );
  AOI22X1 U31 ( .A(b[4]), .B(n29), .C(a[4]), .D(n51), .Y(n28) );
  OAI21X1 U32 ( .A(alucont[1]), .B(n46), .C(n23), .Y(n29) );
  OAI21X1 U33 ( .A(n20), .B(n40), .C(n30), .Y(result[3]) );
  AOI22X1 U34 ( .A(b[3]), .B(n31), .C(a[3]), .D(n51), .Y(n30) );
  OAI21X1 U35 ( .A(alucont[1]), .B(n47), .C(n23), .Y(n31) );
  OAI21X1 U36 ( .A(n20), .B(n41), .C(n32), .Y(result[2]) );
  AOI22X1 U37 ( .A(b[2]), .B(n33), .C(a[2]), .D(n51), .Y(n32) );
  OAI21X1 U38 ( .A(alucont[1]), .B(n48), .C(n23), .Y(n33) );
  OAI21X1 U39 ( .A(n20), .B(n42), .C(n34), .Y(result[1]) );
  AOI22X1 U40 ( .A(b[1]), .B(n35), .C(a[1]), .D(n51), .Y(n34) );
  OAI21X1 U41 ( .A(alucont[1]), .B(n49), .C(n23), .Y(n35) );
  NAND2X1 U42 ( .A(n36), .B(n37), .Y(result[0]) );
  AOI22X1 U43 ( .A(n38), .B(sum[7]), .C(b[0]), .D(n39), .Y(n37) );
  OAI21X1 U44 ( .A(alucont[1]), .B(n50), .C(n23), .Y(n39) );
  NOR2X1 U45 ( .A(n53), .B(n13), .Y(n38) );
  AOI22X1 U46 ( .A(a[0]), .B(n51), .C(sum[0]), .D(n52), .Y(n36) );
  NAND2X1 U47 ( .A(alucont[1]), .B(n53), .Y(n20) );
  NAND2X1 U48 ( .A(alucont[0]), .B(n13), .Y(n23) );
  XOR2X1 U49 ( .A(b[7]), .B(alucont[2]), .Y(b2[7]) );
  XOR2X1 U50 ( .A(b[6]), .B(alucont[2]), .Y(b2[6]) );
  XOR2X1 U51 ( .A(b[5]), .B(alucont[2]), .Y(b2[5]) );
  XOR2X1 U52 ( .A(b[4]), .B(n15), .Y(b2[4]) );
  XOR2X1 U53 ( .A(b[3]), .B(n15), .Y(b2[3]) );
  XOR2X1 U54 ( .A(b[2]), .B(n15), .Y(b2[2]) );
  XOR2X1 U55 ( .A(b[1]), .B(n15), .Y(b2[1]) );
  XOR2X1 U56 ( .A(b[0]), .B(n15), .Y(b2[0]) );
  alu_DW01_add_0 add_1_root_add_13_2 ( .A(a), .B(b2), .CI(n15), .SUM(sum) );
  INVX2 U2 ( .A(n14), .Y(n15) );
  INVX2 U3 ( .A(alucont[2]), .Y(n14) );
  INVX2 U4 ( .A(alucont[1]), .Y(n13) );
  INVX2 U5 ( .A(sum[7]), .Y(n16) );
  INVX2 U6 ( .A(sum[6]), .Y(n17) );
  INVX2 U7 ( .A(sum[5]), .Y(n18) );
  INVX2 U8 ( .A(sum[4]), .Y(n19) );
  INVX2 U9 ( .A(sum[3]), .Y(n40) );
  INVX2 U10 ( .A(sum[2]), .Y(n41) );
  INVX2 U11 ( .A(sum[1]), .Y(n42) );
  INVX2 U12 ( .A(a[7]), .Y(n43) );
  INVX2 U13 ( .A(a[6]), .Y(n44) );
  INVX2 U14 ( .A(a[5]), .Y(n45) );
  INVX2 U15 ( .A(a[4]), .Y(n46) );
  INVX2 U16 ( .A(a[3]), .Y(n47) );
  INVX2 U17 ( .A(a[2]), .Y(n48) );
  INVX2 U18 ( .A(a[1]), .Y(n49) );
  INVX2 U19 ( .A(a[0]), .Y(n50) );
  INVX2 U20 ( .A(n23), .Y(n51) );
  INVX2 U57 ( .A(n20), .Y(n52) );
  INVX2 U58 ( .A(alucont[0]), .Y(n53) );
endmodule


module dff8bit_test_0 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n45, n46, n47, n48,
         n49, n50, n51, n52;

  AOI22X1 U10 ( .A(d[7]), .B(n10), .C(q[7]), .D(n11), .Y(n9) );
  AOI22X1 U11 ( .A(d[6]), .B(n10), .C(q[6]), .D(n11), .Y(n12) );
  AOI22X1 U12 ( .A(d[5]), .B(n10), .C(q[5]), .D(n11), .Y(n13) );
  AOI22X1 U13 ( .A(d[4]), .B(n10), .C(q[4]), .D(n11), .Y(n14) );
  AOI22X1 U14 ( .A(d[3]), .B(n10), .C(q[3]), .D(n11), .Y(n15) );
  AOI22X1 U15 ( .A(d[2]), .B(n10), .C(q[2]), .D(n11), .Y(n16) );
  AOI22X1 U16 ( .A(d[1]), .B(n10), .C(q[1]), .D(n11), .Y(n17) );
  AOI22X1 U17 ( .A(d[0]), .B(n10), .C(q[0]), .D(n11), .Y(n18) );
  NOR2X1 U18 ( .A(n11), .B(rst), .Y(n10) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n11) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n47), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n48), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n49), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n50), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n51), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n52), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n46), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n9), .Y(n45) );
  INVX2 U29 ( .A(n18), .Y(n46) );
  INVX2 U30 ( .A(n12), .Y(n47) );
  INVX2 U31 ( .A(n13), .Y(n48) );
  INVX2 U32 ( .A(n14), .Y(n49) );
  INVX2 U33 ( .A(n15), .Y(n50) );
  INVX2 U34 ( .A(n16), .Y(n51) );
  INVX2 U35 ( .A(n17), .Y(n52) );
endmodule


module dff8bit_test_1 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;

  AOI22X1 U10 ( .A(d[7]), .B(n61), .C(q[7]), .D(n60), .Y(n62) );
  AOI22X1 U11 ( .A(d[6]), .B(n61), .C(q[6]), .D(n60), .Y(n59) );
  AOI22X1 U12 ( .A(d[5]), .B(n61), .C(q[5]), .D(n60), .Y(n58) );
  AOI22X1 U13 ( .A(d[4]), .B(n61), .C(q[4]), .D(n60), .Y(n57) );
  AOI22X1 U14 ( .A(d[3]), .B(n61), .C(q[3]), .D(n60), .Y(n56) );
  AOI22X1 U15 ( .A(d[2]), .B(n61), .C(q[2]), .D(n60), .Y(n55) );
  AOI22X1 U16 ( .A(d[1]), .B(n61), .C(q[1]), .D(n60), .Y(n54) );
  AOI22X1 U17 ( .A(d[0]), .B(n61), .C(q[0]), .D(n60), .Y(n53) );
  NOR2X1 U18 ( .A(n60), .B(rst), .Y(n61) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n60) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n46), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n47), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n48), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n49), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n50), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n51), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n52), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n62), .Y(n45) );
  INVX2 U29 ( .A(n59), .Y(n46) );
  INVX2 U30 ( .A(n58), .Y(n47) );
  INVX2 U31 ( .A(n57), .Y(n48) );
  INVX2 U32 ( .A(n56), .Y(n49) );
  INVX2 U33 ( .A(n55), .Y(n50) );
  INVX2 U34 ( .A(n54), .Y(n51) );
  INVX2 U35 ( .A(n53), .Y(n52) );
endmodule


module dff8bit_test_2 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n35, n36, n37, n38,
         n39, n40, n41, n42;

  AOI22X1 U10 ( .A(d[7]), .B(n10), .C(q[7]), .D(n11), .Y(n9) );
  AOI22X1 U11 ( .A(d[6]), .B(n10), .C(q[6]), .D(n11), .Y(n12) );
  AOI22X1 U12 ( .A(d[5]), .B(n10), .C(q[5]), .D(n11), .Y(n13) );
  AOI22X1 U13 ( .A(d[4]), .B(n10), .C(q[4]), .D(n11), .Y(n14) );
  AOI22X1 U14 ( .A(d[3]), .B(n10), .C(q[3]), .D(n11), .Y(n15) );
  AOI22X1 U15 ( .A(d[2]), .B(n10), .C(q[2]), .D(n11), .Y(n16) );
  AOI22X1 U16 ( .A(d[1]), .B(n10), .C(q[1]), .D(n11), .Y(n17) );
  AOI22X1 U17 ( .A(d[0]), .B(n10), .C(q[0]), .D(n11), .Y(n18) );
  NOR2X1 U18 ( .A(n11), .B(rst), .Y(n10) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n11) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n35), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n36), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n37), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n38), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n39), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n40), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n41), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n42), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n9), .Y(n35) );
  INVX2 U29 ( .A(n12), .Y(n36) );
  INVX2 U30 ( .A(n13), .Y(n37) );
  INVX2 U31 ( .A(n14), .Y(n38) );
  INVX2 U32 ( .A(n15), .Y(n39) );
  INVX2 U33 ( .A(n16), .Y(n40) );
  INVX2 U34 ( .A(n17), .Y(n41) );
  INVX2 U35 ( .A(n18), .Y(n42) );
endmodule


module dff8bit_test_3 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n45, n46, n47, n48,
         n49, n50, n51, n52;

  AOI22X1 U10 ( .A(d[7]), .B(n10), .C(q[7]), .D(n11), .Y(n9) );
  AOI22X1 U11 ( .A(d[6]), .B(n10), .C(q[6]), .D(n11), .Y(n12) );
  AOI22X1 U12 ( .A(d[5]), .B(n10), .C(q[5]), .D(n11), .Y(n13) );
  AOI22X1 U13 ( .A(d[4]), .B(n10), .C(q[4]), .D(n11), .Y(n14) );
  AOI22X1 U14 ( .A(d[3]), .B(n10), .C(q[3]), .D(n11), .Y(n15) );
  AOI22X1 U15 ( .A(d[2]), .B(n10), .C(q[2]), .D(n11), .Y(n16) );
  AOI22X1 U16 ( .A(d[1]), .B(n10), .C(q[1]), .D(n11), .Y(n17) );
  AOI22X1 U17 ( .A(d[0]), .B(n10), .C(q[0]), .D(n11), .Y(n18) );
  NOR2X1 U18 ( .A(n11), .B(rst), .Y(n10) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n11) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n46), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n47), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n48), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n49), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n50), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n51), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n52), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n9), .Y(n45) );
  INVX2 U29 ( .A(n12), .Y(n46) );
  INVX2 U30 ( .A(n13), .Y(n47) );
  INVX2 U31 ( .A(n14), .Y(n48) );
  INVX2 U32 ( .A(n15), .Y(n49) );
  INVX2 U33 ( .A(n16), .Y(n50) );
  INVX2 U34 ( .A(n17), .Y(n51) );
  INVX2 U35 ( .A(n18), .Y(n52) );
endmodule


module dff8bit_test_4 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;

  AOI22X1 U10 ( .A(d[7]), .B(n61), .C(q[7]), .D(n60), .Y(n62) );
  AOI22X1 U11 ( .A(d[6]), .B(n61), .C(q[6]), .D(n60), .Y(n59) );
  AOI22X1 U12 ( .A(d[5]), .B(n61), .C(q[5]), .D(n60), .Y(n58) );
  AOI22X1 U13 ( .A(d[4]), .B(n61), .C(q[4]), .D(n60), .Y(n57) );
  AOI22X1 U14 ( .A(d[3]), .B(n61), .C(q[3]), .D(n60), .Y(n56) );
  AOI22X1 U15 ( .A(d[2]), .B(n61), .C(q[2]), .D(n60), .Y(n55) );
  AOI22X1 U16 ( .A(d[1]), .B(n61), .C(q[1]), .D(n60), .Y(n54) );
  AOI22X1 U17 ( .A(d[0]), .B(n61), .C(q[0]), .D(n60), .Y(n53) );
  NOR2X1 U18 ( .A(n60), .B(rst), .Y(n61) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n60) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n46), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n47), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n48), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n49), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n50), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n51), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n52), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n62), .Y(n45) );
  INVX2 U29 ( .A(n59), .Y(n46) );
  INVX2 U30 ( .A(n58), .Y(n47) );
  INVX2 U31 ( .A(n57), .Y(n48) );
  INVX2 U32 ( .A(n56), .Y(n49) );
  INVX2 U33 ( .A(n55), .Y(n50) );
  INVX2 U34 ( .A(n54), .Y(n51) );
  INVX2 U35 ( .A(n53), .Y(n52) );
endmodule


module dff8bit_test_5 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;

  AOI22X1 U10 ( .A(d[7]), .B(n61), .C(q[7]), .D(n60), .Y(n62) );
  AOI22X1 U11 ( .A(d[6]), .B(n61), .C(q[6]), .D(n60), .Y(n59) );
  AOI22X1 U12 ( .A(d[5]), .B(n61), .C(q[5]), .D(n60), .Y(n58) );
  AOI22X1 U13 ( .A(d[4]), .B(n61), .C(q[4]), .D(n60), .Y(n57) );
  AOI22X1 U14 ( .A(d[3]), .B(n61), .C(q[3]), .D(n60), .Y(n56) );
  AOI22X1 U15 ( .A(d[2]), .B(n61), .C(q[2]), .D(n60), .Y(n55) );
  AOI22X1 U16 ( .A(d[1]), .B(n61), .C(q[1]), .D(n60), .Y(n54) );
  AOI22X1 U17 ( .A(d[0]), .B(n61), .C(q[0]), .D(n60), .Y(n53) );
  NOR2X1 U18 ( .A(n60), .B(rst), .Y(n61) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n60) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n46), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n47), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n48), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n49), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n50), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n51), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n52), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n62), .Y(n45) );
  INVX2 U29 ( .A(n59), .Y(n46) );
  INVX2 U30 ( .A(n58), .Y(n47) );
  INVX2 U31 ( .A(n57), .Y(n48) );
  INVX2 U32 ( .A(n56), .Y(n49) );
  INVX2 U33 ( .A(n55), .Y(n50) );
  INVX2 U34 ( .A(n54), .Y(n51) );
  INVX2 U35 ( .A(n53), .Y(n52) );
endmodule


module dff8bit_test_6 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;

  AOI22X1 U10 ( .A(d[7]), .B(n61), .C(q[7]), .D(n60), .Y(n62) );
  AOI22X1 U11 ( .A(d[6]), .B(n61), .C(q[6]), .D(n60), .Y(n59) );
  AOI22X1 U12 ( .A(d[5]), .B(n61), .C(q[5]), .D(n60), .Y(n58) );
  AOI22X1 U13 ( .A(d[4]), .B(n61), .C(q[4]), .D(n60), .Y(n57) );
  AOI22X1 U14 ( .A(d[3]), .B(n61), .C(q[3]), .D(n60), .Y(n56) );
  AOI22X1 U15 ( .A(d[2]), .B(n61), .C(q[2]), .D(n60), .Y(n55) );
  AOI22X1 U16 ( .A(d[1]), .B(n61), .C(q[1]), .D(n60), .Y(n54) );
  AOI22X1 U17 ( .A(d[0]), .B(n61), .C(q[0]), .D(n60), .Y(n53) );
  NOR2X1 U18 ( .A(n60), .B(rst), .Y(n61) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n60) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n52), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n51), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n50), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n49), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n48), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n47), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n46), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n62), .Y(n45) );
  INVX2 U29 ( .A(n53), .Y(n46) );
  INVX2 U30 ( .A(n54), .Y(n47) );
  INVX2 U31 ( .A(n55), .Y(n48) );
  INVX2 U32 ( .A(n56), .Y(n49) );
  INVX2 U33 ( .A(n57), .Y(n50) );
  INVX2 U34 ( .A(n58), .Y(n51) );
  INVX2 U35 ( .A(n59), .Y(n52) );
endmodule


module dff8bit_test_7 ( d, clk, rst, en, q, test_si, test_se );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n45, n46, n47, n48,
         n49, n50, n51, n52;

  AOI22X1 U10 ( .A(d[7]), .B(n10), .C(q[7]), .D(n11), .Y(n9) );
  AOI22X1 U11 ( .A(d[6]), .B(n10), .C(q[6]), .D(n11), .Y(n12) );
  AOI22X1 U12 ( .A(d[5]), .B(n10), .C(q[5]), .D(n11), .Y(n13) );
  AOI22X1 U13 ( .A(d[4]), .B(n10), .C(q[4]), .D(n11), .Y(n14) );
  AOI22X1 U14 ( .A(d[3]), .B(n10), .C(q[3]), .D(n11), .Y(n15) );
  AOI22X1 U15 ( .A(d[2]), .B(n10), .C(q[2]), .D(n11), .Y(n16) );
  AOI22X1 U16 ( .A(d[1]), .B(n10), .C(q[1]), .D(n11), .Y(n17) );
  AOI22X1 U17 ( .A(d[0]), .B(n10), .C(q[0]), .D(n11), .Y(n18) );
  NOR2X1 U18 ( .A(n11), .B(rst), .Y(n10) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n11) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(q[6]), .TE(test_se), .CLK(clk), .Q(
        q[7]) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n46), .TI(q[5]), .TE(test_se), .CLK(clk), .Q(
        q[6]) );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n47), .TI(q[4]), .TE(test_se), .CLK(clk), .Q(
        q[5]) );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n48), .TI(q[3]), .TE(test_se), .CLK(clk), .Q(
        q[4]) );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n49), .TI(q[2]), .TE(test_se), .CLK(clk), .Q(
        q[3]) );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n50), .TI(q[1]), .TE(test_se), .CLK(clk), .Q(
        q[2]) );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n51), .TI(q[0]), .TE(test_se), .CLK(clk), .Q(
        q[1]) );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n52), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        q[0]) );
  INVX2 U28 ( .A(n9), .Y(n45) );
  INVX2 U29 ( .A(n12), .Y(n46) );
  INVX2 U30 ( .A(n13), .Y(n47) );
  INVX2 U31 ( .A(n14), .Y(n48) );
  INVX2 U32 ( .A(n15), .Y(n49) );
  INVX2 U33 ( .A(n16), .Y(n50) );
  INVX2 U34 ( .A(n17), .Y(n51) );
  INVX2 U35 ( .A(n18), .Y(n52) );
endmodule


module dff8bit_test_8 ( d, clk, rst, en, q, test_si, test_se, test_so );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en, test_si, test_se;
  output test_so;
  wire   n82, n83, n84, n85, n86, n87, n88, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n65, n67, n69,
         n71, n73, n75, n77, n79;

  AOI22X1 U10 ( .A(d[7]), .B(n61), .C(q[7]), .D(n60), .Y(n62) );
  AOI22X1 U11 ( .A(d[6]), .B(n61), .C(q[6]), .D(n60), .Y(n59) );
  AOI22X1 U12 ( .A(d[5]), .B(n61), .C(q[5]), .D(n60), .Y(n58) );
  AOI22X1 U13 ( .A(d[4]), .B(n61), .C(q[4]), .D(n60), .Y(n57) );
  AOI22X1 U14 ( .A(d[3]), .B(n61), .C(q[3]), .D(n60), .Y(n56) );
  AOI22X1 U15 ( .A(d[2]), .B(n61), .C(q[2]), .D(n60), .Y(n55) );
  AOI22X1 U16 ( .A(d[1]), .B(n61), .C(q[1]), .D(n60), .Y(n54) );
  AOI22X1 U17 ( .A(d[0]), .B(n61), .C(q[0]), .D(n60), .Y(n53) );
  NOR2X1 U18 ( .A(n60), .B(rst), .Y(n61) );
  NOR2X1 U19 ( .A(rst), .B(en), .Y(n60) );
  DFFPOSX1_SCAN q_reg_7_ ( .D(n45), .TI(n82), .TE(test_se), .CLK(clk), .Q(
        test_so) );
  DFFPOSX1_SCAN q_reg_6_ ( .D(n46), .TI(n83), .TE(test_se), .CLK(clk), .Q(n82)
         );
  DFFPOSX1_SCAN q_reg_5_ ( .D(n47), .TI(n84), .TE(test_se), .CLK(clk), .Q(n83)
         );
  DFFPOSX1_SCAN q_reg_4_ ( .D(n48), .TI(n85), .TE(test_se), .CLK(clk), .Q(n84)
         );
  DFFPOSX1_SCAN q_reg_3_ ( .D(n49), .TI(n86), .TE(test_se), .CLK(clk), .Q(n85)
         );
  DFFPOSX1_SCAN q_reg_2_ ( .D(n50), .TI(n87), .TE(test_se), .CLK(clk), .Q(n86)
         );
  DFFPOSX1_SCAN q_reg_1_ ( .D(n51), .TI(n88), .TE(test_se), .CLK(clk), .Q(n87)
         );
  DFFPOSX1_SCAN q_reg_0_ ( .D(n52), .TI(test_si), .TE(test_se), .CLK(clk), .Q(
        n88) );
  INVX2 U28 ( .A(n62), .Y(n45) );
  INVX2 U29 ( .A(n59), .Y(n46) );
  INVX2 U30 ( .A(n58), .Y(n47) );
  INVX2 U31 ( .A(n57), .Y(n48) );
  INVX2 U32 ( .A(n56), .Y(n49) );
  INVX2 U33 ( .A(n55), .Y(n50) );
  INVX2 U34 ( .A(n54), .Y(n51) );
  INVX2 U35 ( .A(n53), .Y(n52) );
  INVX8 U36 ( .A(test_so), .Y(n65) );
  INVX8 U37 ( .A(n65), .Y(q[7]) );
  INVX8 U38 ( .A(n88), .Y(n67) );
  INVX8 U39 ( .A(n67), .Y(q[0]) );
  INVX8 U40 ( .A(n87), .Y(n69) );
  INVX8 U41 ( .A(n69), .Y(q[1]) );
  INVX8 U42 ( .A(n86), .Y(n71) );
  INVX8 U43 ( .A(n71), .Y(q[2]) );
  INVX8 U44 ( .A(n85), .Y(n73) );
  INVX8 U45 ( .A(n73), .Y(q[3]) );
  INVX8 U46 ( .A(n84), .Y(n75) );
  INVX8 U47 ( .A(n75), .Y(q[4]) );
  INVX8 U48 ( .A(n83), .Y(n77) );
  INVX8 U49 ( .A(n77), .Y(q[5]) );
  INVX8 U50 ( .A(n82), .Y(n79) );
  INVX8 U51 ( .A(n79), .Y(q[6]) );
endmodule


module regfile_test_1 ( rd1, rd2, clk, regwrite, ra1, ra2, wa, wd, test_so, 
        test_se, test_si1 );
  output [7:0] rd1;
  output [7:0] rd2;
  input [2:0] ra1;
  input [2:0] ra2;
  input [2:0] wa;
  input [7:0] wd;
  input clk, regwrite, test_se, test_si1;
  output test_so;
  wire   REGS_62_, REGS_61_, REGS_60_, REGS_59_, REGS_58_, REGS_57_, REGS_56_,
         REGS_55_, REGS_54_, REGS_53_, REGS_52_, REGS_51_, REGS_50_, REGS_49_,
         REGS_48_, REGS_47_, REGS_46_, REGS_45_, REGS_44_, REGS_43_, REGS_42_,
         REGS_41_, REGS_40_, REGS_39_, REGS_38_, REGS_37_, REGS_36_, REGS_35_,
         REGS_34_, REGS_33_, REGS_32_, REGS_31_, REGS_30_, REGS_29_, REGS_28_,
         REGS_27_, REGS_26_, REGS_25_, REGS_24_, REGS_23_, REGS_22_, REGS_21_,
         REGS_20_, REGS_19_, REGS_18_, REGS_17_, REGS_16_, REGS_15_, REGS_14_,
         REGS_13_, REGS_12_, REGS_11_, REGS_10_, REGS_9_, REGS_8_, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n79, n80, n81, n82, n84, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n122, n123, n124, n125, n126, n127,
         n128, n129, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n176, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489;

  AND2X2 U2 ( .A(wa[2]), .B(regwrite), .Y(n218) );
  OAI21X1 U81 ( .A(ra2[0]), .B(n79), .C(n80), .Y(rd2[7]) );
  OAI21X1 U82 ( .A(n81), .B(n82), .C(n293), .Y(n80) );
  OAI22X1 U83 ( .A(n487), .B(n453), .C(n303), .D(n437), .Y(n82) );
  OAI22X1 U84 ( .A(n84), .B(n477), .C(n304), .D(n461), .Y(n81) );
  AOI21X1 U85 ( .A(REGS_39_), .B(n86), .C(n87), .Y(n79) );
  OAI22X1 U86 ( .A(n303), .B(n445), .C(n304), .D(n469), .Y(n87) );
  OAI21X1 U87 ( .A(n293), .B(n88), .C(n89), .Y(rd2[6]) );
  OAI21X1 U88 ( .A(n90), .B(n91), .C(n293), .Y(n89) );
  OAI22X1 U89 ( .A(n487), .B(n454), .C(n303), .D(n438), .Y(n91) );
  OAI22X1 U90 ( .A(n84), .B(n478), .C(n304), .D(n462), .Y(n90) );
  AOI21X1 U91 ( .A(REGS_38_), .B(n86), .C(n92), .Y(n88) );
  OAI22X1 U92 ( .A(n303), .B(n446), .C(n304), .D(n470), .Y(n92) );
  OAI21X1 U93 ( .A(ra2[0]), .B(n93), .C(n94), .Y(rd2[5]) );
  OAI21X1 U94 ( .A(n95), .B(n96), .C(n293), .Y(n94) );
  OAI22X1 U95 ( .A(n487), .B(n455), .C(n303), .D(n439), .Y(n96) );
  OAI22X1 U96 ( .A(n84), .B(n479), .C(n304), .D(n463), .Y(n95) );
  AOI21X1 U97 ( .A(REGS_37_), .B(n86), .C(n97), .Y(n93) );
  OAI22X1 U98 ( .A(n303), .B(n447), .C(n304), .D(n471), .Y(n97) );
  OAI21X1 U99 ( .A(n293), .B(n122), .C(n123), .Y(rd2[4]) );
  OAI21X1 U100 ( .A(n124), .B(n125), .C(n293), .Y(n123) );
  OAI22X1 U101 ( .A(n487), .B(n456), .C(n303), .D(n440), .Y(n125) );
  OAI22X1 U102 ( .A(n84), .B(n480), .C(n304), .D(n464), .Y(n124) );
  AOI21X1 U103 ( .A(REGS_36_), .B(n86), .C(n126), .Y(n122) );
  OAI22X1 U104 ( .A(n303), .B(n448), .C(n304), .D(n472), .Y(n126) );
  OAI21X1 U105 ( .A(ra2[0]), .B(n127), .C(n128), .Y(rd2[3]) );
  OAI21X1 U106 ( .A(n129), .B(n154), .C(ra2[0]), .Y(n128) );
  OAI22X1 U107 ( .A(n487), .B(n457), .C(n303), .D(n441), .Y(n154) );
  OAI22X1 U108 ( .A(n84), .B(n481), .C(n304), .D(n465), .Y(n129) );
  AOI21X1 U109 ( .A(REGS_35_), .B(n86), .C(n155), .Y(n127) );
  OAI22X1 U110 ( .A(n303), .B(n449), .C(n304), .D(n473), .Y(n155) );
  OAI21X1 U111 ( .A(n293), .B(n156), .C(n157), .Y(rd2[2]) );
  OAI21X1 U112 ( .A(n158), .B(n159), .C(n293), .Y(n157) );
  OAI22X1 U113 ( .A(n487), .B(n458), .C(n303), .D(n442), .Y(n159) );
  OAI22X1 U114 ( .A(n84), .B(n482), .C(n304), .D(n466), .Y(n158) );
  AOI21X1 U115 ( .A(REGS_34_), .B(n86), .C(n160), .Y(n156) );
  OAI22X1 U116 ( .A(n303), .B(n450), .C(n304), .D(n474), .Y(n160) );
  OAI21X1 U117 ( .A(ra2[0]), .B(n161), .C(n162), .Y(rd2[1]) );
  OAI21X1 U118 ( .A(n163), .B(n164), .C(ra2[0]), .Y(n162) );
  OAI22X1 U119 ( .A(n487), .B(n459), .C(n303), .D(n443), .Y(n164) );
  OAI22X1 U120 ( .A(n84), .B(n483), .C(n304), .D(n467), .Y(n163) );
  AOI21X1 U121 ( .A(REGS_33_), .B(n86), .C(n165), .Y(n161) );
  OAI22X1 U122 ( .A(n303), .B(n451), .C(n304), .D(n475), .Y(n165) );
  OAI21X1 U123 ( .A(n293), .B(n166), .C(n167), .Y(rd2[0]) );
  OAI21X1 U124 ( .A(n168), .B(n169), .C(n293), .Y(n167) );
  OAI22X1 U125 ( .A(n487), .B(n460), .C(n303), .D(n444), .Y(n169) );
  OAI22X1 U126 ( .A(n84), .B(n484), .C(n304), .D(n468), .Y(n168) );
  OR2X1 U127 ( .A(ra2[2]), .B(ra2[1]), .Y(n84) );
  AOI21X1 U128 ( .A(REGS_32_), .B(n86), .C(n170), .Y(n166) );
  OAI22X1 U129 ( .A(n303), .B(n452), .C(n304), .D(n476), .Y(n170) );
  NOR2X1 U132 ( .A(n488), .B(ra2[1]), .Y(n86) );
  OAI21X1 U133 ( .A(ra1[0]), .B(n171), .C(n172), .Y(rd1[7]) );
  OAI21X1 U134 ( .A(n173), .B(n174), .C(n295), .Y(n172) );
  OAI22X1 U135 ( .A(n453), .B(n485), .C(n437), .D(n301), .Y(n174) );
  OAI22X1 U136 ( .A(n477), .B(n176), .C(n461), .D(n302), .Y(n173) );
  AOI21X1 U137 ( .A(n178), .B(REGS_39_), .C(n179), .Y(n171) );
  OAI22X1 U138 ( .A(n445), .B(n301), .C(n469), .D(n302), .Y(n179) );
  OAI21X1 U139 ( .A(n295), .B(n180), .C(n181), .Y(rd1[6]) );
  OAI21X1 U140 ( .A(n182), .B(n183), .C(n295), .Y(n181) );
  OAI22X1 U141 ( .A(n454), .B(n485), .C(n438), .D(n301), .Y(n183) );
  OAI22X1 U142 ( .A(n478), .B(n176), .C(n462), .D(n302), .Y(n182) );
  AOI21X1 U143 ( .A(n178), .B(REGS_38_), .C(n184), .Y(n180) );
  OAI22X1 U144 ( .A(n446), .B(n301), .C(n470), .D(n302), .Y(n184) );
  OAI21X1 U145 ( .A(ra1[0]), .B(n185), .C(n186), .Y(rd1[5]) );
  OAI21X1 U146 ( .A(n187), .B(n188), .C(n295), .Y(n186) );
  OAI22X1 U147 ( .A(n455), .B(n485), .C(n439), .D(n301), .Y(n188) );
  OAI22X1 U148 ( .A(n479), .B(n176), .C(n463), .D(n302), .Y(n187) );
  AOI21X1 U149 ( .A(n178), .B(REGS_37_), .C(n189), .Y(n185) );
  OAI22X1 U150 ( .A(n447), .B(n301), .C(n471), .D(n302), .Y(n189) );
  OAI21X1 U151 ( .A(n295), .B(n190), .C(n191), .Y(rd1[4]) );
  OAI21X1 U152 ( .A(n192), .B(n193), .C(n295), .Y(n191) );
  OAI22X1 U153 ( .A(n456), .B(n485), .C(n440), .D(n301), .Y(n193) );
  OAI22X1 U154 ( .A(n480), .B(n176), .C(n464), .D(n302), .Y(n192) );
  AOI21X1 U155 ( .A(n178), .B(REGS_36_), .C(n194), .Y(n190) );
  OAI22X1 U156 ( .A(n448), .B(n301), .C(n472), .D(n302), .Y(n194) );
  OAI21X1 U157 ( .A(ra1[0]), .B(n195), .C(n196), .Y(rd1[3]) );
  OAI21X1 U158 ( .A(n197), .B(n198), .C(ra1[0]), .Y(n196) );
  OAI22X1 U159 ( .A(n457), .B(n485), .C(n441), .D(n301), .Y(n198) );
  OAI22X1 U160 ( .A(n481), .B(n176), .C(n465), .D(n302), .Y(n197) );
  AOI21X1 U161 ( .A(n178), .B(REGS_35_), .C(n199), .Y(n195) );
  OAI22X1 U162 ( .A(n449), .B(n301), .C(n473), .D(n302), .Y(n199) );
  OAI21X1 U163 ( .A(n295), .B(n200), .C(n201), .Y(rd1[2]) );
  OAI21X1 U164 ( .A(n202), .B(n203), .C(n295), .Y(n201) );
  OAI22X1 U165 ( .A(n458), .B(n485), .C(n442), .D(n301), .Y(n203) );
  OAI22X1 U166 ( .A(n482), .B(n176), .C(n466), .D(n302), .Y(n202) );
  AOI21X1 U167 ( .A(n178), .B(REGS_34_), .C(n204), .Y(n200) );
  OAI22X1 U168 ( .A(n450), .B(n301), .C(n474), .D(n302), .Y(n204) );
  OAI21X1 U169 ( .A(ra1[0]), .B(n205), .C(n206), .Y(rd1[1]) );
  OAI21X1 U170 ( .A(n207), .B(n208), .C(ra1[0]), .Y(n206) );
  OAI22X1 U171 ( .A(n459), .B(n485), .C(n443), .D(n301), .Y(n208) );
  OAI22X1 U172 ( .A(n483), .B(n176), .C(n467), .D(n302), .Y(n207) );
  AOI21X1 U173 ( .A(n178), .B(REGS_33_), .C(n209), .Y(n205) );
  OAI22X1 U174 ( .A(n451), .B(n301), .C(n475), .D(n302), .Y(n209) );
  OAI21X1 U175 ( .A(n295), .B(n210), .C(n211), .Y(rd1[0]) );
  OAI21X1 U176 ( .A(n212), .B(n213), .C(n295), .Y(n211) );
  OAI22X1 U177 ( .A(n460), .B(n485), .C(n444), .D(n301), .Y(n213) );
  OAI22X1 U178 ( .A(n484), .B(n176), .C(n468), .D(n302), .Y(n212) );
  OR2X1 U179 ( .A(ra1[2]), .B(ra1[1]), .Y(n176) );
  AOI21X1 U180 ( .A(n178), .B(REGS_32_), .C(n214), .Y(n210) );
  OAI22X1 U181 ( .A(n452), .B(n301), .C(n476), .D(n302), .Y(n214) );
  NOR2X1 U184 ( .A(n486), .B(ra1[1]), .Y(n178) );
  OAI22X1 U185 ( .A(n425), .B(n483), .C(n215), .D(n435), .Y(n99) );
  OAI22X1 U186 ( .A(n425), .B(n484), .C(n215), .D(n436), .Y(n98) );
  OAI22X1 U187 ( .A(n300), .B(n437), .C(n429), .D(n217), .Y(n153) );
  OAI22X1 U188 ( .A(n300), .B(n438), .C(n430), .D(n217), .Y(n152) );
  OAI22X1 U189 ( .A(n300), .B(n439), .C(n431), .D(n217), .Y(n151) );
  OAI22X1 U190 ( .A(n300), .B(n440), .C(n432), .D(n217), .Y(n150) );
  OAI22X1 U191 ( .A(n300), .B(n441), .C(n433), .D(n217), .Y(n149) );
  OAI22X1 U192 ( .A(n300), .B(n442), .C(n434), .D(n217), .Y(n148) );
  OAI22X1 U193 ( .A(n300), .B(n443), .C(n435), .D(n217), .Y(n147) );
  OAI22X1 U194 ( .A(n300), .B(n444), .C(n436), .D(n217), .Y(n146) );
  NAND3X1 U195 ( .A(n218), .B(wa[0]), .C(wa[1]), .Y(n217) );
  OAI22X1 U196 ( .A(n299), .B(n445), .C(n429), .D(n219), .Y(n145) );
  OAI22X1 U197 ( .A(n299), .B(n446), .C(n430), .D(n219), .Y(n144) );
  OAI22X1 U198 ( .A(n299), .B(n447), .C(n431), .D(n219), .Y(n143) );
  OAI22X1 U199 ( .A(n299), .B(n448), .C(n432), .D(n219), .Y(n142) );
  OAI22X1 U200 ( .A(n299), .B(n449), .C(n433), .D(n219), .Y(n141) );
  OAI22X1 U201 ( .A(n299), .B(n450), .C(n434), .D(n219), .Y(n140) );
  OAI22X1 U202 ( .A(n299), .B(n451), .C(n435), .D(n219), .Y(n139) );
  OAI22X1 U203 ( .A(n299), .B(n452), .C(n436), .D(n219), .Y(n138) );
  NAND3X1 U204 ( .A(n218), .B(n428), .C(wa[1]), .Y(n219) );
  OAI22X1 U205 ( .A(n298), .B(n453), .C(n429), .D(n220), .Y(n137) );
  OAI22X1 U206 ( .A(n298), .B(n454), .C(n430), .D(n220), .Y(n136) );
  OAI22X1 U207 ( .A(n298), .B(n455), .C(n431), .D(n220), .Y(n135) );
  OAI22X1 U208 ( .A(n298), .B(n456), .C(n432), .D(n220), .Y(n134) );
  OAI22X1 U209 ( .A(n298), .B(n457), .C(n433), .D(n220), .Y(n133) );
  OAI22X1 U210 ( .A(n298), .B(n458), .C(n434), .D(n220), .Y(n132) );
  OAI22X1 U211 ( .A(n298), .B(n459), .C(n435), .D(n220), .Y(n131) );
  OAI22X1 U212 ( .A(n298), .B(n460), .C(n436), .D(n220), .Y(n130) );
  NAND3X1 U213 ( .A(wa[0]), .B(n427), .C(n218), .Y(n220) );
  AOI22X1 U214 ( .A(n222), .B(REGS_39_), .C(wd[7]), .D(n297), .Y(n221) );
  AOI22X1 U215 ( .A(n222), .B(REGS_38_), .C(wd[6]), .D(n297), .Y(n223) );
  AOI22X1 U216 ( .A(n222), .B(REGS_37_), .C(wd[5]), .D(n297), .Y(n224) );
  AOI22X1 U217 ( .A(n222), .B(REGS_36_), .C(wd[4]), .D(n297), .Y(n225) );
  AOI22X1 U218 ( .A(n222), .B(REGS_35_), .C(wd[3]), .D(n297), .Y(n226) );
  AOI22X1 U219 ( .A(n222), .B(REGS_34_), .C(wd[2]), .D(n297), .Y(n227) );
  AOI22X1 U220 ( .A(n222), .B(REGS_33_), .C(wd[1]), .D(n297), .Y(n228) );
  AOI22X1 U221 ( .A(n222), .B(REGS_32_), .C(wd[0]), .D(n297), .Y(n229) );
  NAND3X1 U222 ( .A(n428), .B(n427), .C(n218), .Y(n222) );
  OAI22X1 U223 ( .A(n296), .B(n461), .C(n429), .D(n230), .Y(n121) );
  OAI22X1 U224 ( .A(n296), .B(n462), .C(n430), .D(n230), .Y(n120) );
  OAI22X1 U225 ( .A(n296), .B(n463), .C(n431), .D(n230), .Y(n119) );
  OAI22X1 U226 ( .A(n296), .B(n464), .C(n432), .D(n230), .Y(n118) );
  OAI22X1 U227 ( .A(n296), .B(n465), .C(n433), .D(n230), .Y(n117) );
  OAI22X1 U228 ( .A(n296), .B(n466), .C(n434), .D(n230), .Y(n116) );
  OAI22X1 U229 ( .A(n296), .B(n467), .C(n435), .D(n230), .Y(n115) );
  OAI22X1 U230 ( .A(n296), .B(n468), .C(n436), .D(n230), .Y(n114) );
  NAND3X1 U231 ( .A(wa[0]), .B(n216), .C(wa[1]), .Y(n230) );
  OAI22X1 U232 ( .A(n426), .B(n469), .C(n429), .D(n231), .Y(n113) );
  OAI22X1 U233 ( .A(n426), .B(n470), .C(n430), .D(n231), .Y(n112) );
  OAI22X1 U234 ( .A(n426), .B(n471), .C(n431), .D(n231), .Y(n111) );
  OAI22X1 U235 ( .A(n426), .B(n472), .C(n432), .D(n231), .Y(n110) );
  OAI22X1 U236 ( .A(n426), .B(n473), .C(n433), .D(n231), .Y(n109) );
  OAI22X1 U237 ( .A(n426), .B(n474), .C(n434), .D(n231), .Y(n108) );
  OAI22X1 U238 ( .A(n426), .B(n475), .C(n435), .D(n231), .Y(n107) );
  OAI22X1 U239 ( .A(n426), .B(n476), .C(n436), .D(n231), .Y(n106) );
  NAND3X1 U240 ( .A(n216), .B(n428), .C(wa[1]), .Y(n231) );
  OAI22X1 U241 ( .A(n425), .B(n477), .C(n215), .D(n429), .Y(n105) );
  OAI22X1 U242 ( .A(n425), .B(n478), .C(n215), .D(n430), .Y(n104) );
  OAI22X1 U243 ( .A(n425), .B(n479), .C(n215), .D(n431), .Y(n103) );
  OAI22X1 U244 ( .A(n425), .B(n480), .C(n215), .D(n432), .Y(n102) );
  OAI22X1 U245 ( .A(n425), .B(n481), .C(n215), .D(n433), .Y(n101) );
  OAI22X1 U246 ( .A(n425), .B(n482), .C(n215), .D(n434), .Y(n100) );
  NAND3X1 U247 ( .A(n216), .B(n427), .C(wa[0]), .Y(n215) );
  NOR2X1 U248 ( .A(n489), .B(wa[2]), .Y(n216) );
  DFFPOSX1_SCAN REGS_reg_7__7_ ( .D(n153), .TI(REGS_62_), .TE(test_se), .CLK(
        clk), .Q(test_so) );
  DFFPOSX1_SCAN REGS_reg_7__6_ ( .D(n152), .TI(REGS_61_), .TE(test_se), .CLK(
        clk), .Q(REGS_62_) );
  DFFPOSX1_SCAN REGS_reg_7__5_ ( .D(n151), .TI(REGS_60_), .TE(test_se), .CLK(
        clk), .Q(REGS_61_) );
  DFFPOSX1_SCAN REGS_reg_7__4_ ( .D(n150), .TI(REGS_59_), .TE(test_se), .CLK(
        clk), .Q(REGS_60_) );
  DFFPOSX1_SCAN REGS_reg_7__3_ ( .D(n149), .TI(REGS_58_), .TE(test_se), .CLK(
        clk), .Q(REGS_59_) );
  DFFPOSX1_SCAN REGS_reg_7__2_ ( .D(n148), .TI(REGS_57_), .TE(test_se), .CLK(
        clk), .Q(REGS_58_) );
  DFFPOSX1_SCAN REGS_reg_7__1_ ( .D(n147), .TI(REGS_56_), .TE(test_se), .CLK(
        clk), .Q(REGS_57_) );
  DFFPOSX1_SCAN REGS_reg_7__0_ ( .D(n146), .TI(REGS_55_), .TE(test_se), .CLK(
        clk), .Q(REGS_56_) );
  DFFPOSX1_SCAN REGS_reg_6__7_ ( .D(n145), .TI(REGS_54_), .TE(test_se), .CLK(
        clk), .Q(REGS_55_) );
  DFFPOSX1_SCAN REGS_reg_6__6_ ( .D(n144), .TI(REGS_53_), .TE(test_se), .CLK(
        clk), .Q(REGS_54_) );
  DFFPOSX1_SCAN REGS_reg_6__5_ ( .D(n143), .TI(REGS_52_), .TE(test_se), .CLK(
        clk), .Q(REGS_53_) );
  DFFPOSX1_SCAN REGS_reg_6__4_ ( .D(n142), .TI(REGS_51_), .TE(test_se), .CLK(
        clk), .Q(REGS_52_) );
  DFFPOSX1_SCAN REGS_reg_6__3_ ( .D(n141), .TI(REGS_50_), .TE(test_se), .CLK(
        clk), .Q(REGS_51_) );
  DFFPOSX1_SCAN REGS_reg_6__2_ ( .D(n140), .TI(REGS_49_), .TE(test_se), .CLK(
        clk), .Q(REGS_50_) );
  DFFPOSX1_SCAN REGS_reg_6__1_ ( .D(n139), .TI(REGS_48_), .TE(test_se), .CLK(
        clk), .Q(REGS_49_) );
  DFFPOSX1_SCAN REGS_reg_6__0_ ( .D(n138), .TI(REGS_47_), .TE(test_se), .CLK(
        clk), .Q(REGS_48_) );
  DFFPOSX1_SCAN REGS_reg_5__7_ ( .D(n137), .TI(REGS_46_), .TE(test_se), .CLK(
        clk), .Q(REGS_47_) );
  DFFPOSX1_SCAN REGS_reg_5__6_ ( .D(n136), .TI(REGS_45_), .TE(test_se), .CLK(
        clk), .Q(REGS_46_) );
  DFFPOSX1_SCAN REGS_reg_5__5_ ( .D(n135), .TI(REGS_44_), .TE(test_se), .CLK(
        clk), .Q(REGS_45_) );
  DFFPOSX1_SCAN REGS_reg_5__4_ ( .D(n134), .TI(REGS_43_), .TE(test_se), .CLK(
        clk), .Q(REGS_44_) );
  DFFPOSX1_SCAN REGS_reg_5__3_ ( .D(n133), .TI(REGS_42_), .TE(test_se), .CLK(
        clk), .Q(REGS_43_) );
  DFFPOSX1_SCAN REGS_reg_5__2_ ( .D(n132), .TI(REGS_41_), .TE(test_se), .CLK(
        clk), .Q(REGS_42_) );
  DFFPOSX1_SCAN REGS_reg_5__1_ ( .D(n131), .TI(REGS_40_), .TE(test_se), .CLK(
        clk), .Q(REGS_41_) );
  DFFPOSX1_SCAN REGS_reg_5__0_ ( .D(n130), .TI(REGS_39_), .TE(test_se), .CLK(
        clk), .Q(REGS_40_) );
  DFFPOSX1_SCAN REGS_reg_4__7_ ( .D(n424), .TI(REGS_38_), .TE(test_se), .CLK(
        clk), .Q(REGS_39_) );
  DFFPOSX1_SCAN REGS_reg_4__6_ ( .D(n423), .TI(REGS_37_), .TE(test_se), .CLK(
        clk), .Q(REGS_38_) );
  DFFPOSX1_SCAN REGS_reg_4__5_ ( .D(n422), .TI(REGS_36_), .TE(test_se), .CLK(
        clk), .Q(REGS_37_) );
  DFFPOSX1_SCAN REGS_reg_4__4_ ( .D(n421), .TI(REGS_35_), .TE(test_se), .CLK(
        clk), .Q(REGS_36_) );
  DFFPOSX1_SCAN REGS_reg_4__3_ ( .D(n420), .TI(REGS_34_), .TE(test_se), .CLK(
        clk), .Q(REGS_35_) );
  DFFPOSX1_SCAN REGS_reg_4__2_ ( .D(n419), .TI(REGS_33_), .TE(test_se), .CLK(
        clk), .Q(REGS_34_) );
  DFFPOSX1_SCAN REGS_reg_4__1_ ( .D(n418), .TI(REGS_32_), .TE(test_se), .CLK(
        clk), .Q(REGS_33_) );
  DFFPOSX1_SCAN REGS_reg_4__0_ ( .D(n417), .TI(REGS_31_), .TE(test_se), .CLK(
        clk), .Q(REGS_32_) );
  DFFPOSX1_SCAN REGS_reg_3__7_ ( .D(n121), .TI(REGS_30_), .TE(test_se), .CLK(
        clk), .Q(REGS_31_) );
  DFFPOSX1_SCAN REGS_reg_3__6_ ( .D(n120), .TI(REGS_29_), .TE(test_se), .CLK(
        clk), .Q(REGS_30_) );
  DFFPOSX1_SCAN REGS_reg_3__5_ ( .D(n119), .TI(REGS_28_), .TE(test_se), .CLK(
        clk), .Q(REGS_29_) );
  DFFPOSX1_SCAN REGS_reg_3__4_ ( .D(n118), .TI(REGS_27_), .TE(test_se), .CLK(
        clk), .Q(REGS_28_) );
  DFFPOSX1_SCAN REGS_reg_3__3_ ( .D(n117), .TI(REGS_26_), .TE(test_se), .CLK(
        clk), .Q(REGS_27_) );
  DFFPOSX1_SCAN REGS_reg_3__2_ ( .D(n116), .TI(REGS_25_), .TE(test_se), .CLK(
        clk), .Q(REGS_26_) );
  DFFPOSX1_SCAN REGS_reg_3__1_ ( .D(n115), .TI(REGS_24_), .TE(test_se), .CLK(
        clk), .Q(REGS_25_) );
  DFFPOSX1_SCAN REGS_reg_3__0_ ( .D(n114), .TI(REGS_23_), .TE(test_se), .CLK(
        clk), .Q(REGS_24_) );
  DFFPOSX1_SCAN REGS_reg_2__7_ ( .D(n113), .TI(REGS_22_), .TE(test_se), .CLK(
        clk), .Q(REGS_23_) );
  DFFPOSX1_SCAN REGS_reg_2__6_ ( .D(n112), .TI(REGS_21_), .TE(test_se), .CLK(
        clk), .Q(REGS_22_) );
  DFFPOSX1_SCAN REGS_reg_2__5_ ( .D(n111), .TI(REGS_20_), .TE(test_se), .CLK(
        clk), .Q(REGS_21_) );
  DFFPOSX1_SCAN REGS_reg_2__4_ ( .D(n110), .TI(REGS_19_), .TE(test_se), .CLK(
        clk), .Q(REGS_20_) );
  DFFPOSX1_SCAN REGS_reg_2__3_ ( .D(n109), .TI(REGS_18_), .TE(test_se), .CLK(
        clk), .Q(REGS_19_) );
  DFFPOSX1_SCAN REGS_reg_2__2_ ( .D(n108), .TI(REGS_17_), .TE(test_se), .CLK(
        clk), .Q(REGS_18_) );
  DFFPOSX1_SCAN REGS_reg_2__1_ ( .D(n107), .TI(REGS_16_), .TE(test_se), .CLK(
        clk), .Q(REGS_17_) );
  DFFPOSX1_SCAN REGS_reg_2__0_ ( .D(n106), .TI(REGS_15_), .TE(test_se), .CLK(
        clk), .Q(REGS_16_) );
  DFFPOSX1_SCAN REGS_reg_1__7_ ( .D(n105), .TI(REGS_14_), .TE(test_se), .CLK(
        clk), .Q(REGS_15_) );
  DFFPOSX1_SCAN REGS_reg_1__6_ ( .D(n104), .TI(REGS_13_), .TE(test_se), .CLK(
        clk), .Q(REGS_14_) );
  DFFPOSX1_SCAN REGS_reg_1__5_ ( .D(n103), .TI(REGS_12_), .TE(test_se), .CLK(
        clk), .Q(REGS_13_) );
  DFFPOSX1_SCAN REGS_reg_1__4_ ( .D(n102), .TI(REGS_11_), .TE(test_se), .CLK(
        clk), .Q(REGS_12_) );
  DFFPOSX1_SCAN REGS_reg_1__3_ ( .D(n101), .TI(REGS_10_), .TE(test_se), .CLK(
        clk), .Q(REGS_11_) );
  DFFPOSX1_SCAN REGS_reg_1__2_ ( .D(n100), .TI(REGS_9_), .TE(test_se), .CLK(
        clk), .Q(REGS_10_) );
  DFFPOSX1_SCAN REGS_reg_1__1_ ( .D(n99), .TI(REGS_8_), .TE(test_se), .CLK(clk), .Q(REGS_9_) );
  DFFPOSX1_SCAN REGS_reg_1__0_ ( .D(n98), .TI(test_si1), .TE(test_se), .CLK(
        clk), .Q(REGS_8_) );
  INVX2 U3 ( .A(n222), .Y(n297) );
  INVX2 U4 ( .A(n230), .Y(n296) );
  INVX2 U5 ( .A(n220), .Y(n298) );
  INVX2 U6 ( .A(n219), .Y(n299) );
  INVX2 U7 ( .A(n217), .Y(n300) );
  INVX2 U8 ( .A(n291), .Y(n302) );
  INVX2 U9 ( .A(n288), .Y(n301) );
  INVX2 U10 ( .A(n289), .Y(n304) );
  INVX2 U11 ( .A(n290), .Y(n303) );
  INVX2 U12 ( .A(n292), .Y(n293) );
  INVX2 U13 ( .A(n294), .Y(n295) );
  AND2X2 U14 ( .A(ra1[2]), .B(ra1[1]), .Y(n288) );
  INVX2 U15 ( .A(ra2[0]), .Y(n292) );
  INVX2 U16 ( .A(ra1[0]), .Y(n294) );
  AND2X2 U17 ( .A(ra2[1]), .B(n488), .Y(n289) );
  AND2X2 U18 ( .A(ra2[2]), .B(ra2[1]), .Y(n290) );
  AND2X2 U19 ( .A(ra1[1]), .B(n486), .Y(n291) );
  INVX2 U296 ( .A(n229), .Y(n417) );
  INVX2 U297 ( .A(n228), .Y(n418) );
  INVX2 U298 ( .A(n227), .Y(n419) );
  INVX2 U299 ( .A(n226), .Y(n420) );
  INVX2 U300 ( .A(n225), .Y(n421) );
  INVX2 U301 ( .A(n224), .Y(n422) );
  INVX2 U302 ( .A(n223), .Y(n423) );
  INVX2 U303 ( .A(n221), .Y(n424) );
  INVX2 U304 ( .A(n215), .Y(n425) );
  INVX2 U305 ( .A(n231), .Y(n426) );
  INVX2 U306 ( .A(wa[1]), .Y(n427) );
  INVX2 U307 ( .A(wa[0]), .Y(n428) );
  INVX2 U308 ( .A(wd[7]), .Y(n429) );
  INVX2 U309 ( .A(wd[6]), .Y(n430) );
  INVX2 U310 ( .A(wd[5]), .Y(n431) );
  INVX2 U311 ( .A(wd[4]), .Y(n432) );
  INVX2 U312 ( .A(wd[3]), .Y(n433) );
  INVX2 U313 ( .A(wd[2]), .Y(n434) );
  INVX2 U314 ( .A(wd[1]), .Y(n435) );
  INVX2 U315 ( .A(wd[0]), .Y(n436) );
  INVX2 U316 ( .A(test_so), .Y(n437) );
  INVX2 U317 ( .A(REGS_62_), .Y(n438) );
  INVX2 U318 ( .A(REGS_61_), .Y(n439) );
  INVX2 U319 ( .A(REGS_60_), .Y(n440) );
  INVX2 U320 ( .A(REGS_59_), .Y(n441) );
  INVX2 U321 ( .A(REGS_58_), .Y(n442) );
  INVX2 U322 ( .A(REGS_57_), .Y(n443) );
  INVX2 U323 ( .A(REGS_56_), .Y(n444) );
  INVX2 U324 ( .A(REGS_55_), .Y(n445) );
  INVX2 U325 ( .A(REGS_54_), .Y(n446) );
  INVX2 U326 ( .A(REGS_53_), .Y(n447) );
  INVX2 U327 ( .A(REGS_52_), .Y(n448) );
  INVX2 U328 ( .A(REGS_51_), .Y(n449) );
  INVX2 U329 ( .A(REGS_50_), .Y(n450) );
  INVX2 U330 ( .A(REGS_49_), .Y(n451) );
  INVX2 U331 ( .A(REGS_48_), .Y(n452) );
  INVX2 U332 ( .A(REGS_47_), .Y(n453) );
  INVX2 U333 ( .A(REGS_46_), .Y(n454) );
  INVX2 U334 ( .A(REGS_45_), .Y(n455) );
  INVX2 U335 ( .A(REGS_44_), .Y(n456) );
  INVX2 U336 ( .A(REGS_43_), .Y(n457) );
  INVX2 U337 ( .A(REGS_42_), .Y(n458) );
  INVX2 U338 ( .A(REGS_41_), .Y(n459) );
  INVX2 U339 ( .A(REGS_40_), .Y(n460) );
  INVX2 U340 ( .A(REGS_31_), .Y(n461) );
  INVX2 U341 ( .A(REGS_30_), .Y(n462) );
  INVX2 U342 ( .A(REGS_29_), .Y(n463) );
  INVX2 U343 ( .A(REGS_28_), .Y(n464) );
  INVX2 U344 ( .A(REGS_27_), .Y(n465) );
  INVX2 U345 ( .A(REGS_26_), .Y(n466) );
  INVX2 U346 ( .A(REGS_25_), .Y(n467) );
  INVX2 U347 ( .A(REGS_24_), .Y(n468) );
  INVX2 U348 ( .A(REGS_23_), .Y(n469) );
  INVX2 U349 ( .A(REGS_22_), .Y(n470) );
  INVX2 U350 ( .A(REGS_21_), .Y(n471) );
  INVX2 U351 ( .A(REGS_20_), .Y(n472) );
  INVX2 U352 ( .A(REGS_19_), .Y(n473) );
  INVX2 U353 ( .A(REGS_18_), .Y(n474) );
  INVX2 U354 ( .A(REGS_17_), .Y(n475) );
  INVX2 U355 ( .A(REGS_16_), .Y(n476) );
  INVX2 U356 ( .A(REGS_15_), .Y(n477) );
  INVX2 U357 ( .A(REGS_14_), .Y(n478) );
  INVX2 U358 ( .A(REGS_13_), .Y(n479) );
  INVX2 U359 ( .A(REGS_12_), .Y(n480) );
  INVX2 U360 ( .A(REGS_11_), .Y(n481) );
  INVX2 U361 ( .A(REGS_10_), .Y(n482) );
  INVX2 U362 ( .A(REGS_9_), .Y(n483) );
  INVX2 U363 ( .A(REGS_8_), .Y(n484) );
  INVX2 U364 ( .A(n178), .Y(n485) );
  INVX2 U365 ( .A(ra1[2]), .Y(n486) );
  INVX2 U366 ( .A(n86), .Y(n487) );
  INVX2 U367 ( .A(ra2[2]), .Y(n488) );
  INVX2 U368 ( .A(regwrite), .Y(n489) );
endmodule


module datapath_test_1 ( adr, instr, writedata, zero, alucontrol, alusrca, 
        alusrcb, iord, irwrite, memdata, memtoreg, pcen, pcsource, regdst, 
        regwrite, clk, reset, const_gnd, test_si, test_so, test_se );
  output [7:0] adr;
  output [31:0] instr;
  output [7:0] writedata;
  input [2:0] alucontrol;
  input [1:0] alusrcb;
  input [3:0] irwrite;
  input [7:0] memdata;
  input [1:0] pcsource;
  input alusrca, iord, memtoreg, pcen, regdst, regwrite, clk, reset, const_gnd,
         test_si, test_se;
  output zero, test_so;
  wire   n2, n3, n4, n5, n6, n7, n11, n12, n13, n14, n15, n16, n1;
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
  dff8bit_test_2 instr_dtf1 ( .d(memdata), .clk(clk), .rst(n15), .en(
        irwrite[0]), .q(instr[31:24]), .test_si(data[7]), .test_se(test_se) );
  dff8bit_test_3 instr_dtf2 ( .d(memdata), .clk(clk), .rst(n16), .en(
        irwrite[1]), .q(instr[23:16]), .test_si(instr[31]), .test_se(test_se)
         );
  dff8bit_test_4 instr_dtf3 ( .d(memdata), .clk(clk), .rst(n15), .en(
        irwrite[2]), .q(instr[15:8]), .test_si(instr[23]), .test_se(test_se)
         );
  dff8bit_test_5 instr_dtf4 ( .d(memdata), .clk(clk), .rst(n16), .en(
        irwrite[3]), .q(instr[7:0]), .test_si(instr[15]), .test_se(test_se) );
  dff8bit_test_7 rd_dtf1 ( .d(rd1), .clk(clk), .rst(n15), .en(n11), .q(
        to_mux_to_srca), .test_si(pc[7]), .test_se(test_se) );
  dff8bit_test_8 rd_dtf2 ( .d(rd2), .clk(clk), .rst(n15), .en(n11), .q(
        writedata), .test_si(to_mux_to_srca[7]), .test_se(test_se), .test_so(
        n1) );
  dff8bit_test_0 aluout_dtf ( .d(aluresult), .clk(clk), .rst(n16), .en(n11), 
        .q(aluout), .test_si(test_si), .test_se(test_se) );
  dff8bit_test_6 pc_dtf ( .d(nextpc), .clk(clk), .rst(n16), .en(pcen), .q(pc), 
        .test_si(instr[7]), .test_se(test_se) );
  dff8bit_test_1 data_dtf ( .d(memdata), .clk(clk), .rst(n15), .en(n11), .q(
        data), .test_si(aluout[7]), .test_se(test_se) );
  mux_2 rd1_mux ( .a(to_mux_to_srca), .b(pc), .sel(alusrca), .out(srca) );
  mux4_1 rd2_mux ( .a(writedata), .b({n13, n12, n13, n12, n13, n12, n13, n11}), 
        .c(instr[7:0]), .d({instr[5:0], n12, n13}), .sel(alusrcb), .out(srcb)
         );
  mux4_0 nextpc_mux ( .a(aluresult), .b(aluout), .c({instr[5:0], n13, n12}), 
        .d({n12, n13, n12, n13, n12, n13, n12, n13}), .sel(pcsource), .out(
        nextpc) );
  mux_1 adr_mux ( .a(aluout), .b(pc), .sel(iord), .out(adr) );
  mux_0 wd_mux ( .a(data), .b(aluout), .sel(memtoreg), .out(wd) );
  mux_smallData wa_mux ( .a(instr[13:11]), .b(instr[18:16]), .sel(regdst), 
        .out(wa) );
  regfile_test_1 test_reg ( .rd1(rd1), .rd2(rd2), .clk(clk), .regwrite(
        regwrite), .ra1(instr[23:21]), .ra2(instr[18:16]), .wa(wa), .wd(wd), 
        .test_so(test_so), .test_se(test_se), .test_si1(n1) );
  alu inst_alu ( .result(aluresult), .a(srca), .b(srcb), .alucont(alucontrol)
         );
  INVX2 U1 ( .A(n11), .Y(n12) );
  INVX2 U9 ( .A(n11), .Y(n13) );
  INVX2 U10 ( .A(n14), .Y(n15) );
  INVX2 U11 ( .A(n14), .Y(n16) );
  INVX2 U12 ( .A(const_gnd), .Y(n11) );
  INVX2 U13 ( .A(reset), .Y(n14) );
endmodule


module controller_test_1 ( clk, rst, op, memread, memwrite, alusrca, memtoreg, 
        iord, regwrite, regdst, pcsource, alusrcb, aluop, irwrite, pcwrite, 
        branch, test_si, test_so, test_se );
  input [5:0] op;
  output [1:0] pcsource;
  output [1:0] alusrcb;
  output [1:0] aluop;
  output [3:0] irwrite;
  input clk, rst, test_si, test_se;
  output memread, memwrite, alusrca, memtoreg, iord, regwrite, regdst, pcwrite,
         branch, test_so;
  wire   state_2_, state_1_, state_0_, N45, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n98, n99, n100, n101, n102, n103,
         n104;

  INVX2 U3 ( .A(n30), .Y(regdst) );
  INVX2 U4 ( .A(n33), .Y(pcsource[1]) );
  INVX2 U5 ( .A(n60), .Y(memwrite) );
  INVX2 U6 ( .A(n29), .Y(memtoreg) );
  INVX2 U7 ( .A(n57), .Y(irwrite[2]) );
  INVX2 U8 ( .A(n41), .Y(irwrite[0]) );
  INVX2 U10 ( .A(n66), .Y(aluop[0]) );
  NAND3X1 U31 ( .A(n29), .B(n30), .C(n31), .Y(regwrite) );
  NAND3X1 U32 ( .A(state_1_), .B(n32), .C(test_so), .Y(n30) );
  NAND2X1 U33 ( .A(n96), .B(n33), .Y(pcwrite) );
  NAND3X1 U34 ( .A(test_so), .B(state_0_), .C(n34), .Y(n33) );
  OAI21X1 U35 ( .A(n36), .B(n37), .C(n104), .Y(n35) );
  OAI21X1 U36 ( .A(n38), .B(n39), .C(n40), .Y(n37) );
  NAND3X1 U37 ( .A(n95), .B(n41), .C(n94), .Y(n36) );
  OAI21X1 U38 ( .A(n43), .B(n44), .C(n104), .Y(n42) );
  OAI21X1 U39 ( .A(n38), .B(n45), .C(n90), .Y(n44) );
  AOI21X1 U40 ( .A(op[1]), .B(op[2]), .C(n47), .Y(n46) );
  NAND2X1 U41 ( .A(n93), .B(op[3]), .Y(n45) );
  NAND2X1 U42 ( .A(n48), .B(n94), .Y(n43) );
  OAI21X1 U43 ( .A(n50), .B(n51), .C(n104), .Y(n49) );
  OAI21X1 U44 ( .A(n52), .B(n47), .C(n53), .Y(n51) );
  NAND3X1 U45 ( .A(n91), .B(n88), .C(n99), .Y(n53) );
  NAND3X1 U46 ( .A(n54), .B(n99), .C(n55), .Y(n47) );
  NOR2X1 U47 ( .A(op[4]), .B(op[0]), .Y(n55) );
  XOR2X1 U48 ( .A(op[1]), .B(n92), .Y(n52) );
  NAND3X1 U49 ( .A(n56), .B(n57), .C(n40), .Y(n50) );
  NAND3X1 U50 ( .A(n93), .B(n58), .C(n91), .Y(n40) );
  OAI21X1 U51 ( .A(op[3]), .B(n87), .C(n59), .Y(n58) );
  NAND3X1 U52 ( .A(test_so), .B(n98), .C(n61), .Y(n29) );
  NOR2X1 U53 ( .A(state_2_), .B(state_1_), .Y(n61) );
  NAND2X1 U54 ( .A(n96), .B(n48), .Y(memread) );
  NAND3X1 U55 ( .A(n31), .B(n60), .C(n48), .Y(iord) );
  NAND3X1 U56 ( .A(state_0_), .B(n100), .C(n102), .Y(n48) );
  NAND3X1 U57 ( .A(n32), .B(n103), .C(test_so), .Y(n60) );
  NAND3X1 U58 ( .A(test_so), .B(n98), .C(n102), .Y(n31) );
  NAND2X1 U59 ( .A(n39), .B(n62), .Y(alusrcb[1]) );
  NAND2X1 U60 ( .A(n96), .B(n39), .Y(alusrcb[0]) );
  NAND3X1 U61 ( .A(n41), .B(n57), .C(n64), .Y(n63) );
  NOR2X1 U62 ( .A(irwrite[3]), .B(irwrite[1]), .Y(n64) );
  NOR2X1 U63 ( .A(n65), .B(test_so), .Y(irwrite[1]) );
  NAND3X1 U64 ( .A(n98), .B(n100), .C(n34), .Y(n56) );
  NAND3X1 U65 ( .A(n32), .B(n100), .C(state_1_), .Y(n57) );
  NAND3X1 U66 ( .A(n103), .B(n100), .C(n32), .Y(n41) );
  NOR2X1 U67 ( .A(n98), .B(state_2_), .Y(n32) );
  NAND3X1 U68 ( .A(n94), .B(n66), .C(n62), .Y(alusrca) );
  NOR2X1 U69 ( .A(n65), .B(n100), .Y(aluop[1]) );
  NAND3X1 U70 ( .A(n98), .B(n101), .C(state_1_), .Y(n65) );
  NAND3X1 U71 ( .A(test_so), .B(n98), .C(n34), .Y(n66) );
  NAND3X1 U72 ( .A(n67), .B(n68), .C(n69), .Y(N45) );
  AOI22X1 U73 ( .A(n99), .B(n70), .C(n71), .D(n98), .Y(n69) );
  OAI21X1 U74 ( .A(n54), .B(n92), .C(n72), .Y(n70) );
  NOR2X1 U75 ( .A(op[3]), .B(op[5]), .Y(n54) );
  NAND3X1 U76 ( .A(state_0_), .B(n100), .C(n34), .Y(n39) );
  NOR2X1 U77 ( .A(n101), .B(state_1_), .Y(n34) );
  OAI21X1 U78 ( .A(n38), .B(n59), .C(n93), .Y(n68) );
  NAND3X1 U79 ( .A(n98), .B(n100), .C(n102), .Y(n62) );
  NAND2X1 U80 ( .A(state_2_), .B(state_1_), .Y(n71) );
  NAND2X1 U81 ( .A(op[3]), .B(n87), .Y(n59) );
  NAND2X1 U82 ( .A(n72), .B(n92), .Y(n38) );
  NOR3X1 U83 ( .A(op[1]), .B(op[4]), .C(op[0]), .Y(n72) );
  NOR2X1 U84 ( .A(test_so), .B(rst), .Y(n67) );
  DFFPOSX1_SCAN state_reg_0_ ( .D(N45), .TI(test_si), .TE(test_se), .CLK(clk), 
        .Q(state_0_) );
  DFFPOSX1_SCAN state_reg_3_ ( .D(n89), .TI(state_2_), .TE(test_se), .CLK(clk), 
        .Q(test_so) );
  DFFPOSX1_SCAN state_reg_2_ ( .D(n85), .TI(state_1_), .TE(test_se), .CLK(clk), 
        .Q(state_2_) );
  DFFPOSX1_SCAN state_reg_1_ ( .D(n86), .TI(state_0_), .TE(test_se), .CLK(clk), 
        .Q(state_1_) );
  INVX2 U9 ( .A(n66), .Y(pcsource[0]) );
  INVX2 U11 ( .A(n66), .Y(branch) );
  INVX2 U20 ( .A(n49), .Y(n85) );
  INVX2 U21 ( .A(n35), .Y(n86) );
  INVX2 U22 ( .A(op[5]), .Y(n87) );
  INVX2 U23 ( .A(n54), .Y(n88) );
  INVX2 U24 ( .A(n42), .Y(n89) );
  INVX2 U25 ( .A(n46), .Y(n90) );
  INVX2 U26 ( .A(n38), .Y(n91) );
  INVX2 U27 ( .A(op[2]), .Y(n92) );
  INVX2 U28 ( .A(n62), .Y(n93) );
  INVX2 U29 ( .A(aluop[1]), .Y(n94) );
  INVX2 U30 ( .A(irwrite[1]), .Y(n95) );
  INVX2 U85 ( .A(n63), .Y(n96) );
  INVX2 U86 ( .A(n56), .Y(irwrite[3]) );
  INVX2 U87 ( .A(state_0_), .Y(n98) );
  INVX2 U88 ( .A(n39), .Y(n99) );
  INVX2 U89 ( .A(test_so), .Y(n100) );
  INVX2 U90 ( .A(state_2_), .Y(n101) );
  INVX2 U91 ( .A(n71), .Y(n102) );
  INVX2 U92 ( .A(state_1_), .Y(n103) );
  INVX2 U93 ( .A(rst), .Y(n104) );
endmodule


module mips ( clk, rst, memdata, memread, memwrite, writedata, adr, const_gnd, 
        test_si, test_so, test_se );
  input [7:0] memdata;
  output [7:0] writedata;
  output [7:0] adr;
  input clk, rst, const_gnd, test_si, test_se;
  output memread, memwrite, test_so;
  wire   alusrca, memtoreg, iord, regwrite, regdst, pcwrite, branch, pcen,
         zero, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n39, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
         SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
         SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15,
         SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17,
         SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19,
         SYNOPSYS_UNCONNECTED_20;
  wire   [31:0] instr;
  wire   [1:0] pcsource;
  wire   [1:0] alusrcb;
  wire   [1:0] aluop;
  wire   [3:0] irwrite;
  wire   [2:0] alucont;

  controller_test_1 cont ( .clk(clk), .rst(n20), .op(instr[31:26]), .memread(
        memread), .memwrite(memwrite), .alusrca(alusrca), .memtoreg(memtoreg), 
        .iord(iord), .regwrite(regwrite), .regdst(regdst), .pcsource(pcsource), 
        .alusrcb(alusrcb), .aluop(aluop), .irwrite(irwrite), .pcwrite(pcwrite), 
        .branch(branch), .test_si(test_si), .test_so(n39), .test_se(test_se)
         );
  alucontrol ac ( .alucont(alucont), .aluop(aluop), .funct(instr[5:0]) );
  datapath_test_1 dp ( .adr(adr), .instr({instr[31:26], SYNOPSYS_UNCONNECTED_1, 
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
        .iord(iord), .irwrite(irwrite), .memdata({n36, n34, n32, n30, n28, n26, 
        n24, n22}), .memtoreg(memtoreg), .pcen(pcen), .pcsource(pcsource), 
        .regdst(regdst), .regwrite(regwrite), .clk(clk), .reset(n20), 
        .const_gnd(const_gnd), .test_si(n39), .test_so(test_so), .test_se(
        test_se) );
  pc_controller pc ( .pcwrite(pcwrite), .branch(branch), .zero(zero), .pcen(
        pcen) );
  INVX2 U1 ( .A(rst), .Y(n19) );
  INVX2 U2 ( .A(n19), .Y(n20) );
  INVX2 U3 ( .A(memdata[0]), .Y(n21) );
  INVX2 U4 ( .A(n21), .Y(n22) );
  INVX2 U5 ( .A(memdata[1]), .Y(n23) );
  INVX2 U6 ( .A(n23), .Y(n24) );
  INVX2 U7 ( .A(memdata[2]), .Y(n25) );
  INVX2 U8 ( .A(n25), .Y(n26) );
  INVX2 U9 ( .A(memdata[3]), .Y(n27) );
  INVX2 U10 ( .A(n27), .Y(n28) );
  INVX2 U11 ( .A(memdata[4]), .Y(n29) );
  INVX2 U12 ( .A(n29), .Y(n30) );
  INVX2 U13 ( .A(memdata[5]), .Y(n31) );
  INVX2 U14 ( .A(n31), .Y(n32) );
  INVX2 U15 ( .A(memdata[6]), .Y(n33) );
  INVX2 U16 ( .A(n33), .Y(n34) );
  INVX2 U17 ( .A(memdata[7]), .Y(n35) );
  INVX2 U18 ( .A(n35), .Y(n36) );
endmodule

