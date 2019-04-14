module controller_tb();

    parameter FINISH_TIME = 2000;
    parameter PERIOD      = 20;
    parameter WAIT        = 5;
    parameter INSTR_WAIT  = 5;
    parameter EXEC_WAIT   = 10;

    // DUT Inputs
    reg        clk;
    reg        rst;
    reg [5:0]  op;
    reg        zero;

    // DUT Outputs
    wire       memread;
    wire       memwrite;
    wire       alusrca;
    wire       memtoreg;
    wire       iord;
    wire       pcen;
    wire       regwrite;
    wire       regdst;
    wire [1:0] pcsource;
    wire [1:0] alsrcb;
    wire [1:0] aluop;
    wire [3:0] irwrite;

    // State Encodings
    parameter FETCH1     = 4'b0001;
    parameter FETCH2     = 4'b0010;
    parameter FETCH3     = 4'b0011;
    parameter FETCH4     = 4'b0100;
    parameter DECODE     = 4'b0101;
    parameter MEMADR     = 4'b0110;
    parameter LBRD       = 4'b0111;
    parameter LBWR       = 4'b1000;   
    parameter SBWR       = 4'b1001;
    parameter RTYPEEX    = 4'b1010;
    parameter RTYPEWR    = 4'b1011;
    parameter BEQEX      = 4'b1100;
    parameter JEX        = 4'b1101;
    parameter ADDIWR     = 4'b1110; //for immediate add

    // Opcodes
    parameter LB        = 6'b100000;
    parameter SB        = 6'b101000;
    parameter RTYPE     = 6'b000000;
    parameter BEQ       = 6'b100100;
    parameter J         = 6'b100010;
    parameter ADDI      = 6'b001000;

    // DUT Instances
    controller(.clk(clk),
               .rst(rst),
               .op(op),
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

    // Initialisation and Wait
    initial begin
        clk  = 1'b0;
        rst  = 1'b0;
        op   = 6'b000000;
        zero = 1'b0;

        #FINISH_TIME;
        $display("Finishing simulation due to similation constraint.");
        $display("Time is - %d", $time);
        $finish;
    end

    // DUT Stimulus
    initial begin
        // Write initial values to registers
        #PERIOD;
        rst = 1; #WAIT; rst = 0; #WAIT;

        op = LB; #INSTR_WAIT; #EXEC_WAIT;
        op = SB; #INSTR_WAIT; #EXEC_WAIT;
        op = RTYPE; #INSTR_WAIT; #EXEC_WAIT;
        op = BEQ; #INSTR_WAIT; #EXEC_WAIT;
        op = J; #INSTR_WAIT; #EXEC_WAIT;
        op = ADDI; #INSTR_WAIT; #EXEC_WAIT;
        
        #PERIOD;
        $display("Finishing simulation due to end of testbench.");
        $display("Time is - %d", $time);
        $finish;
    end

    // Save the output
    initial begin
        $shm_open("controller_tb.db");
        $shm_probe(alu_tb, "AS");
    end
    
    initial begin
        forever #1 clk = ~clk;
    end

endmodule