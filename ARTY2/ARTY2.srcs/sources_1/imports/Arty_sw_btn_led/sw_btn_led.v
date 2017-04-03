`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2015 02:52:16 PM
// Design Name: 
// Module Name: sw_led
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


module sw_btn_led(
    input clk_100M,
    input [3:0]sw,
    input [3:0]btn,
    output [3:0]led
    );
    
    reg [23:0]counter;
        
    //assign led = (sw ^ btn)^counter[23-:4];
    always @(posedge clk_100M) begin
        counter=counter+1;
    end
    
    reg clk_10;
    always @(posedge clk_100M) begin
        clk_10=counter[19];
        //10MHz/(10^20)=95.3Hz
    end
    
    
    wire [7:0]swing_c0;
    wire [7:0]swing_c1;
    wire [7:0]swing_c2;
    wire [7:0]swing_c3;
    swing_counter sc0(clk_10,255,swing_c0);
    swing_counter sc1(clk_10,150,swing_c1);
    swing_counter sc2(clk_10,100,swing_c2);
    swing_counter sc3(clk_10,50,swing_c3);
    
    reg [7:0]PWMCounter;
    
    //assign led = (sw ^ btn)^counter[23-:4];
    always @(posedge clk_100M) begin
        PWMCounter=counter[4+:8];
    end
        
    
    PWM_module pwm0 (PWMCounter,swing_c0,led[0]);
    PWM_module pwm1 (PWMCounter,swing_c1,led[1]);
    PWM_module pwm2 (PWMCounter,swing_c2,led[2]);
    PWM_module pwm3 (PWMCounter,swing_c3,led[3]);
    
    
endmodule
