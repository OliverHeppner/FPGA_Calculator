`timescale 1ns / 1ps

module Keypad_testbench();

    logic [3:0] columns;
    logic [3:0] rows;

    logic reset;
    logic clk;

    logic [11:0] output_Number;

    Keypad Keypad_DUT(
        .Columns(columns),
        .clk(clk),
        .reset(reset),
        .Row(rows),
        .Output_Number(output_Number)
    );

    always begin
        clk = ~clk;
        #1;
    end

    initial begin

        clk = 0;

        reset = 1;
        #10;
        reset = 0;

        columns = 4'b1000;          #20;
        columns = 4'b0000;          #60;

        columns = 4'b0100;          #20;
        columns = 4'b0000;          #60;

        columns = 4'b0000;          #20;
        columns = 4'b0100;          #20;
        columns = 4'b0000;          #40;

        $finish;

    end

endmodule