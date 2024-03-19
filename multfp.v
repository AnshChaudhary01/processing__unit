// Code your design here
`timescale 1ns / 1ps

 module fp_mult (input [31:0] a , input [31:0] b,output [31:0] product);

    wire sa, sb;                   // Sign bits
    wire [7:0] ea, eb;             // Exponents
    wire [23:0] ma, mb;            // Mantissas
    assign sa = a[31];
    assign ea = a[30:23];
    assign ma = {1'b1, a[22:0]};   
    assign sb = b[31];
    assign eb = b[30:23];
    assign mb = {1'b1, b[22:0]};  
    wire sp;
    assign sp = sa ^ sb;         
    wire [7:0] ep;
    wire [7:0] bias = 8'd127;   
    assign ep = ea + eb - bias;    
    wire [47:0] mp;
    assign mp = ma * mb;          
    wire [22:0] norm_mp;       
    wire [7:0] norm_ep;
    wire [7:0] ep_add;
    assign ep_add = mp[47] ? 8'd1 : 8'd0;
    assign norm_ep = ep + ep_add;
    assign norm_mp = mp[47] ? mp[46:24] : mp[45:23];
    assign product = {sp, norm_ep, norm_mp};

endmodule