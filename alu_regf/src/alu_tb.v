module alu_tb();

    parameter FINISH_TIME = 1000;
    parameter PERIOD      = 20;
    parameter WAIT        = 5;

    // DUT Inputs
    // ALU
    reg [7:0] a;
    reg [7:0] b;
    
    // ALUCONTROL
    reg [1:0] aluop;
    reg [5:0] funct;
    
    // REGFILE
    reg clk;
    reg regwrite;
    reg [2:0] ra1;
    reg [2:0] ra2;
    reg [2:0] wa;
    reg [7:0] wd;

    // DUT Outputs
    // ALU
    wire [7:0] result;
    
    // REGFILE
    wire [7:0] rd1;
    wire [7:0] rd2;
    
    // DUT INOUT
    wire [2:0] alucont;
    
    integer i = 0;

    // DUT Instances
    alu test_alu(.result(result),
                 .a(a),
                 .b(b),
                 .alucont(alucont)
                );
                
    alucontrol test_control(.alucont(alucont),
                            .aluop(aluop),
                            .funct(funct)
                           );
                           
    regfile test_reg(.rd1(rd1),
                     .rd2(rd2),
                     .clk(clk),
                     .regwrite(regwrite),
                     .ra1(ra1),
                     .ra2(ra2),
                     .wa(wa),
                     .wd(wd)
                    );

    // Initialisation and Wait
    initial begin
        // ALU
        a = 8'd0;
        b = 8'd0;
        
        // ALUCONTROL
        aluop = 2'd0;
        funct = 6'd0;
        
        // REGFILE
        clk = 1'b0;
        regwrite = 1'b0;
        ra1 = 3'd0;
        ra2 = 3'd0;
        wa = 3'd0;
        wd = 8'd0;

        #FINISH_TIME;
        $display("Finishing simulation due to similation constraint.");
        $display("Time is - %d", $time);
        $finish;
    end

    // DUT Stimulus
    initial begin
        // Write initial values to registers
        #PERIOD;
        wa = 3'd1; wd = 8'b00000001; #WAIT;
        regwrite = 1'b1; #WAIT;
        regwrite = 1'b0; #WAIT;
        
        wa = 3'd2; wd = 8'b00000010; #WAIT;
        regwrite = 1'b1; #WAIT; regwrite = 1'b0; #WAIT;
        
        // All ALUOPs should be 2'b11
        aluop = 2'b11;
        // All operations are using s1 and s2
        ra1 = 3'd1; ra2 = 3'd2; #WAIT;
        a = ra1; b = ra2; #WAIT;
        
        // Perform functions
        // add $s3 $s1 $s2
        funct = 6'b100000; #WAIT;

        wa = 3'd3; wd = result; #WAIT;
        regwrite = 1'b1; #WAIT; regwrite = 1'b0; #WAIT;
        
        // sub $s4 $s2 $s1
        funct = 6'b100010; #WAIT;
        
        wa = 3'd4; wd = result; #WAIT;
        regwrite = 1'b1; #WAIT; regwrite = 1'b0; #WAIT;
        
        // and $s5 $s1 $s2
        funct = 6'b100100; #WAIT;
        
        wa = 3'd5; wd = result; #WAIT;
        regwrite = 1'b1; #WAIT; regwrite = 1'b0; #WAIT;
        
        // or $s6 $s1 $s2
        funct = 6'b100101; #WAIT;
        
        wa = 3'd6; wd = result; #WAIT;
        regwrite = 1'b1; #WAIT; regwrite = 1'b0; #WAIT;
        
        // slt $s7 $s1 $s2
        funct = 6'b101010; #WAIT;
        
        wa = 3'd7; wd = result; #WAIT;
        regwrite = 1'b1; #WAIT; regwrite = 1'b0; #WAIT;
        
        // Print all registers
        
        
        for (i = 0; i < 8; i = i + 2) begin
            ra1 = i;
            ra2 = i + 1;
            
            #WAIT;
            
            $display("$s%d = %d", ra1, rd1);
            $display("$s%d = %d", ra2, rd2);
            
            case (i)
                0:  begin
                        if (0 == rd1 & 1 == rd2)
                            $display("$s%d and $s%d are correct.", ra1, ra2);
                        else begin
                            $display("$s%d and $s%d are incorrect. Finishing.", ra1, ra2);
                            $finish;
                        end
                    end
                2:  begin
                        if (2 == rd1 & 3 == rd2)
                            $display("$s%d and $s%d are correct.", ra1, ra2);
                        else begin
                            $display("$s%d and $s%d are incorrect. Finishing.", ra1, ra2);
                            $finish;
                        end
                    end
                4:  begin
                        if (255 == rd1 & 0 == rd2)
                            $display("$s%d and $s%d are correct.", ra1, ra2);
                        else begin
                            $display("$s%d and $s%d are incorrect. Finishing.", ra1, ra2);
                            $finish;
                        end
                    end
                6:  begin
                        if (3 == rd1 & 1 == rd2)
                            $display("$s%d and $s%d are correct.", ra1, ra2);
                        else begin
                            $display("$s%d and $s%d are incorrect. Finishing.", ra1, ra2);
                            $finish;
                        end
                    end
            endcase
            
            
        end
        
        #PERIOD;
        $display("Finishing simulation due to end of testbench.");
        $display("Time is - %d", $time);
        $finish;
    end

    // Save the output
    initial begin
        $shm_open("alu_tb.db");
        $shm_probe(alu_tb, "AS");
    end
    
    initial begin
        forever #1 clk = ~clk;
    end

endmodule