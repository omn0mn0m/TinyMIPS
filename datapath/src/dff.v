module dff (input d,
	    input clk,
	    input rst,
	    output reg q,
	    output reg q_not);

   always @ (posedge clk or negedge rst) begin
      if (!rst) begin
	 q = 0;
      end
      else begin
	 q = d;
      end
   end

   assign q_not = ~q;
   
endmodule // Behavioural

