`timescale 1ns / 1ps

module fixed_multi(num1, num2, result, overflow);
  input [15:0] num1, num2; //num1 is multiplicand and num2 is multiplier
  output [15:0] result;
  output overflow;
  reg [22:0] mid [15:0]; //shifted values
  reg [23:0] midB[3:0]; //addition of shifted values
  wire [23:0] preResult; //24-bit results

  assign result = preResult[15:0]; //least significant 16-bit is results
  assign overflow = |preResult[23:16]; // most significant 8-bit is overflow
  assign preResult = midB[0] + midB[1] + midB[2] + midB[3];
  always@* //midB wires are added for readability
    begin
      midB[0] = mid[0] + mid[4] + mid[8] + mid[15];
      midB[1] = mid[1] + mid[5] + mid[9] + mid[14];
      midB[2] = mid[2] + mid[6] + mid[10] + mid[13];
      midB[3] = mid[3] + mid[7] + mid[11] + mid[12];
    end
  always@* //shift and enable control
    begin
      mid[0] = (num1 >> 8) & {16{num2[0]}};
      mid[1] = (num1 >> 7) & {16{num2[1]}};
      mid[2] = (num1 >> 6) & {16{num2[2]}};
      mid[3] = (num1 >> 5) & {16{num2[3]}};
      mid[4] = (num1 >> 4) & {16{num2[4]}};
      mid[5] = (num1 >> 3) & {16{num2[5]}};
      mid[6] = (num1 >> 2) & {16{num2[6]}};
      mid[7] = (num1 >> 1) & {16{num2[7]}};
      mid[8] =  num1 & {16{num2[8]}};
      mid[9] = (num1 << 1) & {16{num2[9]}};
      mid[10] = (num1 << 2) & {16{num2[10]}};
      mid[11] = (num1 << 3) & {16{num2[11]}};
      mid[12] = (num1 << 4) & {16{num2[12]}};
      mid[13] = (num1 << 5) & {16{num2[13]}};
      mid[14] = (num1 << 6) & {16{num2[14]}};
      mid[15] = (num1 << 7) & {16{num2[15]}};
    end

endmodule

module normalize(output wire[9:0] adj_mantissa,output wire norm_flag,input wire[21:0] prdt);
assign norm_flag = prdt[21] & 1'b1;
wire [1:0][9:0] results;
assign results[0] = prdt[19:10];
assign results[1] = prdt[20:11];
assign adj_mantissa = {results[norm_flag]};
endmodule

module float_multi(input [15:0] num1,input [15:0] num2,output [15:0]result,output overflow);
    wire sign1, sign2, signr;
    wire [4:0] ex1,ex2;
    wire [9:0] fra1, fra2;
    wire [10:0] m1,m2;// true value of fra1 i.e. 1.ffffffffff
    wire [5:0] exSum,exp; //exponent sum
    wire [21:0] m;  // stores the multiplication values of the m1 and m2
    wire norm_flag;
    
   assign {sign1, ex1, fra1} = num1;
   assign {sign2, ex2, fra2} = num2; 
   assign signr = (sign1 ^ sign2);
   assign exSum = (ex1 + ex2 -15);
   assign overflow = exSum[5];
   assign m1 = {1'b1,fra1};
   assign m2 = {1'b1,fra2};
   assign m = m1 * m2;
   wire [9:0] adj_mantissa;
   normalize norm1(adj_mantissa,norm_flag,m);
   assign exp = exSum[4:0] + norm_flag;
   assign result = {signr,exp[4:0],adj_mantissa};;
endmodule

