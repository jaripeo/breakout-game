// Author: Dave
// Created: April 22, 2025

`timescale 1ns / 1ps

module breakout_game_tb();

    reg clk;
    reg bright;
    reg [9:0] hCount, vCount;
    reg btnL, btnR, btnC, btnU;
    wire [11:0] rgb;
    wire ball_lost;
    wire [7:0] score;
    wire [9:0] ballX, ballY;

    reg [9:0] last_ballX;
    reg [9:0] last_ballY;

    breakout_game uut (
        .clk(clk),
        .bright(bright),
        .hCount(hCount),
        .vCount(vCount),
        .btnL(btnL),
        .btnR(btnR),
        .btnC(btnC),
        .btnU(btnU),
        .rgb(rgb),
        .ball_lost(ball_lost),
        .score(score),
        .ballX(ballX),
        .ballY(ballY)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz
    end

    initial begin
        bright = 1;
        hCount = 200;
        vCount = 80;
        btnL = 0;
        btnR = 0;
        btnC = 0;
        btnU = 0;

        last_ballX = 0;
        last_ballY = 0;

        // Start game
        #10 btnC = 1;
        #10 btnC = 0;

        // Launch ball
        #100 btnU = 1;
        #10 btnU = 0;
    end

    always @(posedge clk) begin
        if ((ballX !== last_ballX) || (ballY !== last_ballY)) begin
            $display("Time %t ns: Ball moved to X=%d, Y=%d, Score=%d", $time, ballX, ballY, score);
            last_ballX <= ballX;
            last_ballY <= ballY;
        end

        if (ball_lost) begin
            $display("GAME OVER at time %t ns. Final Score = %d", $time, score);
            $stop;
        end
    end

endmodule
