module full_adder (
    input  wire a,     // Input A
    input  wire b,     // Input B
    input  wire cin,   // Carry-In
    output wire sum,   // Sum
    output wire cout   // Carry-Out
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule
