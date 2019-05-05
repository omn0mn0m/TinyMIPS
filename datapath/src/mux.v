// 2-Input mux
module mux(input [7:0] a,	
	   input [7:0] b,	
	   input sel,
	   output [7:0] out);

   assign out = sel ? a : b;
      
endmodule // mux

module mux_smallData(input [2:0] a,	
	   input [2:0] b,	
	   input sel,
	   output [2:0] out);

   assign out = sel ? a : b;
      
endmodule // mux_smallData

module mux4(input [7:0] a,
	    input [7:0] b,
	    input [7:0] c,
	    input [7:0] d,
	    input [1:0] sel,
	    output reg [7:0] out);

   always @ (*) begin
      case (sel)
	2'b00: out <= a;
	2'b01: out <= b;
	2'b10: out <= c;
	2'b11: out <= d;
	default: out <= out;
      endcase // case (sel)
   end

endmodule // mux4

