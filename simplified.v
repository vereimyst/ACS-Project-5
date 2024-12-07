module simplified_logic_adder #(parameter N = 8) (
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    output wire [N-1:0] sum
);
    assign sum = a | b;  // Simplify wire by using OR
endmodule