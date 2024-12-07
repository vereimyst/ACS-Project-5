module ripple_carry_adder #(parameter N = 8) (
    input  wire [N-1:0] a,    // Input A
    input  wire [N-1:0] b,    // Input B
    input  wire        cin,   // Carry-In
    output wire [N-1:0] sum,  // Sum
    output wire        cout   // Carry-Out
);
    wire [N:0] carry;  // Carry chain
    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_full_adder
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[N];
endmodule
