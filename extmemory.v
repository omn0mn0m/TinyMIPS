module extmemory(input memwrite,
                 input memread,
                 input [7:0] adr,
                 input [7:0] writedata,
                 input clk,
                 output reg [7:0] memdata);

    reg [7:0] mem [0:255];

    integer i;

    // Read in initial memory file
    initial begin
        // Set all to 0
        for (i = 0; i < 256; i = i + 1) begin
            mem[i] = 8'b0;
        end

        $readmemb("memory_files/instructions.mem", mem);
    end

    // Behaviours
    always @ (posedge clk) begin
        if (memread) begin
            memdata = mem[adr];
        end

        if (memwrite) begin
             mem[adr] = writedata;
        end
    end

endmodule // extmemory