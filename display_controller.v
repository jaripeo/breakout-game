`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dave
// 
// Create Date:    12:18:00 04/22/2025 
// Design Name: 
// Module Name:    display_controller.v 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: VGA Controller for 640x480@60Hz
//
//////////////////////////////////////////////////////////////////////////////////
module display_controller(
    input clk,
    output hSync, vSync,
    output reg bright,
    output reg [9:0] hCount, 
    output reg [9:0] vCount
    );

    // VGA 640x480 @ 60Hz Timing Parameters
    parameter H_ACTIVE = 640;
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_TOTAL = H_ACTIVE + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH; // 800

    parameter V_ACTIVE = 480;
    parameter V_FRONT_PORCH = 10;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 33;
    parameter V_TOTAL = V_ACTIVE + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH; // 525

    reg clk25;
    reg [1:0] clk_div;

    initial begin
        clk25 = 0;
        clk_div = 0;
        hCount = 0;
        vCount = 0;
    end

    // Clock divider: 100 MHz -> 25 MHz
    always @(posedge clk) begin
        clk_div <= clk_div + 1;
        clk25 <= clk_div[1];
    end

    // Horizontal and Vertical counters
    always @(posedge clk25) begin
        if (hCount < H_TOTAL - 1)
            hCount <= hCount + 1;
        else begin
            hCount <= 0;
            if (vCount < V_TOTAL - 1)
                vCount <= vCount + 1;
            else
                vCount <= 0;
        end
    end

    // Generate Sync Pulses
    assign hSync = (hCount < H_SYNC_PULSE);
    assign vSync = (vCount < V_SYNC_PULSE);

    // Bright area (active video)
    always @(posedge clk25) begin
        bright <= (hCount >= (H_SYNC_PULSE + H_BACK_PORCH)) && 
                  (hCount < (H_SYNC_PULSE + H_BACK_PORCH + H_ACTIVE)) &&
                  (vCount >= (V_SYNC_PULSE + V_BACK_PORCH)) && 
                  (vCount < (V_SYNC_PULSE + V_BACK_PORCH + V_ACTIVE));
    end

endmodule
