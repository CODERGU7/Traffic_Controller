//////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2021 Harshal Chowdhary
// ///////////////////////////////////////////////////////////////////////////////
// File Name:      Traffic_Light_Controller.v
// Type:           Module
// Department:     Electronics and Communication Engineering, B.Tech
// Author:         Harshal Chowdhary
// Authors' Email: harshalchowdhary15@gmail.com
// Create Date:    12:56:10 05/16/2021 
// Module Name:    test
//////////////////////////////////////////////////////////////////////////////////
// Release History
// 06/22/2021 Harshal Chowdhary TEST BENCH
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module test;
  wire [1:0] hwy, cntry;
reg x;
reg clock, clear;

module traffic_controller(hwy, cntry, x, clock, clear);
  
initial
begin
 clock = 1'b0;
 forever #5 clock = ~clock;
end
  
initial 
  begin
   clear= 1'b1;
   #50 clear = 1'b0;
end

initial
begin
 x  = 1'b0;
 #100 x= 1'b1;
 #100 x = 1'b0;
 #100 x= 1'b1;
end
endmodule 
