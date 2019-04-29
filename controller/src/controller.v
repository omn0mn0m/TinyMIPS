//`timescale 1ns/1ps
module controller (input clk, rst,
    input [5:0] op,
    input zero,
    output reg memread, memwrite, alusrca, memtoreg, iord,
    output pcen,
    output reg regwrite, regdst,
    output reg [1:0] pcsource, alusrcb, aluop,
    output reg [3:0] irwrite,
    output reg [3:0] state); //added testing output 

    /********* State Encodings *********/
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

    /********* Opcodes *****************/
    parameter LB        = 6'b100000;
    parameter SB        = 6'b101000;
    parameter RTYPE     = 6'b000000;
    parameter BEQ       = 6'b100100;
    parameter J         = 6'b100010;
    parameter ADDI      = 6'b001000;

    /******** Local Registers ********/
    reg [3:0] /*state,*/ nextstate; //temporarily removed state from here
    reg pcwrite, pcwritesec;
    reg branch; //this was in fsm but not in notes

    /******** State Registers *******/
    always @(posedge clk) begin //currently set at syn reset
        if (rst) state <= FETCH1;
        else state <= nextstate;
    end

    /******** Next State Logic ******/
    always @(*) begin
        case (state) 
            FETCH1: nextstate <= FETCH2;
            FETCH2: nextstate <= FETCH3;
            FETCH3: nextstate <= FETCH4;
            FETCH4: nextstate <= DECODE;
            DECODE: case(op)
                LB:     nextstate <= MEMADR;
                SB:     nextstate <= MEMADR;
                ADDI:   nextstate <= MEMADR;
                RTYPE:  nextstate <= RTYPEEX;
                BEQ:    nextstate <= BEQEX;
                J:      nextstate <= JEX;
                // Default state should not be entered
                default: nextstate <= FETCH1;
            endcase
            MEMADR: case(op)
                LB:     nextstate <= LBRD;
                SB:     nextstate <= SBWR;
                ADDI:   nextstate <= ADDIWR;
                // Default state should not be entered
                default: nextstate <= FETCH1;
            endcase
            LBRD:    nextstate <= LBWR;
            LBWR:    nextstate <= FETCH1;
            SBWR:    nextstate <= FETCH1;
            RTYPEEX: nextstate <= RTYPEWR;
            BEQEX:   nextstate <= FETCH1;
            JEX:     nextstate <= FETCH1;
            ADDIWR:  nextstate <= FETCH1;
            // Default state should not be entered
            default: nextstate <= FETCH1;
        endcase 
    end
    
    /********Output Logic ***********/
    always @(*) begin
        // Set all outputs to zero, then
        // conditionally assert just the appropriate ones
        irwrite <= 4'b0000;
        pcwrite <= 0;
        pcwritesec <= 0;
        regwrite <= 0;
        regdst <= 0;
        memread <= 0;
        memwrite <= 0;
        alusrca <= 0;
        alusrcb <= 2'b00;
        aluop <= 2'b00;
        pcsource <= 2'b00;
        iord <= 0;
        memtoreg <= 0;
        case(state)
            FETCH1: begin
                memread <= 1;
                irwrite <= 4'b0001;
                alusrcb <= 2'b01;
                pcwrite <= 1;
            end
            FETCH2: begin
                memread <= 1;
                irwrite <= 4'b0010;
                alusrcb <= 2'b01;
                pcwrite <= 1;
            end
            FETCH3: begin
                memread <= 1;
                irwrite <= 4'b0100;
                alusrcb <= 2'b01;
                pcwrite <= 1;
            end
            FETCH4: begin
                memread <= 1;
                irwrite <= 4'b1000;
                alusrcb <= 2'b01;
                pcwrite <= 1;
            end
            DECODE: begin
                alusrca <= 0;
                alusrcb <= 2'b11;
                aluop <= 2'b00;
            end
            MEMADR: begin
                alusrca <= 1;
                alusrcb <= 2'b10;
                aluop <= 2'b00;
            end
            RTYPEEX: begin
                alusrca <= 1;
                alusrcb <= 2'b00;
                aluop <= 2'b00;
            end
            BEQEX: begin
                alusrca <= 1;
                alusrcb <= 2'b00;
                aluop <= 2'b01;
                branch <= 1;
                pcsource <= 2'b01;
            end
            JEX: begin
                pcwrite <= 1;
                pcsource <= 2'b10;
            end
            ADDIWR: begin
            //NEED TO ADD CODE HERE
            //Temp Code copying memwrite presented
                memwrite <= 1;
                iord <= 1;
            end
            LBRD: begin
                memread <= 1;
                iord <= 1;
            end
            SBWR: begin
                memwrite <= 1;
                iord <= 1;
            end
            RTYPEWR: begin
                regdst <= 1;
                regwrite <= 1;
                memtoreg <= 0;
            end
        endcase


    end
endmodule
