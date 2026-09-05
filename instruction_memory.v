`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2026 16:10:49
// Design Name: 
// Module Name: instruction_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module instruction_memory (
    input wire        clk,
    input wire        we,
    input wire [3:0]  addr,
    input wire [19:0] write_data,
    output wire [19:0] instruction
);

    // 16 memory locations, each 20 bits
    reg [19:0] mem [0:15];

    // Synchronous write
    always @(posedge clk) begin
        if (we)
            mem[addr] <= write_data;
    end

    // Combinational read
    assign instruction = mem[addr];

    // Initialize memory
    initial begin
        // Address 0: ADD 10, 20
        mem[0] = {4'b0000, 8'd10, 8'd20};

        // Address 1: SUB 30, 5
        mem[1] = {4'b0001, 8'd30, 8'd5};

        // Address 2: AND 15, 7
        mem[2] = {4'b0010, 8'd15, 8'd7};

        // Address 3: OR 12, 3
        mem[3] = {4'b0011, 8'd12, 8'd3};

        // Address 4: XOR 10, 5
        mem[4] = {4'b0100, 8'd10, 8'd5};

        // Address 5: MUL 6, 7
        mem[5] = {4'b0101, 8'd6, 8'd7};

        // Remaining locations
        mem[6]  = 20'b0;
        mem[7]  = 20'b0;
        mem[8]  = 20'b0;
        mem[9]  = 20'b0;
        mem[10] = 20'b0;
        mem[11] = 20'b0;
        mem[12] = 20'b0;
        mem[13] = 20'b0;
        mem[14] = 20'b0;
        mem[15] = 20'b0;
    end

endmodule
