`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2021 04:25:15 AM
// Design Name: 
// Module Name: sumator_CAL_4biti
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


module sumator_CAL_4biti(sum, P, G, A, B, cin);
    input [3:0] A, B;
    input cin;
    output [3:0] sum;
    output G, P;

    // consider P propagarea transportului la nivel de bloc
    // si G generearea sa
    
    wire [3:0] p, g, c, suma_aux;
//    wire c1, c2, c3;

    assign p = A ^ B; //    propagarea transportului
    assign g = A & B; //    generarea transportului
 
    assign c[0] = cin;
    assign c[1] = g[0]|(p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | p[1] & p[0] & c[0];
    assign c[3] = g[2] | (p[2] & g[1]) | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & c[0];

    assign P = p[3] & p[2] & p[1] & p[0];
    assign G = g[3] | (p[3] & g[2]) | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0];

//    assign C = {cin, c1, c2, c3};
//    assign suma_aux[0] = p[0] ^ cin;
//    assign suma_aux[1] = p[1] ^ c[1];
//    assign suma_aux[2] = p[2] ^ c[2];
//    assign suma_aux[3] = p[3] ^ c[3];

//    assign sum = p ^ C;    
//    assign sum = {suma_aux[0], suma_aux[1], suma_aux[2], suma_aux[3]};  

    assign sum = p ^ c;
endmodule
