`timescale 1ps/1ps

module processor_unit (
    input wire [31:0] previous,
    input wire [31:0] array1_0,
    input wire [31:0] array1_1,
    input wire [31:0] array2_0,
    input wire [31:0] array2_1,
    output reg [31:0] out
);

    wire [31:0] products [0:1];
    wire [31:0] sums [0:1];
    // Instantiate multipliers
    fp_mult mult_inst0 (
        .a(array1_0),
        .b(array2_0),
        .product(products[0])
    );

    fp_mult mult_inst1 (
        .a(array1_1),
        .b(array2_1),
        .product(products[1])
    );

    // Instantiate adders
    FloatingAddition add_inst0 (
        .A(products[0]),
        .B(previous),
        .result(sums[0])
    );

    FloatingAddition add_inst1 (
        .A(products[1]),
        .B(sums[0]),
        .result(sums[1])
    );

    always @(*) begin
        out = sums[1];
    end

endmodule


