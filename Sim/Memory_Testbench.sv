`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 01:57:58 PM
// Design Name: 
// Module Name: Memory_TB
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


module Memory_TB;

    logic [3:0] Input_IO;
    logic [10:0] Input_ALU_Result;
    logic [1:0] Store_adress;
    logic Recall_Adress;
    logic keypad_Store;
    logic ALU_Store;
    
    logic clk;
    
    logic Output_ALU_Num_1;
    logic Output_ALU_Num_2;
    logic Output_ALU_Opperation;
    logic Output_Display;
    
    
    Memory dut (    
    
        .Input_IO(Input_IO), 
        .Input_ALU_Result(Input_ALU_Result), 
        .Store_Adress(Store_Adress), 
        .Recall_Adress(Recall_Adress), 
        .Keypad_Store(Keypad_Store), 
        .ALU_Store(ALU_Store), 
        .clk(clk),
        .Output_ALU_Num_1(Output_ALU_Num_1), 
        .Output_ALU_Num_2(Output_ALU_Num_2), 
        .Output_ALU_Opperation(Output_ALU_Opperation),
        .Output_Display(Output_Display)
        );

        initial begin
        
        // test load 1 + 1, 
        
        keypad_Store = 1'b1;
        Store_adress = 2'b00;
        Input_IO = 4'b0001;
        #10;
        Store_adress = 1'b01;
        Input_IO = 4'b0001;
        
        
        $finish
        end 
    
endmodule
