`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:53 06/12/2014 
// Design Name: 
// Module Name:    seg7decimal 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lookup (input [15:0] inp ,  output [15:0] outp, input clk);
    reg [15:0] outReg;
    assign outp = outReg;
    always @ (posedge clk) begin
    if ( inp == 0 )
        outReg <= 16'b0000000000000000;
    else if ( inp == 1 )
        outReg <= 16'b0010010001111000;
    else if ( inp == 2 )
        outReg <= 16'b0010100001111000;
    else if ( inp == 3 )
        outReg <= 16'b0010101010110011;
    else if ( inp == 4 )
        outReg <= 16'b0010110001110111;
    else if ( inp == 5 )
        outReg <= 16'b0010110110010100;
    else if ( inp == 6 )
        outReg <= 16'b0010111010110001;
    else if ( inp == 7 )
        outReg <= 16'b0010111111001101;
    else if ( inp == 8 )
        outReg <= 16'b0011000001110100;
    else if ( inp == 9 )
        outReg <= 16'b0011000100000010;
    else if ( inp == 10 )
        outReg <= 16'b0011000110001111;
    else if ( inp == 11 )
        outReg <= 16'b0011001000011011;
    else if ( inp == 12 )
        outReg <= 16'b0011001010100111;
    else if ( inp == 13 )
        outReg <= 16'b0011001100110011;
    else if ( inp == 14 )
        outReg <= 16'b0011001110111110;
    else if ( inp == 15 )
        outReg <= 16'b0011010000100100;
    else if ( inp == 16 )
        outReg <= 16'b0011010001101001;
    else if ( inp == 17 )
        outReg <= 16'b0011010010101110;
    else if ( inp == 18 )
        outReg <= 16'b0011010011110010;
    else if ( inp == 19 )
        outReg <= 16'b0011010100110110;
    else if ( inp == 20 )
        outReg <= 16'b0011010101111001;
    else if ( inp == 21 )
        outReg <= 16'b0011010110111100;
    else if ( inp == 22 )
        outReg <= 16'b0011010111111110;
    else if ( inp == 23 )
        outReg <= 16'b0011011001000000;
    else if ( inp == 24 )
        outReg <= 16'b0011011010000010;
    else if ( inp == 25 )
        outReg <= 16'b0011011011000011;
    else if ( inp == 26 )
        outReg <= 16'b0011011100000100;
    else if ( inp == 27 )
        outReg <= 16'b0011011101000100;
    else if ( inp == 28 )
        outReg <= 16'b0011011110000011;
    else if ( inp == 29 )
        outReg <= 16'b0011011111000010;
    else if ( inp == 30 )
        outReg <= 16'b0011100000000000;
    else if ( inp == 31 )
        outReg <= 16'b0011100000011111;
    else if ( inp == 32 )
        outReg <= 16'b0011100000111101;
    else if ( inp == 33 )
        outReg <= 16'b0011100001011011;
    else if ( inp == 34 )
        outReg <= 16'b0011100001111001;
    else if ( inp == 35 )
        outReg <= 16'b0011100010010111;
    else if ( inp == 36 )
        outReg <= 16'b0011100010110100;
    else if ( inp == 37 )
        outReg <= 16'b0011100011010001;
    else if ( inp == 38 )
        outReg <= 16'b0011100011101101;
    else if ( inp == 39 )
        outReg <= 16'b0011100100001001;
    else if ( inp == 40 )
        outReg <= 16'b0011100100100100;
    else if ( inp == 41 )
        outReg <= 16'b0011100101000000;
    else if ( inp == 42 )
        outReg <= 16'b0011100101011010;
    else if ( inp == 43 )
        outReg <= 16'b0011100101110101;
    else if ( inp == 44 )
        outReg <= 16'b0011100110001111;
    else if ( inp == 45 )
        outReg <= 16'b0011100110101000;
    else if ( inp == 46 )
        outReg <= 16'b0011100111000001;
    else if ( inp == 47 )
        outReg <= 16'b0011100111011010;
    else if ( inp == 48 )
        outReg <= 16'b0011100111110010;
    else if ( inp == 49 )
        outReg <= 16'b0011101000001010;
    else if ( inp == 50 )
        outReg <= 16'b0011101000100001;
    else if ( inp == 51 )
        outReg <= 16'b0011101000111000;
    else if ( inp == 52 )
        outReg <= 16'b0011101001001110;
    else if ( inp == 53 )
        outReg <= 16'b0011101001100100;
    else if ( inp == 54 )
        outReg <= 16'b0011101001111001;
    else if ( inp == 55 )
        outReg <= 16'b0011101010001110;
    else if ( inp == 56 )
        outReg <= 16'b0011101010100010;
    else if ( inp == 57 )
        outReg <= 16'b0011101010110110;
    else if ( inp == 58 )
        outReg <= 16'b0011101011001001;
    else if ( inp == 59 )
        outReg <= 16'b0011101011011011;
    else if ( inp == 60 )
        outReg <= 16'b0011101011101110;
    else if ( inp == 61 )
        outReg <= 16'b0011101011111111;
    else if ( inp == 62 )
        outReg <= 16'b0011101100010000;
    else if ( inp == 63 )
        outReg <= 16'b0011101100100001;
    else if ( inp == 64 )
        outReg <= 16'b0011101100110001;
    else if ( inp == 65 )
        outReg <= 16'b0011101101000000;
    else if ( inp == 66 )
        outReg <= 16'b0011101101001111;
    else if ( inp == 67 )
        outReg <= 16'b0011101101011101;
    else if ( inp == 68 )
        outReg <= 16'b0011101101101011;
    else if ( inp == 69 )
        outReg <= 16'b0011101101111000;
    else if ( inp == 70 )
        outReg <= 16'b0011101110000100;
    else if ( inp == 71 )
        outReg <= 16'b0011101110010000;
    else if ( inp == 72 )
        outReg <= 16'b0011101110011100;
    else if ( inp == 73 )
        outReg <= 16'b0011101110100111;
    else if ( inp == 74 )
        outReg <= 16'b0011101110110001;
    else if ( inp == 75 )
        outReg <= 16'b0011101110111010;
    else if ( inp == 76 )
        outReg <= 16'b0011101111000011;
    else if ( inp == 77 )
        outReg <= 16'b0011101111001100;
    else if ( inp == 78 )
        outReg <= 16'b0011101111010011;
    else if ( inp == 79 )
        outReg <= 16'b0011101111011010;
    else if ( inp == 80 )
        outReg <= 16'b0011101111100001;
    else if ( inp == 81 )
        outReg <= 16'b0011101111100111;
    else if ( inp == 82 )
        outReg <= 16'b0011101111101100;
    else if ( inp == 83 )
        outReg <= 16'b0011101111110001;
    else if ( inp == 84 )
        outReg <= 16'b0011101111110101;
    else if ( inp == 85 )
        outReg <= 16'b0011101111111000;
    else if ( inp == 86 )
        outReg <= 16'b0011101111111011;
    else if ( inp == 87 )
        outReg <= 16'b0011101111111101;
    else if ( inp == 88 )
        outReg <= 16'b0011101111111111;
    else if ( inp == 89 )
        outReg <= 16'b0011110000000000;
    else if ( inp == 90 )
        outReg <= 16'b0011110000000000;
    end
endmodule
