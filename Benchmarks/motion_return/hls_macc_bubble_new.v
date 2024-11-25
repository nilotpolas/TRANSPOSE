`timescale 1 ns / 1 ps

(* CORE_GENERATION_INFO = "hls_macc,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xa7a12tcsg325-1q,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.470000,HLS_SYN_LAT=4,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=42,HLS_SYN_FF=677,HLS_SYN_LUT=792,HLS_VERSION=2018_3}" *)


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
  in5,
  in6,
  in7,
  in8,
  in9,
  in10,
  out1,
  out1_ap_vld,
  out2,
  out2_ap_vld,
  out3,
  out3_ap_vld,
  ap_return
);

  parameter ap_ST_fsm_state1 = 5'd1;
  parameter ap_ST_fsm_state2 = 5'd2;
  parameter ap_ST_fsm_state3 = 5'd4;
  parameter ap_ST_fsm_state4 = 5'd8;
  parameter ap_ST_fsm_state5 = 5'd16;
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
  input [31:0] in5;
  input [31:0] in6;
  input [31:0] in7;
  input [31:0] in8;
  input [31:0] in9;
  input [31:0] in10;
  output [31:0] out1;
  output out1_ap_vld;
  output [31:0] out2;
  output out2_ap_vld;
  output [31:0] out3;
  output out3_ap_vld;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg out1_ap_vld;
  reg out2_ap_vld;
  reg out3_ap_vld;
  (* fsm_encoding = "none" *)
  reg [4:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [31:0] mult10_fu_125_p2;
  reg [31:0] mult10_reg_295;
  wire [31:0] add3_fu_131_p2;
  reg [31:0] add3_reg_300;
  wire [31:0] add5_fu_137_p2;
  reg [31:0] add5_reg_305;
  wire ap_CS_fsm_state2;
  wire [31:0] mult2_fu_143_p2;
  reg [31:0] mult2_reg_337;
  wire signed [31:0] tmp1_fu_149_p2;
  reg signed [31:0] tmp1_reg_342;
  wire signed [31:0] tmp_fu_154_p2;
  reg signed [31:0] tmp_reg_347;
  wire signed [31:0] tmp4_fu_159_p2;
  reg signed [31:0] tmp4_reg_352;
  wire signed [31:0] add4_s_fu_164_p2;
  reg signed [31:0] add4_s_reg_357;
  wire signed [31:0] tmp6_fu_169_p2;
  reg signed [31:0] tmp6_reg_362;
  wire [31:0] mult7_fu_173_p2;
  reg [31:0] mult7_reg_367;
  wire ap_CS_fsm_state3;
  wire [31:0] mult11_fu_177_p2;
  reg [31:0] mult11_reg_372;
  wire [31:0] mult13_fu_181_p2;
  reg [31:0] mult13_reg_377;
  wire [31:0] add2_fu_185_p2;
  reg [31:0] add2_reg_382;
  wire signed [31:0] add1_s_fu_189_p2;
  reg signed [31:0] add1_s_reg_387;
  wire [31:0] tmp3_fu_193_p2;
  reg [31:0] tmp3_reg_392;
  wire [31:0] tmp5_fu_197_p2;
  reg [31:0] tmp5_reg_397;
  wire [31:0] add13_fu_201_p2;
  reg [31:0] add13_reg_402;
  wire [31:0] tmp7_fu_205_p2;
  reg [31:0] tmp7_reg_407;
  wire [31:0] add6_fu_209_p2;
  reg [31:0] add6_reg_412;
  wire ap_CS_fsm_state4;
  wire [31:0] tmp_1_fu_228_p2;
  reg [31:0] tmp_1_reg_418;
  wire [31:0] tmp_2_fu_256_p2;
  reg [31:0] tmp_2_reg_424;
  wire ap_CS_fsm_state5;
  wire signed [31:0] mult10_fu_125_p0;
  wire signed [31:0] mult10_fu_125_p1;
  wire signed [31:0] add3_fu_131_p0;
  wire signed [31:0] add3_fu_131_p1;
  wire signed [31:0] add5_fu_137_p0;
  wire signed [31:0] add5_fu_137_p1;
  wire signed [31:0] mult2_fu_143_p0;
  wire signed [31:0] mult2_fu_143_p1;
  wire signed [31:0] tmp1_fu_149_p0;
  wire signed [31:0] tmp1_fu_149_p1;
  wire signed [31:0] tmp4_fu_159_p0;
  wire signed [31:0] add4_s_fu_164_p0;
  wire signed [31:0] tmp6_fu_169_p0;
  wire signed [31:0] mult7_fu_173_p0;
  wire signed [31:0] mult7_fu_173_p1;
  wire signed [31:0] mult11_fu_177_p0;
  wire signed [31:0] mult11_fu_177_p1;
  wire signed [31:0] mult13_fu_181_p0;
  wire signed [31:0] mult13_fu_181_p1;
  wire signed [31:0] add2_fu_185_p0;
  wire signed [31:0] tmp3_fu_193_p0;
  wire signed [31:0] tmp5_fu_197_p0;
  wire signed [31:0] add13_fu_201_p0;
  wire signed [31:0] tmp7_fu_205_p0;
  wire signed [31:0] add6_fu_209_p0;
  wire [31:0] add9_fu_213_p2;
  wire [31:0] shf1_fu_217_p2;
  wire [31:0] tmp2_fu_223_p2;
  wire [31:0] add14_fu_233_p2;
  wire [28:0] tmp_6_fu_237_p4;
  wire signed [31:0] shf2_fu_247_p1;
  wire [31:0] tmp8_fu_251_p2;
  wire [31:0] tmp9_fu_261_p2;
  reg [4:0] ap_NS_fsm;

  initial begin
    #0 ap_CS_fsm = 5'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ~ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      add13_reg_402 <= add13_fu_201_p2;
      add1_s_reg_387 <= add1_s_fu_189_p2;
      add2_reg_382 <= add2_fu_185_p2;
      mult11_reg_372 <= mult11_fu_177_p2;
      mult13_reg_377 <= mult13_fu_181_p2;
      mult7_reg_367 <= mult7_fu_173_p2;
      tmp3_reg_392 <= tmp3_fu_193_p2;
      tmp5_reg_397 <= tmp5_fu_197_p2;
      tmp7_reg_407 <= tmp7_fu_205_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      add3_reg_300 <= add3_fu_131_p2;
      add5_reg_305 <= add5_fu_137_p2;
      mult10_reg_295 <= mult10_fu_125_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      add4_s_reg_357 <= add4_s_fu_164_p2;
      mult2_reg_337 <= ~mult2_fu_143_p2;
      tmp1_reg_342 <= tmp1_fu_149_p2;
      tmp4_reg_352 <= tmp4_fu_159_p2;
      tmp6_reg_362 <= tmp6_fu_169_p2;
      tmp_reg_347 <= tmp_fu_154_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      add6_reg_412 <= add6_fu_209_p2;
      tmp_1_reg_418 <= tmp_1_fu_228_p2;
      tmp_2_reg_424 <= tmp_2_fu_256_p2;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
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
    if(1'b1 == ap_CS_fsm_state5) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      out1_ap_vld = 1'b1;
    end else begin
      out1_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      out2_ap_vld = 1'b1;
    end else begin
      out2_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      out3_ap_vld = 1'b1;
    end else begin
      out3_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ~ap_ST_fsm_state1;
        end
      end
      ~ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ~ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ~ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ~ap_ST_fsm_state5: begin
        ap_NS_fsm = ~ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = ~'bx;
      end
    endcase
  end

  assign add13_fu_201_p0 = in4;
  assign add13_fu_201_p2 = $signed(add13_fu_201_p0) * $signed(add4_s_reg_357);
  assign add14_fu_233_p2 = tmp7_reg_407 + mult13_reg_377;
  assign add1_s_fu_189_p2 = ~in2 + (mult2_reg_337 + 1);
  assign add2_fu_185_p0 = in4;
  assign add2_fu_185_p2 = $signed(add2_fu_185_p0) * $signed(tmp1_reg_342);
  assign add3_fu_131_p0 = in7;
  assign add3_fu_131_p1 = in4;
  assign add3_fu_131_p2 = $signed(add3_fu_131_p0) * $signed(add3_fu_131_p1);
  assign add4_s_fu_164_p0 = in8;
  assign add4_s_fu_164_p2 = $signed(add4_s_fu_164_p0) + $signed(mult10_reg_295);
  assign add5_fu_137_p0 = in10;
  assign add5_fu_137_p1 = in10;
  assign add5_fu_137_p2 = $signed(add5_fu_137_p0) * $signed(add5_fu_137_p1);
  assign add6_fu_209_p0 = in1;
  assign add6_fu_209_p2 = (~$signed(add6_fu_209_p0) + (~$signed((~add1_s_reg_387)) + 1) << 31 + 1) - $signed((~add6_fu_209_p0)) * ~$signed((~add1_s_reg_387)) + ($signed(add6_fu_209_p0) + $signed((~add1_s_reg_387)));
  assign add9_fu_213_p2 = tmp3_reg_392 + mult7_reg_367;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_return = ~tmp_2_reg_424 + tmp9_fu_261_p2;
  assign mult10_fu_125_p0 = in9;
  assign mult10_fu_125_p1 = in6;
  assign mult10_fu_125_p2 = $signed(mult10_fu_125_p0) * $signed(mult10_fu_125_p1);
  assign mult11_fu_177_p0 = in8;
  assign mult11_fu_177_p1 = in6;
  assign mult11_fu_177_p2 = ~($signed(mult11_fu_177_p0) * $signed(mult11_fu_177_p1));
  assign mult13_fu_181_p0 = in8;
  assign mult13_fu_181_p1 = in7;
  assign mult13_fu_181_p2 = $signed(mult13_fu_181_p0) * $signed(mult13_fu_181_p1);
  assign mult2_fu_143_p0 = in3;
  assign mult2_fu_143_p1 = in1;
  assign mult2_fu_143_p2 = $signed(mult2_fu_143_p0) * $signed(mult2_fu_143_p1);
  assign mult7_fu_173_p0 = in6;
  assign mult7_fu_173_p1 = in3;
  assign mult7_fu_173_p2 = $signed(mult7_fu_173_p0) * $signed(mult7_fu_173_p1);
  assign out1 = ~add6_reg_412;
  assign out2 = tmp_1_reg_418;
  assign out3 = ~tmp_2_reg_424;
  assign shf1_fu_217_p2 = add9_fu_213_p2 << 32'd3;
  assign shf2_fu_247_p1 = $signed(tmp_6_fu_237_p4);
  assign tmp1_fu_149_p0 = in5;
  assign tmp1_fu_149_p1 = in4;
  assign tmp1_fu_149_p2 = $signed(tmp1_fu_149_p0) * $signed(tmp1_fu_149_p1);
  assign tmp2_fu_223_p2 = shf1_fu_217_p2 + tmp5_reg_397;
  assign tmp3_fu_193_p0 = in5;
  assign tmp3_fu_193_p2 = $signed(tmp3_fu_193_p0) * $signed(tmp_reg_347);
  assign tmp4_fu_159_p0 = in7;
  assign tmp4_fu_159_p2 = $signed((~tmp4_fu_159_p0)) + (~$signed(in2) + 1);
  assign tmp5_fu_197_p0 = in3;
  assign tmp5_fu_197_p2 = $signed(tmp5_fu_197_p0) * $signed((~tmp4_reg_352));
  assign tmp6_fu_169_p0 = in7;
  assign tmp6_fu_169_p2 = $signed(tmp6_fu_169_p0) + $signed(add5_reg_305);
  assign tmp7_fu_205_p0 = in9;
  assign tmp7_fu_205_p2 = $signed(tmp7_fu_205_p0) * $signed(tmp6_reg_362);
  assign tmp8_fu_251_p2 = $signed(shf2_fu_247_p1) + $signed(add13_reg_402);
  assign tmp9_fu_261_p2 = tmp_1_reg_418 + ~add6_reg_412;
  assign tmp_1_fu_228_p2 = add2_reg_382 + tmp2_fu_223_p2;
  assign tmp_2_fu_256_p2 = mult11_reg_372 + (~tmp8_fu_251_p2 + 1);
  assign tmp_6_fu_237_p4 = add14_fu_233_p2_temp11 >> 1'd3;
  assign add14_fu_233_p2_temp11 = add14_fu_233_p2 & 1'd4294967288;
  assign tmp_fu_154_p2 = in2 + add3_reg_300;

endmodule


