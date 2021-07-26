//////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2021 Harshal Chowdhary
// ///////////////////////////////////////////////////////////////////////////////
// File Name:      Traffic_Light_Controller.v
// Type:           Module
// Department:     Electronics and Communication Engineering, B.Tech
// Author:         Harshal Chowdhary
// Authors' Email: harshalchowdhary15@gmail.com
// Create Date:    12:56:10 05/16/2021 
// Module Name:    traffic_controller 
//////////////////////////////////////////////////////////////////////////////////
// Release History
// 06/22/2021 Harshal Chowdhary Main_Algorithm
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module traffic_controller(hwy, cntry, x, clock, clear);

output reg [1:0] hwy, cntry;
input x,clr.clk;

parameter RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10;
parameter S0 = 3'b000. S1=3'b001, S2=3'b010, S3=3'b011, S4= 3'b100;

reg [2:0] state, next_state;

always @(posedge clk)
begin
  state <= clr? S0 : next_state;
end

always @(state,x)
begin
  case(next_state)
  S0: next_state <= x ? S1: S0;
  S1: #3 next_state <= S2;
  S2: #2 next_state <= S3;
  S3: next_state <= x ? S3: S4;
  S4: #3 next_state <= S0;
  default: next_state<=S0;
  endcase
end

always @(state)
begin
  case(next_state)
  S0: begin
        hwy = GREEN;
        cntry = RED;
      end
  S1: hwy = YELLOW;
  S2: hwy =RED ; 
  S3: cntry = GREEN;
  S4: cntry = YELLOW;
  endcase
end

endmodule
