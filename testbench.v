`timescale 1ns/1ps

module testbench;
    parameter N = 8;
    parameter CARRY_LIMIT = 4;

    reg [N-1:0] a, b;          // Test inputs
    reg clk;                   // Clock for stochastic adder
    wire [N-1:0] sum_exact;    // Ripple Carry Adder output
    wire [N-1:0] sum_truncated;  // Truncated Adder output
    wire [N-1:0] sum_simplified; // Simplified wire Adder output
    wire [N-1:0] sum_reduced;    // Reduced Carry Adder output
    wire [N-1:0] sum_stochastic; // Stochastic Adder output

    // Instantiate Top Module
    top_module #(N, CARRY_LIMIT) uut (
        .a(a),
        .b(b),
        .clk(clk),
        .sum_exact(sum_exact),
        .sum_truncated(sum_truncated),
        .sum_simplified(sum_simplified),
        .sum_reduced(sum_reduced),
        .sum_stochastic(sum_stochastic)
    );

    // Generate Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test Stimulus
    initial begin
        $display("Starting Tests...");

        // Test Case 1
        a = 8'b00011011; b = 8'b00100101;
        #10; // Wait for outputs to settle
        $display("A = %b, B = %b", a, b);
        $display("Exact Sum        = %b", sum_exact);
        $display("Truncated Sum    = %b", sum_truncated);
        $display("Simplified Sum   = %b", sum_simplified);
        $display("Reduced Sum      = %b", sum_reduced);
        $display("Stochastic Sum   = %b", sum_stochastic);

        // Test Case 2
        a = 8'b11110000; b = 8'b00001111;
        #10;
        $display("A = %b, B = %b", a, b);
        $display("Exact Sum        = %b", sum_exact);
        $display("Truncated Sum    = %b", sum_truncated);
        $display("Simplified Sum   = %b", sum_simplified);
        $display("Reduced Sum      = %b", sum_reduced);
        $display("Stochastic Sum   = %b", sum_stochastic);

        // Test Case 3
        a = 8'b10101010; b = 8'b01010101;
        #10;
        $display("A = %b, B = %b", a, b);
        $display("Exact Sum        = %b", sum_exact);
        $display("Truncated Sum    = %b", sum_truncated);
        $display("Simplified Sum   = %b", sum_simplified);
        $display("Reduced Sum      = %b", sum_reduced);
        $display("Stochastic Sum   = %b", sum_stochastic);

        $finish;
    end
endmodule
