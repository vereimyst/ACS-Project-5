module truncated_adder #(parameter N = 8, T = 4) ( // T = number of truncated bits
    input  wire [N-1:0] a, 
    input  wire [N-1:0] b,
    output wire [N-1:0] sum
);
    wire [N-1:T] a_truncated, b_truncated;
    assign a_truncated = a[N-1:T];  // Keep MSBs
    assign b_truncated = b[N-1:T];
    assign sum[N-1:T] = a_truncated + b_truncated;  // Add truncated MSBs
    assign sum[T-1:0] = 0;  // Zero out LSBs
endmodule