// this code is taken from geeksforgeeks

// C++ program to convert fractional decimal 
// to binary number 
#include<bits/stdc++.h> 
using namespace std; 
  
// Function to convert decimal to binary upto 
// k-precision after decimal point 
string decimalToBinary(double num, int k_prec) 
{ 
    string binary = ""; 
  
    // Fetch the integral part of decimal number 
    int Integral = num; 
  
    // Fetch the fractional part decimal number 
    double fractional = num - Integral; 
  
    // Conversion of integral part to 
    // binary equivalent 
    while (Integral) 
    { 
        int rem = Integral % 2; 
  
        // Append 0 in binary 
        binary.push_back(rem +'0'); 
  
        Integral /= 2; 
    } 
  
    // Reverse string to get original binary 
    // equivalent 
    reverse(binary.begin(),binary.end()); 
  
    // Append point before conversion of 
    // fractional part 
    binary.push_back('.'); 
  
    // Conversion of fractional part to 
    // binary equivalent 
    while (k_prec--) 
    { 
        // Find next bit in fraction 
        fractional *= 2; 
        int fract_bit = fractional; 
  
        if (fract_bit == 1) 
        { 
            fractional -= fract_bit; 
            binary.push_back(1 + '0'); 
        } 
        else
            binary.push_back(0 + '0'); 
    } 
  
    return binary; 
} 
  
// Driver code 
int main() 
{ 

    for(int i=0;i<=90;i++){
		double xDegrees = (double)i;
  		double x = xDegrees*3.14159/180;
		double a = sin(x);
		cout<<"else if ( inp == "<<i<<" )\n\t";
		
		cout << "outReg <= 16'b00000000" << decimalToBinary(a, 8).substr(1) << ";\n";
	}
    return 0; 
} 

