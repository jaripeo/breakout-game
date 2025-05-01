`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Design Name: Breakout Top with Lives and Score Display
// Engineer: Dave
// 
// Create Date:    12:18:00 04/22/2025 
//////////////////////////////////////////////////////////////////////////////////
module breakout_top(
    input ClkPort,
    input BtnC, BtnL, BtnR, BtnU,
    input [1:0] DifficultySwitch, 
    output hSync, vSync,
    output [3:0] vgaR, vgaG, vgaB,
    output Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp,
    output An0, An1, An2, An3, An4, An5, An6, An7
);

    // Internal signals
    wire bright;
    wire [9:0] hCount, vCount;
    wire [11:0] rgb;
    wire ball_lost;
    wire [7:0] score;
    wire [1:0] lives;
    wire game_won;

    reg [6:0] ssd_segments;   // Only segments a-g
    reg Dp_reg;               // Separate Dp for colon (active low)
    reg [7:0] anodes;
    reg [19:0] refresh_counter = 0;
    wire [2:0] ssdscan_clk;

    // VGA timing controller
    display_controller dc(
        .clk(ClkPort),
        .hSync(hSync),
        .vSync(vSync),
        .bright(bright),
        .hCount(hCount),
        .vCount(vCount)
    );

    // Game logic
    breakout_game game(
        .clk(ClkPort),
        .bright(bright),
        .hCount(hCount),
        .vCount(vCount),
        .btnL(BtnL),
        .btnR(BtnR),
        .btnC(BtnC),
        .btnU(BtnU),
        .rgb(rgb),
        .ball_lost(ball_lost),
        .score(score),
        .lives(lives),
        .difficulty(DifficultySwitch),
        .ballX(), .ballY(),
        .game_won(game_won)
    );

    assign vgaR = rgb[11:8];
    assign vgaG = rgb[7:4];
    assign vgaB = rgb[3:0];

    // SSD scanning clock
    always @(posedge ClkPort) begin
        refresh_counter <= refresh_counter + 1;
    end

    assign ssdscan_clk = refresh_counter[19:17];

    // SSD Display logic
    always @(*) begin
        Dp_reg = 1'b1; // Default Dp OFF

        case (ssdscan_clk)
            3'b000: begin 
                anodes = 8'b01111111; 
                if (lives == 0)
                    ssd_segments = 7'b1110001; // L
                else
                    ssd_segments = 7'b1111111; // Blank (An7)
            end
            3'b001: begin 
                anodes = 8'b10111111;
                if (game_won)
                    ssd_segments = 7'b1000001; // W
                else if (lives == 0)
                    ssd_segments = 7'b0000001; // O
                else begin
                    ssd_segments = 7'b1110001; // L
                    Dp_reg = 1'b0; // Colon effect only when not LOSE
                end
            end
            3'b010: begin 
                anodes = 8'b11011111;
                if (game_won)
                    ssd_segments = 7'b0000001; // I
                else if (lives == 0)
                    ssd_segments = 7'b0100100; // S
                else begin
                    case (lives)
                        2'd3: ssd_segments = 7'b0000110; // 3
                        2'd2: ssd_segments = 7'b0010010; // 2
                        2'd1: ssd_segments = 7'b1001111; // 1
                        default: ssd_segments = 7'b0000001; // 0
                    endcase
                end
            end
            3'b011: begin 
                anodes = 8'b11101111;
                if (game_won)
                    ssd_segments = 7'b0001001; // N
                else if (lives == 0)
                    ssd_segments = 7'b0110000; // E
                else
                    ssd_segments = 7'b1111111; // Blank (An4)
            end
            3'b100: begin 
                anodes = 8'b11110111;
                ssd_segments = 7'b1111111; // Blank (An3)
            end
            3'b101: begin 
                anodes = 8'b11111011;
                case (score / 10) // TEN's place -> An2
                    4'd0: ssd_segments = 7'b0000001;
                    4'd1: ssd_segments = 7'b1001111;
                    4'd2: ssd_segments = 7'b0010010;
                    default: ssd_segments = 7'b1111111;
                endcase
            end
            3'b110: begin 
                anodes = 8'b11111101;
                case (score % 10) // ONE's place -> An1
                    4'd0: ssd_segments = 7'b0000001;
                    4'd1: ssd_segments = 7'b1001111;
                    4'd2: ssd_segments = 7'b0010010;
                    4'd3: ssd_segments = 7'b0000110;
                    4'd4: ssd_segments = 7'b1001100;
                    4'd5: ssd_segments = 7'b0100100;
                    4'd6: ssd_segments = 7'b0100000;
                    4'd7: ssd_segments = 7'b0001111;
                    4'd8: ssd_segments = 7'b0000000;
                    4'd9: ssd_segments = 7'b0000100;
                    default: ssd_segments = 7'b1111111;
                endcase
            end
            3'b111: begin
                anodes = 8'b11111110;
                ssd_segments = 7'b1111111; // Blank (An0)
            end
        endcase
    end



    // Combine segments + Dp
    assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = {ssd_segments, Dp_reg};
    assign {An7, An6, An5, An4, An3, An2, An1, An0} = anodes;

endmodule
