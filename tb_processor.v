`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2026 16:17:44
// Design Name: 
// Module Name: tb_processor
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


`timescale 1ns / 1ps

module tb_processor;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [19:0] write_data;

    wire [7:0] result;

    // Instantiate processor
    processor uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .write_data(write_data),
        .result(result)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk = 0;
        we = 0;
        addr = 0;
        write_data = 20'b0;

        // --------------------------------
        // Test 1: ADD 10 + 20 = 30
        // --------------------------------
        #10;
        addr = 0;
        #1;

        if (result == 8'd30)
            $display("PASS: ADD 10 + 20 = %d", result);
        else
            $display("FAIL: ADD expected 30, got %d", result);


        // --------------------------------
        // Test 2: SUB 30 - 5 = 25
        // --------------------------------
        #10;
        addr = 1;
        #1;

        if (result == 8'd25)
            $display("PASS: SUB 30 - 5 = %d", result);
        else
            $display("FAIL: SUB expected 25, got %d", result);


        // --------------------------------
        // Test 3: AND 15 & 7 = 7
        // --------------------------------
        #10;
        addr = 2;
        #1;

        if (result == 8'd7)
            $display("PASS: AND 15 & 7 = %d", result);
        else
            $display("FAIL: AND expected 7, got %d", result);


        // --------------------------------
        // Test 4: OR 12 | 3 = 15
        // --------------------------------
        #10;
        addr = 3;
        #1;

        if (result == 8'd15)
            $display("PASS: OR 12 | 3 = %d", result);
        else
            $display("FAIL: OR expected 15, got %d", result);


        // --------------------------------
        // Test 5: XOR 10 ^ 5 = 15
        // --------------------------------
        #10;
        addr = 4;
        #1;

        if (result == 8'd15)
            $display("PASS: XOR 10 ^ 5 = %d", result);
        else
            $display("FAIL: XOR expected 15, got %d", result);


        // --------------------------------
        // Test 6: MUL 6 * 7 = 42
        // --------------------------------
        #10;
        addr = 5;
        #1;

        if (result == 8'd42)
            $display("PASS: MUL 6 * 7 = %d", result);
        else
            $display("FAIL: MUL expected 42, got %d", result);


        // Finish simulation
        #10;
        $finish;

    end

endmodule
