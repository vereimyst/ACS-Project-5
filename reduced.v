module reduced_carry_adder #(parameter N = 8, CARRY_LIMIT = 4) (
    input wire [N-1:0] a,       // Input A
    input wire [N-1:0] b,       // Input B
    output wire [N-1:0] sum     // Sum output
);
    wire [N:0] carry;           // Carry chain
    assign carry[0] = 0;        // Initial carry set to 0

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin
            if (i < CARRY_LIMIT) begin
                // Full carry propagation within the limit
                full_adder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(carry[i]),
                    .sum(sum[i]),
                    .cout(carry[i+1])
                );
            end else begin
                // Ignore carry beyond the limit
                assign sum[i] = a[i] ^ b[i]; // XOR for the sum without carry
            end
        end
    endgenerate
endmodule
