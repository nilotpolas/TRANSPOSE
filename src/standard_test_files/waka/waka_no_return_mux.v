`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO = "hls_macc,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xa7a12tcsg325-1q,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.207000,HLS_SYN_LAT=3,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=132,HLS_SYN_LUT=617,HLS_VERSION=2018_3}" *)


module hls_macc
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  in1,
  in2,
  in3,
  in4,
  in7,
  in8,
  in9,
  in10,
  in14,
  in12,
  in15,
  in17,
  in19,
  in20,
  in22,
  in24,
  in27,
  in28,
  in29,
  in32,
  out13,
  out13_ap_vld,
  out30,
  out30_ap_vld,
  out31,
  out31_ap_vld
);

  wire [31:0] t2_t11_fu_203_p2;
  wire [31:0] t3_tmp1_fu_197_p2;
  wire [31:0] t1_t5_fu_209_p2;
  parameter ap_ST_fsm_state1 = 4'd1;
  parameter ap_ST_fsm_state2 = 4'd2;
  parameter ap_ST_fsm_state3 = 4'd4;
  parameter ap_ST_fsm_state4 = 4'd8;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] in1;
  input [31:0] in2;
  input [31:0] in3;
  input [31:0] in4;
  input [31:0] in7;
  input [31:0] in8;
  input [31:0] in9;
  input [31:0] in10;
  input [31:0] in14;
  input [31:0] in12;
  input [31:0] in15;
  input [31:0] in17;
  input [31:0] in19;
  input [31:0] in20;
  input [31:0] in22;
  input [31:0] in24;
  input [31:0] in27;
  input [31:0] in28;
  input [31:0] in29;
  input [31:0] in32;
  output [31:0] out13;
  output out13_ap_vld;
  output [31:0] out30;
  output out30_ap_vld;
  output [31:0] out31;
  output out31_ap_vld;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg out13_ap_vld;
  reg out30_ap_vld;
  reg out31_ap_vld;
  (* fsm_encoding = "none" *)
  reg [3:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] t11_fu_203_p2;
  reg [31:0] t11_reg_306;
  wire [31:0] t5_fu_209_p2;
  reg [31:0] t5_reg_312;
  wire ap_CS_fsm_state2;
  wire [31:0] t23_fu_221_p2;
  reg [31:0] t23_reg_317;
  wire [31:0] t26_2_fu_254_p3;
  reg [31:0] t26_2_reg_322;
  wire ap_CS_fsm_state3;
  wire ap_CS_fsm_state4;
  wire [31:0] tmp1_fu_197_p2;
  wire [31:0] tmp2_fu_215_p2;
  wire [31:0] t25_fu_232_p2;
  wire [31:0] tmp3_fu_243_p2;
  wire [0:0] tmp_2_fu_226_p2;
  wire [31:0] t26_fu_237_p2;
  wire [31:0] t26_1_fu_249_p2;
  wire [0:0] tmp_fu_269_p2;
  wire [31:0] t16_fu_275_p2;
  wire [31:0] t16_1_fu_280_p2;
  wire [31:0] t16_2_fu_291_p3;
  reg [3:0] ap_NS_fsm;

  initial begin
    #0 ap_CS_fsm = 4'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      t11_reg_306 <= (t23_reg_317[25:25])? ~t2_t11_fu_203_p2 : t11_fu_203_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      t23_reg_317 <= t23_fu_221_p2;
      t5_reg_312 <= (t23_reg_317[12:12])? ~t1_t5_fu_209_p2 : t5_fu_209_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      t26_2_reg_322 <= t26_2_fu_254_p3;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      ap_done = 1'b1;
    end else begin
      ap_done = 1'b0;
    end
  end


  always @(*) begin
    if((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
      ap_idle = 1'b1;
    end else begin
      ap_idle = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      out13_ap_vld = 1'b1;
    end else begin
      out13_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      out30_ap_vld = 1'b1;
    end else begin
      out30_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      out31_ap_vld = 1'b1;
    end else begin
      out31_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign out13 = in14 - in15;
  assign out30 = t26_2_reg_322 + in29;
  assign out31 = t16_2_fu_291_p3 + in32;
  assign t11_fu_203_p2 = tmp1_fu_197_p2 + in8;
  assign t16_1_fu_280_p2 = t26_2_reg_322 - in28;
  assign t16_2_fu_291_p3 = (tmp_fu_269_p2_temp === 1'b1)? t16_fu_275_p2 : t16_1_fu_280_p2;
  assign tmp_fu_269_p2_temp = tmp_fu_269_p2 & 1'b1;
  assign t16_fu_275_p2 = t11_reg_306 - in17;
  assign t23_fu_221_p2 = tmp2_fu_215_p2 + t11_reg_306;
  assign t25_fu_232_p2 = t23_reg_317 - in24;
  assign t26_1_fu_249_p2 = tmp3_fu_243_p2 + t5_reg_312;
  assign t26_2_fu_254_p3 = (tmp_2_fu_226_p2_temp === 1'b1)? t26_fu_237_p2 : t26_1_fu_249_p2;
  assign tmp_2_fu_226_p2_temp = tmp_2_fu_226_p2 & 1'b1;
  assign t26_fu_237_p2 = t25_fu_232_p2 + in27;
  assign t5_fu_209_p2 = in3 - in4;
  assign tmp1_fu_197_p2 = in7 + in12;
  assign tmp2_fu_215_p2 = t5_fu_209_p2 + in22;
  assign tmp3_fu_243_p2 = in19 + in20;
  assign tmp_2_fu_226_p2 = ($signed(in9) < $signed(in10))? 1'b1 : 1'b0;
  assign tmp_fu_269_p2 = (in2 == in1)? 1'b1 : 1'b0;
  assign t1_t5_fu_209_p2 = ~(~in4 - ~in3);
  assign t3_tmp1_fu_197_p2 = ~in7 + (~in12 + 1);
  assign t2_t11_fu_203_p2 = t3_tmp1_fu_197_p2 + (~(~(~in8 + 1) + 1) + 1);

endmodule


