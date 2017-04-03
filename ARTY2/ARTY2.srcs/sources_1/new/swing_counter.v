`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2017 08:17:24 PM
// Design Name: 
// Module Name: swing_counter
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


module swing_counter
    #(
    parameter 
    counterWidth=8
    )
    (
        input clk,
        input [counterWidth-1:0]bound,
        output reg [counterWidth-1:0]swingcounter
        );
     reg cud;//count up/down
    //assign led = (sw ^ btn)^counter[23-:4];
    
     wire [counterWidth-1:0]sc_p1=swingcounter+1;
     wire [counterWidth-1:0]sc_d1=swingcounter-1;
    
     always @(posedge clk) begin
        if(sc_d1==0)
            cud<=1;
        else if(sc_p1>=bound)
            cud<=0;
            
        if(cud) 
            swingcounter<=sc_p1;
        else 
            swingcounter<=sc_d1;
        
     end
     
endmodule
