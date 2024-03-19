`timescale 1ns / 1ps

module FMTb;   
  reg [31:0] A,B;

  wire [31:0] result;

  fp_mult F_Mult (A,B,result);

initial  
begin
A = 32'b01000000000000000000000000000000;  // 2
B = 32'b01000000000000000000000000000000;  // 2

end

initial
begin
#15

  $display(" Result : %b",result);

$finish;
end

endmodule