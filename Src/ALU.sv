
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 12:58:33 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input  [11:0] Num_1,
    input  [11:0] Num_2,
    input  [1:0] Operator,
    output logic [11:0] result
    );
    
    always_comb begin
    if (Operator == 00) result = Num_1 + Num_2;
    if (Operator == 01) result = Num_1 - Num_2;
    if (Operator == 10) result = Num_1 * Num_2;
    if (Operator == 11) result = Num_1 / Num_2;
    end
endmodule
