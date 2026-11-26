`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 01:36:12 PM
// Design Name: 
// Module Name: ALU_TestBench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_TestBench;
    logic [11:0] Num_1;
    logic [11:0] Num_2;
    logic [1:0] Operator;
    logic [11:0] result;
    
    ALU test_ALU (.Num_1(Num_1), .Num_2(Num_2), .Operator(Operator), .result(result) );
    initial begin 
        Num_1 = 0; Num_2 = 1; Operator = 00; #10;
        Num_1 = 0; Num_2 = 1; Operator = 01; #10;
        Num_1 = 0; Num_2 = 1; Operator = 10; #10;
        Num_1 = 0; Num_2 = 1; Operator = 11; #10;
        
        Num_1 = 00000000101; Num_2 = 1; Operator = 00; #10;
        Num_1 = 00000000101; Num_2 = 1; Operator = 01; #10;
        Num_1 = 00000000101; Num_2 = 1; Operator = 10; #10;
        Num_1 = 00000000101; Num_2 = 1; Operator = 11; #10;
        $finish;
    end
endmodule
