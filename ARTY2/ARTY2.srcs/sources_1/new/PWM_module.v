`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2017 07:52:20 PM
// Design Name: 
// Module Name: PWM_module
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


module PWM_module(
    input [7:0] PWMCounter,
    input [7:0] duty,
    output pin
    );
    assign pin = (PWMCounter < duty);
    
endmodule
