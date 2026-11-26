

module Test_Open_XC7(
    input logic clk,
    input logic rst,

    output logic [15:0] led,

    output logic [7:0] D0_SEG,
    output logic [7:0] D1_SEG,

    output logic [3:0] D0_AN,
    output logic [3:0] D1_AN

);

    // root varyables:
    logic slow_clk;
    logic [26:0] clock_Counter;

    // clear the 7 segment displays:
    always_comb begin
        D0_SEG = 8'b11111111;
        D1_SEG = 8'b11111111;
        D0_AN = 4'b1111;
        D1_AN = 4'b1111;

        led[1] = 1'd1;
    end

    // create 1 Hz clock:
    always_ff @(posedge clk) begin

        if (rst) begin
            clock_counter <= 27'b0;
            led[0] = 1'b1;
        end

        if (clock_counter >= 27'd50000000) begin
            clock_counter <= 27'b0;
            slow_clk <= ~slow_clk;
        end else begin
            clock_Counter <= clock_Counter + 27'b1;
        end

    end

    always_ff @(posedge slow_clk) begin
        led[0] = ~led[0];
    end

    

endmodule