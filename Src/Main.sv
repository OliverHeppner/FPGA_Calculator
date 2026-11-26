
// Main.sv links the keypad and numberpad togather.
// when a key is pressed on the keypad, the number is displayed on the numberpad.
// this is done in a nother module because it seemed like the easest way to do it.


module main(
    input logic [3:0] COLUMNS,
    input logic reset,
    input logic clk,

    output logic [3:0] ROWS,
    output logic [3:0] D0_AN,
    output logic [7:0] D0_SEG
);

    // some logic in Keypad and in Display require a slower clock. 
    // the following creates this clock signal for these modules.

    logic [21:0] clock_Counter;
    logic slow_Clock;
    always_ff @(posedge clk or posedge reset) begin

    if (reset) begin
        clock_Counter <= 20'b0;
    end

    else begin

        if (clock_Counter >= 20'b01111010000100111111) begin

            clock_Counter <= 20'b0;
            slow_Clock = ~slow_Clock;

        end else begin
            clock_Counter <= clock_Counter + 20'b1;
        end

    end

end

    logic [11:0] Display_Number;

    Keypad Keypad_In(
        .Columns(COLUMNS),
        .clk(clk),
        .slow_Clock(slow_Clock),
        .Row(ROWS),
        .Output_Number(Display_Number)
    );

    Display Display_Out(
        .Display_Number(Display_Number),
        .reset(reset),
        .slow_Clock(slow_Clock),
        .clk(clk),
        .D0_AN(D0_AN),
        .D0_SEG(D0_SEG)
    );

endmodule
