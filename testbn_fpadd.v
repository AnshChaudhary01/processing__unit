// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module test_bn;
  reg[31:0]A;
  reg[31:0]B;
  wire [31:0]result;
  FloatingAddition uut(A,B,result);
  initial 
    begin 
      A = 32'b01000000100000000000000000000000;
      B = 32'b01000000000000000000000000000000;
      #5
      $display("%b",result);
    end
  initial 
    begin
    #15 
     A = 32'b01000000100000000000000000000000;
     B = 32'b11000000000000000000000000000000;
     #20
    $display("%b",result);
      
    $finish;
    end
endmodule