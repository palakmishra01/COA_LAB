`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2026 16:16:51
// Design Name: 
// Module Name: processor
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


module processor (
    input wire       clk,
    input wire       we,
    input wire [3:0] addr,
    input wire [19:0] write_data,
    output wire [7:0] result
);

    // Instruction from memory
    wire [19:0] instruction;

    // Decoded instruction fields
    wire [3:0] opcode;
    wire [7:0] operand_a;
    wire [7:0] operand_b;

    // Extract fields from instruction
    assign opcode   = instruction[19:16];
    assign operand_a = instruction[15:8];
    assign operand_b = instruction[7:0];

    // Instruction memory
    instruction_memory memory (
        .clk(clk),
        .we(we),
        .addr(addr),
        .write_data(write_data),
        .instruction(instruction)
    );

    // CPU / ALU
    cpu processor_cpu (
        .opcode(opcode),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result)
    );

endmodule
