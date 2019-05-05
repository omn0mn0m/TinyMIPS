module test () ;

   parameter CLK_H = 20 ;    // half clock period
   parameter CLK_P = 40 ;    // full clock period

   // INPUTS (13)
   reg  [2:0]  alucontrol ;  // control signal for ALU
   reg         alusrca    ;  // control signal for 2:1 mux for ALU's srca input
   reg  [1:0]  alusrcb    ;  // control signal for 4:1 mux for ALU's srcb input
   reg 	       iord       ;  // control signal for 2:1 mux from Program counter
   reg  [3:0]  irwrite    ;  // control signal for the 4 DFF's holding the instruction
   reg  [7:0]  memdata    ;  // 8-bit line coming from memory's RD line
   reg 	       memtoreg   ;  // control signal for the 2:1 mux for memory's WD line
   reg         pcen       ;  // control signal for PC's DFF
   reg 	       regdst     ;  // control signal for 2:1 mux for memory's WA line
   reg 	       regwrite   ;  // control signal for regfile
   reg  [1:0]  pcsource   ;  // control signal for 4:1 mux leading to PC register
   reg         clk, reset ;  

   // OUTPUTS (4)
   wire [ 7:0] adr        ;  // output coming from 2:1 mux from program counter
   wire [31:0] instr      ;  // output coming from all 4 DFF's holding the instruction
   wire [ 7:0] writedata  ;  // output leading to WD line on memory
   wire        zero       ;  // output coming from zero detect module


   datapath myDatapath (adr, instr, writedata, zero, 
                        alucontrol, alusrca, alusrcb, iord, irwrite, memdata, 
		        memtoreg, pcen, pcsource, regdst, regwrite,
		        clk, reset ) ;

   initial begin
      $monitor ("CLK= %b, instruction= %b", clk, instr ) ;

      clk <= 0 ; reset <= 1 ; alucontrol <=3'b0 ; alusrca <=0 ;  alusrcb <= 2'b0 ; iord <=0 ; irwrite <= 4'b0 ;
      memtoreg <=0 ; pcen <=0 ; regdst <=0 ; regwrite <=0 ; pcsource <=2'b0 ; memdata<=8'b0 ;

      // wait for clk pulse + 1/2 cycle to send in reset
      #CLK_P $display ("reset now clocked in" ) ; 
      reset <= 0 ;

      // instruction will be: add $s1 $s2 $s3: 0000 0000 0100 0011 0000 1000 0010 0000
      // send in first byte of instruction:
      irwrite <= 4'b0001 ;
      memdata <= 8'b00100000 ;

      // send in 2nd byte of instruction:
      #CLK_P irwrite <=4'b0010 ;
      memdata <= 8'b00001000 ;

      // send in 3rd byte of instruction:
      #CLK_P irwrite <=4'b0100 ;
      memdata <= 8'b01000011 ;

      // send in 4th byte of instruction:
      #CLK_P irwrite <=4'b1000 ;
      memdata <= 8'b00000000 ;

      // TODO - perform a check to see if INSTRUCTION IS IN
      if (instr == 8'b00000000010000110000100000100000) begin
         $display("Instruction fully loaded!");
      end

      // check program counter is set to next pc
      if (pc == nextpc) begin
         $display("PC set to next PC!");
      end

      // Next step, set the necessary control modules to load info into REG FILE
      // may wish to monitor different vars:
      // $monitor ("CLK= %b, instruction= %b", clk, instr ) ;

      // complete the ADD instruction, store results in REG file, verify output

      #CLK_P $finish ;

   end


   always 
      #CLK_H clk = ~clk;


   initial begin
      $shm_open("shm.db");
      $shm_probe(test, "AS");
      $shm_save;
   end

endmodule
