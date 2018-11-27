`timescale 1ns / 1ps

module topmodule(clk, rst, sw, leds,  btnL, btnR, btnU, btnD, seg, an0, an1, an2, an3);
  parameter IDLE = 2'b0, WAIT1 = 2'b1, WAIT2 = 2'b10, RESULT = 2'b11;
  parameter Floating_X = 2'b00;
  parameter Floating_Y = 2'b01;
  parameter Fixed_X = 2'b10;
  parameter Fixed_Y = 2'b11;
  input [15:0] sw;
  input btnL, btnR, btnU, btnD;
  wire FlXc, FlYc, FiXc, FiYc; //Fi: fixed, Fl: floating, X,Y
  input clk, rst;
  output [15:0] leds;
  wire a, b, c, d, e, f, g; //SSD cathodes
  output [6:0] seg;
  output an0, an1, an2, an3; //SSD anodes

  wire [6:0] abcdefg1, abcdefg2, abcdefg3, abcdefg0;
  wire [15:0] result_flX, result_flY, result_fiX, result_fiY,Dresult_fiX, Dresult_fiY;
  reg [15:0] result, num1, num2;
  wire [15:0] wsin, wcos, wfsin, wfcos;
  reg [1:0] state;
  reg overflow;
  reg [1:0] op; //MSB for num format LSB for operation
  wire FlX, FlY, FiX, FiY; //Fi: fixed, Fl: floating, A: add, M: multiply (debounced)
  wire commonBTN; //senstive to all buttons (except rst)
  wire of_FlX, of_FlY, of_FiX, of_FiY;//overflow signals for operations
  wire ssdEnable; //enables decoders
  wire [11:0] bcdOutX, bcdOutY;
  
  assign seg = {g,f,e,d,c,b,a};
  assign FlXc = btnL; //Left ~ Float X
  assign FlYc = btnR; //Right ~ Float Y
  assign FiXc = btnU; //Up ~ Fixed X
  assign FiYc = btnD; //Down ~ Fixed Y
  
  lookup2 lutfx(90 - num2, wfcos, clk);
  lookup2 lutfy(num2, wfsin, clk);
  fixed_multi fiX(.num1({num1[15:8],8'b00000000}), .num2(wfcos), .result(result_fiX), .overflow(of_FiX));
  fixed_multi fiY(.num1({num1[15:8],8'b00000000}), .num2(wfsin), .result(result_fiY), .overflow(of_FiY));
  lookup lutX(90 - num2, wcos, clk);
  lookup lutY(num2, wsin, clk);
  float_multi flX(.num1(num1), .num2(wcos), .result(result_flX), .overflow(of_FlX));
  float_multi flY(.num1(num1), .num2(wsin), .result(result_flY), .overflow(of_FlY));
  
  bin2bcd(result_fiX[15:7], bcdOutX);
  bin2bcd(result_fiY[15:7], bcdOutY);
  
  assign Dresult_fiX = {2'b0000, bcdOutX};
  assign Dresult_fiY = {2'b0000, bcdOutY};

  //seven segment display decoders
  ssdDecode ssd_0(result[3:0], abcdefg0, ssdEnable);
  ssdDecode ssd_1(result[7:4], abcdefg1, ssdEnable);
  ssdDecode ssd_2(result[11:8], abcdefg2, ssdEnable);
  ssdDecode ssd_3(result[15:12], abcdefg3, ssdEnable);

  //seven segment display controller
  ssd_cntr ssdController(clk, rst, abcdefg0[6],abcdefg1[6],abcdefg2[6],abcdefg3[6],
  abcdefg0[5],abcdefg1[5],abcdefg2[5],abcdefg3[5],
  abcdefg0[4], abcdefg1[4], abcdefg2[4], abcdefg3[4],
  abcdefg0[3], abcdefg1[3], abcdefg2[3], abcdefg3[3],
  abcdefg0[2], abcdefg1[2], abcdefg2[2], abcdefg3[2],
  abcdefg0[1], abcdefg1[1], abcdefg2[1], abcdefg3[1],
  abcdefg0[0], abcdefg1[0], abcdefg2[0], abcdefg3[0],
  a,b,c,d,e,f,g,an0,an1,an2,an3);

  //debouncers
  debouncer db0(clk, rst, FlXc, FlX);
  debouncer db1(clk, rst, FlYc, FlY);
  debouncer db2(clk, rst, FiXc, FiX);
  debouncer db3(clk, rst, FiYc, FiY);
  //Modules End

  assign ssdEnable = &state; //ssd's enabled when state is RESULT
  assign commonBTN = FlX | FlY | FiX | FiY;
  assign leds[1:0] = state; //least significant two bits of leds show state
  assign leds[14:2] = 0;
  assign leds[15] = overflow; //Most significant bit of leds show overflow

  //state transactions
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        state <= 0;
      else //change state untill RESULT state is reached
        state <= state + (commonBTN & (~(&state)));
    end
    

  //result and overflow routing
  always@*
    begin
      case (op)
        Floating_X:
          begin
            result <= result_flX;
            overflow <= of_FlX;
          end
        Floating_Y:
          begin
            result <= result_flY;
            overflow <= of_FlY;
          end
        Fixed_X:
            begin
                result <= Dresult_fiX;
                overflow <= of_FiX;
            end
        Fixed_Y:
            begin
                result <= Dresult_fiY;
                overflow <= of_FiY;
            end
      endcase
    end

  //logic for getting operation
  always@(posedge clk)
    begin
      if(state[1] & commonBTN)
        if(FlX)
            op <= 0;
        if(FlY)
            op <= 1;
        if(FiX)
            op <= 2;
        if(FiY)
            op <= 3;
    end

  //get numbers
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          num1 <= 16'b0;
          num2 <= 16'b0;
        end
      else
        case(state)
          WAIT1: num1 <= sw;
          WAIT2: num2 <= sw;
        endcase


    end

endmodule