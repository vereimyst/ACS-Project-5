`timescale 1ns/1ps

module top_module #(parameter N = 8, CARRY_LIMIT = 4) (
    input wire [N-1:0] a,       // Input A
    input wire [N-1:0] b,       // Input B
    input wire clk,             // Clock for stochastic adder
    output wire [N-1:0] sum_exact,       // Exact sum (Ripple Carry Adder)
    output wire [N-1:0] sum_truncated,   // Truncated Adder
    output wire [N-1:0] sum_simplified,  // Simplified wire Adder
    output wire [N-1:0] sum_reduced,     // Reduced Carry Propagation Adder
    output wire [N-1:0] sum_stochastic   // Stochastic Adder
);
    wire cout_exact; // Carry-out for the exact Ripple Carry Adder

    // Instantiate Ripple Carry Adder for exact calculation
    ripple_carry_adder #(N) exact_adder (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum_exact),
        .cout(cout_exact)
    );

    // Instantiate Truncated Adder
    truncated_adder #(N, N/2) truncated_adder_inst (
        .a(a),
        .b(b),
        .sum(sum_truncated)
    );

    // Instantiate Simplified wire Adder
    simplified_logic_adder #(N) simplified_adder_inst (
        .a(a),
        .b(b),
        .sum(sum_simplified)
    );

    // Instantiate Reduced Carry Propagation Adder
    reduced_carry_adder #(N, CARRY_LIMIT) reduced_adder_inst (
        .a(a),
        .b(b),
        .sum(sum_reduced)
    );

    // Instantiate Stochastic Adder
    stochastic_adder #(N) stochastic_adder_inst (
        .a(a),
        .b(b),
        .clk(clk),
        .sum(sum_stochastic)
    );

endmodule
