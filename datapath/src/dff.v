`timescale 1ns/10ps

module dff (input d,
	    input clk,
	    input rst,
       input en,
	    output reg q,
	    output q_not);

   always @ (posedge clk) begin //removed negedge reset...make sync
      if (rst) begin
	      q <= 0;
      end
      else begin
         if (en) begin
	         q <= d;
         end
         else begin
            q <= q;
         end
      end
   end

   assign q_not = ~q;
   
endmodule // dff
`timescale 1ns/10ps

module dff8bit (input [7:0] d,
	    input clk,
	    input rst,
       input en,
	    output reg [7:0] q);

   always @ (posedge clk) begin 
      if (rst) begin
	       q <= 8'b00000000;
      end
      else begin
	      if (en) begin
	         q <= d;
         end
         else begin
            q <= q;
         end
      end
   end
   
endmodule // dff
