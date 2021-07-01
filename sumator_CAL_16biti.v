`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2021 07:56:28 AM
// Design Name: 
// Module Name: sumator_CAL_16biti
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


module sumator_CAL_16biti(Suma, C_out, A, B, C_in);
    input [15:0] A, B;
    input C_in;
    output C_out;
    output [15:0] Suma;
    
    wire [3:0] P0, P1, P2, P3, G0, G1, G2, G3;
    wire C1, C2, C3;
    
    sumator_CAL_4biti s1 (Suma[3:0], P0, G0, A[3:0], B[3:0], C_in);
    assign C1 = G0 | (P0 & C_in);
    
    sumator_CAL_4biti s2 (Suma[7:4], P1, G1, A[7:4], B[7:4], C1);
    assign C2 = G1 | (P1 & G0) | (P1 & P0 & C_in);
    
    sumator_CAL_4biti s3 (Suma[11:8], P2, G2, A[11:8], B[11:8], C2);
    assign C3  = G2 | (P2 & G1) | (P2 & P1 & G0) | (P2 & P1 & P0 & C_in);
    
    sumator_CAL_4biti s4 (Suma[15:12], P3, G3, A[15:12], B[15:12], C3);
    assign C_out = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0) | (P3 & P2 & P1 & P0 & C_in);
endmodule
