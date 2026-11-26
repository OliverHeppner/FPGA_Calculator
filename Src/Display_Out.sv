

module Display(
    input logic [11:0] Display_Number,
    input logic [21:0] slow_Clock,
    input logic reset,
    input logic clk,

    output logic [3:0] D0_AN,
    output logic [7:0] D0_SEG
    );

    // defigning states for which 7 segment display is being used.
    typedef enum logic [3:0] { 

        digit_0 = 4'b1000,
        digit_1 = 4'b0100,
        digit_2 = 4'b0010,
        digit_3 = 4'b0001

    } display_Index;

    // defigning states for what number is being displayed on the 7 segment display.
    typedef enum logic [7:0] {

        Display_0 = 8'b11000000, 
        Display_1 = 8'b11001111, 
        Display_2 = 8'b10100100, 
        Display_3 = 8'b10110000, 
        Display_4 = 8'b10011001, 
        Display_5 = 8'b10010010,
        Display_6 = 8'b10000010,
        Display_7 = 8'b11111000, 
        Display_8 = 8'b10000000,
        Display_9 = 8'b10011000

    } display_Digit;

    // ---------- next state logic: ---------- //

    //current state and next state:
    //D0_AN is the output for the cathode of the display. it is also being used to store the current state
    // creating a new varyable would use up extera resourses on the FPGA 
    //and woule be assigned to it anyways

    display_Index next_Index;

    always_ff @(posedge slow_Clock) begin

        case (D0_AN)
            digit_0: D0_AN <= digit_1;
            digit_1: D0_AN <= digit_2;
            digit_2: D0_AN <= digit_3;
            digit_3: D0_AN <= digit_0;
            default: D0_AN <= digit_0;
        endcase

end
    // ---------- Calculating and displaying current digit ---------- //

    always_comb begin

        // calculating the digit to be displayed
        logic [3:0] current_Display_Number;
        case (D0_AN)

            digit_0: current_Display_Number = Display_Number % 10;
            digit_1: current_Display_Number = (Display_Number / 10) % 10;
            digit_2: current_Display_Number = (Display_Number / 100) % 10;
            digit_3: current_Display_Number = (Display_Number / 1000) % 10;
            default: current_Display_Number = 4'b0000;

        endcase

        // translating digits to display outputs
        case (current_Display_Number)

            0: D0_SEG = Display_0;
            1: D0_SEG = Display_1;
            2: D0_SEG = Display_2;
            3: D0_SEG = Display_3;
            4: D0_SEG = Display_4;
            5: D0_SEG = Display_5;
            6: D0_SEG = Display_6;
            7: D0_SEG = Display_7;
            8: D0_SEG = Display_8;
            9: D0_SEG = Display_9;
            default: D0_SEG = Display_0;

        endcase

    end

endmodule