`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2026 16:16:03
// Design Name: 
// Module Name: cpu
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


module cpu (
    input wire [3:0] opcode,
    input wire [7:0] operand_a,
    input wire [7:0] operand_b,
    output reg [7:0] result
);

    always @(*) begin

        case (opcode)

            // ADD
            4'b0000:
                result = operand_a + operand_b;

            // SUB
            4'b0001:
                result = operand_a - operand_b;

            // AND
            4'b0010:
                result = operand_a & operand_b;

            // OR
            4'b0011:
                result = operand_a | operand_b;

            // XOR
            4'b0100:
                result = operand_a ^ operand_b;

            // MUL
            4'b0101:
                result = operand_a * operand_b;

            // Unsupported opcode
            default:
                result = 8'b0;

        endcase

    end

endmodule
