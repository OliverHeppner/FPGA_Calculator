
module Keypad(
    input logic [3:0] Columns,
    input logic [21:0] slow_Clock,
    input logic clk,
    input logic reset,
    
    output logic [3:0] Row,
    output logic [11:0] Output_Number
    );
    
    logic [3:0] Clock_Counter;
    
    typedef enum logic [3:0] {
        column_1 = 4'b0001,
        column_2 = 4'b0010,
        column_3 = 4'b0100,
        column_4 = 4'b1000
    } column_State;
        
    
    typedef enum logic [3:0] {
        row_1 = 4'b1000,
        row_2 = 4'b0100,
        row_3 = 4'b0010,
        row_4 = 4'b0001
    } row_State;
    
    //next state logic
    always_ff @ (posedge slow_Clock) begin

            case (Row)
                row_1: Row <= row_2;
                row_2: Row <= row_3;
                row_3: Row <= row_4;
                row_4: Row <= row_1;
                default: Row <= row_1;
            endcase

    end
    
    
    //checking for button presses:
    always_comb begin
    
        if (Row == row_1) begin
            case (Columns)
                column_1: Output_Number <=   11'b00000000001;
                column_2: Output_Number <=   11'b00000000010;
                column_3: Output_Number <=   11'b00000000011;
                column_4: Output_Number <=   11'b11111111001;  //figure out A
                default: Output_Number  <=   11'b11111111111;
            endcase
        end else if (Row == row_2) begin
            case (Columns)
                column_1: Output_Number <=   11'b00000000100;
                column_2: Output_Number <=   11'b00000000101;
                column_3: Output_Number <=   11'b00000000110;
                column_4: Output_Number <=   11'b11111111010; // figure out B
                default: Output_Number  <=   11'b11111111111;
            endcase
        end else if (Row == row_3) begin
            case (Columns)
                column_1: Output_Number <=   11'b00000000111;
                column_2: Output_Number <=   11'b00000001000;
                column_3: Output_Number <=   11'b00000001001;
                column_4: Output_Number <=   11'b11111111011; //figure out C
                default: Output_Number  <=   11'b11111111111;
            endcase
        end else if (Row == row_4) begin
            case (Columns)
                column_1: Output_Number <=   11'b11111111101; // figure out *
                column_2: Output_Number <=   11'b00000000000; 
                column_3: Output_Number <=   11'b11111111110; // figure out #
                column_4: Output_Number <=   11'b11111111100; // figure out D
                default: Output_Number  <=   11'b11111111111;
            endcase
        end else begin
            Output_Number <= 11'b11111111111;
        end       
    end
    
endmodule
