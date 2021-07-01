`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2021 08:13:37 AM
// Design Name: 
// Module Name: simulare_sumator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simulare_sumator;
reg [15:0] A, B;
reg C_in;
wire [15:0] Suma;
wire C_out;

sumator_CAL_16biti sum(Suma, C_out, A, B, C_in);

initial begin
    A = 16'd10; B = 16'd2; C_in = 0;
    #20 A = 16'd5; B = 16'd12; C_in = 1;
    #20 $finish;
end
endmodule
