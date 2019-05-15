/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue May 14 01:50:10 2019
/////////////////////////////////////////////////////////////


module dff8bit_8 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n1), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n2), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n3), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n4), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n5), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n6), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n7), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n8), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n18), .Y(n1) );
  INVX2 U3 ( .A(n17), .Y(n2) );
  INVX2 U4 ( .A(n16), .Y(n3) );
  INVX2 U5 ( .A(n15), .Y(n4) );
  INVX2 U6 ( .A(n14), .Y(n5) );
  INVX2 U7 ( .A(n13), .Y(n6) );
  INVX2 U8 ( .A(n12), .Y(n7) );
  INVX2 U9 ( .A(n9), .Y(n8) );
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
endmodule


module mux_2 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n1;
  tri   [7:0] out;

  INVX2 U1 ( .A(n10), .Y(out[7]) );
  INVX2 U2 ( .A(n11), .Y(out[6]) );
  INVX2 U3 ( .A(n12), .Y(out[5]) );
  INVX2 U4 ( .A(n13), .Y(out[4]) );
  INVX2 U5 ( .A(n14), .Y(out[3]) );
  INVX2 U6 ( .A(n15), .Y(out[2]) );
  INVX2 U7 ( .A(n16), .Y(out[1]) );
  INVX2 U8 ( .A(n17), .Y(out[0]) );
  INVX2 U9 ( .A(n1), .Y(n9) );
  AOI22X1 U10 ( .A(n1), .B(a[7]), .C(b[7]), .D(n9), .Y(n10) );
  AOI22X1 U11 ( .A(a[6]), .B(n1), .C(b[6]), .D(n9), .Y(n11) );
  AOI22X1 U12 ( .A(a[5]), .B(n1), .C(b[5]), .D(n9), .Y(n12) );
  AOI22X1 U13 ( .A(a[4]), .B(n1), .C(b[4]), .D(n9), .Y(n13) );
  AOI22X1 U14 ( .A(a[3]), .B(n1), .C(b[3]), .D(n9), .Y(n14) );
  AOI22X1 U15 ( .A(a[2]), .B(n1), .C(b[2]), .D(n9), .Y(n15) );
  AOI22X1 U16 ( .A(a[1]), .B(n1), .C(b[1]), .D(n9), .Y(n16) );
  AOI22X1 U17 ( .A(a[0]), .B(n1), .C(b[0]), .D(n9), .Y(n17) );
  BUFX2 U18 ( .A(sel), .Y(n1) );
endmodule


module mux4_1 ( a, b, c, d, sel, out );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  tri   [7:0] out;

  AND2X2 U1 ( .A(sel[1]), .B(n1), .Y(n5) );
  AND2X2 U2 ( .A(sel[1]), .B(sel[0]), .Y(n4) );
  INVX2 U3 ( .A(sel[0]), .Y(n1) );
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
endmodule


module mux_smallData ( a, b, sel, out );
  input [2:0] a;
  input [2:0] b;
  output [2:0] out;
  input sel;
  wire   n4, n5, n6, n7;
  tri   [2:0] b;
  tri   [2:0] out;

  INVX2 U1 ( .A(n5), .Y(out[2]) );
  INVX2 U2 ( .A(n6), .Y(out[1]) );
  INVX2 U3 ( .A(n7), .Y(out[0]) );
  INVX2 U4 ( .A(sel), .Y(n4) );
  AOI22X1 U5 ( .A(sel), .B(a[2]), .C(b[2]), .D(n4), .Y(n5) );
  AOI22X1 U6 ( .A(a[1]), .B(sel), .C(b[1]), .D(n4), .Y(n6) );
  AOI22X1 U7 ( .A(a[0]), .B(sel), .C(b[0]), .D(n4), .Y(n7) );
endmodule


module dff8bit_0 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module dff8bit_1 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module dff8bit_2 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   [7:0] d;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module dff8bit_3 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   [7:0] d;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module dff8bit_4 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   [7:0] d;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module dff8bit_5 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module dff8bit_6 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   clk;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module dff8bit_7 ( d, clk, rst, en, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst, en;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36;
  tri   clk;
  tri   [7:0] q;

  DFFPOSX1 q_reg_7_ ( .D(n36), .CLK(clk), .Q(q[7]) );
  DFFPOSX1 q_reg_6_ ( .D(n35), .CLK(clk), .Q(q[6]) );
  DFFPOSX1 q_reg_5_ ( .D(n34), .CLK(clk), .Q(q[5]) );
  DFFPOSX1 q_reg_4_ ( .D(n33), .CLK(clk), .Q(q[4]) );
  DFFPOSX1 q_reg_3_ ( .D(n32), .CLK(clk), .Q(q[3]) );
  DFFPOSX1 q_reg_2_ ( .D(n31), .CLK(clk), .Q(q[2]) );
  DFFPOSX1 q_reg_1_ ( .D(n30), .CLK(clk), .Q(q[1]) );
  DFFPOSX1 q_reg_0_ ( .D(n29), .CLK(clk), .Q(q[0]) );
  INVX2 U2 ( .A(n19), .Y(n36) );
  INVX2 U3 ( .A(n20), .Y(n35) );
  INVX2 U4 ( .A(n21), .Y(n34) );
  INVX2 U5 ( .A(n22), .Y(n33) );
  INVX2 U6 ( .A(n23), .Y(n32) );
  INVX2 U7 ( .A(n24), .Y(n31) );
  INVX2 U8 ( .A(n25), .Y(n30) );
  INVX2 U9 ( .A(n28), .Y(n29) );
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
endmodule


module mux_0 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n11, n12;
  tri   [7:0] out;

  INVX2 U1 ( .A(n11), .Y(out[7]) );
  INVX2 U2 ( .A(n8), .Y(out[6]) );
  INVX2 U3 ( .A(n7), .Y(out[5]) );
  INVX2 U4 ( .A(n6), .Y(out[4]) );
  INVX2 U5 ( .A(n5), .Y(out[3]) );
  INVX2 U6 ( .A(n4), .Y(out[2]) );
  INVX2 U7 ( .A(n3), .Y(out[1]) );
  INVX2 U8 ( .A(n2), .Y(out[0]) );
  INVX2 U9 ( .A(n1), .Y(n12) );
  AOI22X1 U10 ( .A(n1), .B(a[7]), .C(b[7]), .D(n12), .Y(n11) );
  AOI22X1 U11 ( .A(a[6]), .B(n1), .C(b[6]), .D(n12), .Y(n8) );
  AOI22X1 U12 ( .A(a[5]), .B(n1), .C(b[5]), .D(n12), .Y(n7) );
  AOI22X1 U13 ( .A(a[4]), .B(n1), .C(b[4]), .D(n12), .Y(n6) );
  AOI22X1 U14 ( .A(a[3]), .B(n1), .C(b[3]), .D(n12), .Y(n5) );
  AOI22X1 U15 ( .A(a[2]), .B(n1), .C(b[2]), .D(n12), .Y(n4) );
  AOI22X1 U16 ( .A(a[1]), .B(n1), .C(b[1]), .D(n12), .Y(n3) );
  AOI22X1 U17 ( .A(a[0]), .B(n1), .C(b[0]), .D(n12), .Y(n2) );
  BUFX2 U18 ( .A(sel), .Y(n1) );
endmodule


module mux_1 ( a, b, sel, out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out;
  input sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n11, n12;

  INVX2 U1 ( .A(n11), .Y(out[7]) );
  INVX2 U2 ( .A(n8), .Y(out[6]) );
  INVX2 U3 ( .A(n7), .Y(out[5]) );
  INVX2 U4 ( .A(n6), .Y(out[4]) );
  INVX2 U5 ( .A(n5), .Y(out[3]) );
  INVX2 U6 ( .A(n4), .Y(out[2]) );
  INVX2 U7 ( .A(n3), .Y(out[1]) );
  INVX2 U8 ( .A(n2), .Y(out[0]) );
  INVX2 U9 ( .A(n1), .Y(n12) );
  AOI22X1 U10 ( .A(n1), .B(a[7]), .C(b[7]), .D(n12), .Y(n11) );
  AOI22X1 U11 ( .A(a[6]), .B(n1), .C(b[6]), .D(n12), .Y(n8) );
  AOI22X1 U12 ( .A(a[5]), .B(n1), .C(b[5]), .D(n12), .Y(n7) );
  AOI22X1 U13 ( .A(a[4]), .B(n1), .C(b[4]), .D(n12), .Y(n6) );
  AOI22X1 U14 ( .A(a[3]), .B(n1), .C(b[3]), .D(n12), .Y(n5) );
  AOI22X1 U15 ( .A(a[2]), .B(n1), .C(b[2]), .D(n12), .Y(n4) );
  AOI22X1 U16 ( .A(a[1]), .B(n1), .C(b[1]), .D(n12), .Y(n3) );
  AOI22X1 U17 ( .A(a[0]), .B(n1), .C(b[0]), .D(n12), .Y(n2) );
  BUFX2 U18 ( .A(sel), .Y(n1) );
endmodule


module mux4_0 ( a, b, c, d, sel, out );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input [7:0] d;
  input [1:0] sel;
  output [7:0] out;
  wire   n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42;
  tri   [7:0] a;

  AND2X2 U1 ( .A(sel[1]), .B(n42), .Y(n38) );
  AND2X2 U2 ( .A(sel[1]), .B(sel[0]), .Y(n39) );
  INVX2 U3 ( .A(sel[0]), .Y(n42) );
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
  NOR2X1 U29 ( .A(n42), .B(sel[1]), .Y(n37) );
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
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [7:0] to_mux_to_srca;
  wire   [7:0] aluout;
  wire   [7:0] nextpc;
  wire   [7:0] pc;
  wire   [7:0] data;
  tri   [2:0] alucontrol;
  tri   regwrite;
  tri   clk;
  tri   [7:0] rd1;
  tri   [7:0] rd2;
  tri   [7:0] aluresult;
  tri   [7:0] srca;
  tri   [7:0] srcb;
  tri   [7:0] wd;
  tri   [2:0] wa;

  dff8bit_8 instr_dtf1 ( .d({n33, n31, n29, n27, n25, n23, n21, n19}), .clk(
        clk), .rst(n37), .en(irwrite[0]), .q(instr[31:24]) );
  dff8bit_7 instr_dtf2 ( .d({n33, n31, n29, n27, n25, n23, n21, n19}), .clk(
        clk), .rst(n37), .en(irwrite[1]), .q(instr[23:16]) );
  dff8bit_6 instr_dtf3 ( .d({n33, n31, n29, n27, n25, n23, n21, n19}), .clk(
        clk), .rst(n37), .en(irwrite[2]), .q(instr[15:8]) );
  dff8bit_5 instr_dtf4 ( .d({n33, n31, n29, n27, n25, n23, n21, n19}), .clk(
        clk), .rst(n37), .en(irwrite[3]), .q(instr[7:0]) );
  dff8bit_4 rd_dtf1 ( .d(rd1), .clk(clk), .rst(n37), .en(n34), .q(
        to_mux_to_srca) );
  dff8bit_3 rd_dtf2 ( .d(rd2), .clk(clk), .rst(n37), .en(n34), .q(writedata)
         );
  dff8bit_2 aluout_dtf ( .d(aluresult), .clk(clk), .rst(n37), .en(n34), .q(
        aluout) );
  dff8bit_1 pc_dtf ( .d(nextpc), .clk(clk), .rst(n37), .en(pcen), .q(pc) );
  dff8bit_0 data_dtf ( .d({n33, n31, n29, n27, n25, n23, n21, n19}), .clk(clk), 
        .rst(n37), .en(n34), .q(data) );
  mux_2 rd1_mux ( .a(to_mux_to_srca), .b(pc), .sel(alusrca), .out(srca) );
  mux4_1 rd2_mux ( .a(writedata), .b({n35, n35, n35, n35, n35, n35, n35, n34}), 
        .c(instr[7:0]), .d({instr[5:0], n35, n35}), .sel({n17, n11}), .out(
        srcb) );
  mux4_0 nextpc_mux ( .a(aluresult), .b(aluout), .c({instr[5:0], n35, n35}), 
        .d({n35, n35, n35, n35, n35, n35, n35, n35}), .sel({n15, n9}), .out(
        nextpc) );
  mux_1 adr_mux ( .a(aluout), .b(pc), .sel(iord), .out(adr) );
  mux_0 wd_mux ( .a(data), .b(aluout), .sel(memtoreg), .out(wd) );
  mux_smallData wa_mux ( .a(instr[13:11]), .b(instr[18:16]), .sel(n13), .out(
        wa) );
  regfile test_reg ( .rd1(rd1), .rd2(rd2), .clk(clk), .regwrite(regwrite), 
        .ra1(instr[23:21]), .ra2(instr[18:16]), .wa(wa), .wd(wd) );
  alu inst_alu ( .result(aluresult), .a(srca), .b(srcb), .alucont(alucontrol)
         );
  NOR2X1 U2 ( .A(n2), .B(n3), .Y(zero) );
  NAND2X1 U3 ( .A(n4), .B(n5), .Y(n3) );
  NOR2X1 U4 ( .A(aluresult[3]), .B(aluresult[2]), .Y(n5) );
  NOR2X1 U5 ( .A(aluresult[1]), .B(aluresult[0]), .Y(n4) );
  NAND2X1 U6 ( .A(n6), .B(n7), .Y(n2) );
  NOR2X1 U7 ( .A(aluresult[7]), .B(aluresult[6]), .Y(n7) );
  NOR2X1 U8 ( .A(aluresult[5]), .B(aluresult[4]), .Y(n6) );
  INVX2 U9 ( .A(pcsource[0]), .Y(n8) );
  INVX2 U10 ( .A(n8), .Y(n9) );
  INVX2 U11 ( .A(alusrcb[0]), .Y(n10) );
  INVX2 U12 ( .A(n10), .Y(n11) );
  INVX2 U13 ( .A(regdst), .Y(n12) );
  INVX2 U14 ( .A(n12), .Y(n13) );
  INVX2 U15 ( .A(pcsource[1]), .Y(n14) );
  INVX2 U16 ( .A(n14), .Y(n15) );
  INVX2 U17 ( .A(alusrcb[1]), .Y(n16) );
  INVX2 U18 ( .A(n16), .Y(n17) );
  INVX2 U19 ( .A(memdata[0]), .Y(n18) );
  INVX2 U20 ( .A(n18), .Y(n19) );
  INVX2 U21 ( .A(memdata[1]), .Y(n20) );
  INVX2 U22 ( .A(n20), .Y(n21) );
  INVX2 U23 ( .A(memdata[2]), .Y(n22) );
  INVX2 U24 ( .A(n22), .Y(n23) );
  INVX2 U25 ( .A(memdata[3]), .Y(n24) );
  INVX2 U26 ( .A(n24), .Y(n25) );
  INVX2 U27 ( .A(memdata[4]), .Y(n26) );
  INVX2 U28 ( .A(n26), .Y(n27) );
  INVX2 U29 ( .A(memdata[5]), .Y(n28) );
  INVX2 U30 ( .A(n28), .Y(n29) );
  INVX2 U31 ( .A(memdata[6]), .Y(n30) );
  INVX2 U32 ( .A(n30), .Y(n31) );
  INVX2 U33 ( .A(memdata[7]), .Y(n32) );
  INVX2 U34 ( .A(n32), .Y(n33) );
  INVX2 U35 ( .A(n34), .Y(n35) );
  INVX2 U36 ( .A(n36), .Y(n37) );
  INVX2 U37 ( .A(const_gnd), .Y(n34) );
  INVX2 U38 ( .A(reset), .Y(n36) );
endmodule

