`timescale 1 ns/1ps
module test_bn_pro_unit;
// Input registers
reg [31:0] previous;
reg [31:0] array1_0;
reg [31:0] array2_0;
reg [31:0] array1_1;
reg [31:0] array2_1;

// Output wire
wire [31:0] out;

// Instantiate the processor_unit module
processor_unit chl_jaa_bhai (
    .previous(previous),
    .array1_0(array1_0),
    .array1_1(array1_1),
    .array2_0(array2_0),
    .array2_1(array2_1),
    .out(out)
);

initial begin
    previous = 32'b01000001001000000000000000000000; //10
    array1_0 = 32'b00111111110000000000000000000000; //1.5
    array2_0 = 32'b11000000010000000000000000000000; //-3.0
    array1_1 = 32'b11000000001100000000000000000000; //-2.75
    array2_1 = 32'b01000000000000000000000000000000; //2.0

    $monitor("out = %b", out);
    $finish;
end

endmodule
