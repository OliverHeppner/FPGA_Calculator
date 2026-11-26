`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 12:53:53 PM
// Design Name: 
// Module Name: Memory
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


module Memory(
    input logic [4:0] Input_IO,
    input logic signed [11:0] Input_ALU_Result,
    input logic [1:0] Store_adress,
    input logic [1:0] Recall_Adress,
    input logic keypad_Store,
    input logic ALU_Store,
    
    input logic clk,
    
    output logic signed [11:0] Output_ALU_Num_1,
    output logic signed [11:0] Output_ALU_Num_2,
    output logic [1:0] Output_ALU_Opperation,
    output logic signed [11:0] Output_Display
    );
    
    //degigning memory locations:
    
    typedef enum logic [1:0] {
        Reg_1 = 2'b00,
        Reg_2 = 2'b01,
        Reg_3 = 2'b10,
        Reg_4 = 2'b11
        } assign_register;
    
    //creating memory locations:
    
    logic signed [11:0] Register_1;
    logic signed [11:0] Register_2;
    logic signed [11:0] Register_3;
    logic signed [11:0] Register_4;
    
    always_ff @ (posedge clk) begin 
    
    // writing to memory:
    
    if (keypad_Store) begin
        if (Store_adress == Reg_1) Register_1 = Input_IO;
        if (Store_adress == Reg_2) Register_2 = Input_IO;
        if (Store_adress == Reg_3) Register_3 = Input_IO;
        if (Store_adress == Reg_4) Register_4 = Input_IO;
        end
        
    if (ALU_Store) begin
        if (Store_adress == 2'b00) Register_1 = Input_IO;
        if (Store_adress == 2'b01) Register_2 = Input_IO;
        if (Store_adress == 2'b10) Register_3 = Input_IO;
        if (Store_adress == 2'b11) Register_4 = Input_IO;
        end
    
    //recalling from memory:
    
    Output_ALU_Num_1 = Register_1;
    Output_ALU_Num_1 = Register_2;
    Output_ALU_Opperation = Register_3;
    Output_Display = Register_4;
    
    
    end
    
endmodule
