`timescale 1 ns / 1 ps


module aes_main_KeySchedule
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  key_address0,
  key_ce0,
  key_q0
);

  parameter ap_ST_fsm_state1 = 14'd1;
  parameter ap_ST_fsm_state2 = 14'd2;
  parameter ap_ST_fsm_state3 = 14'd4;
  parameter ap_ST_fsm_state4 = 14'd8;
  parameter ap_ST_fsm_state5 = 14'd16;
  parameter ap_ST_fsm_state6 = 14'd32;
  parameter ap_ST_fsm_state7 = 14'd64;
  parameter ap_ST_fsm_state8 = 14'd128;
  parameter ap_ST_fsm_state9 = 14'd256;
  parameter ap_ST_fsm_state10 = 14'd512;
  parameter ap_ST_fsm_state11 = 14'd1024;
  parameter ap_ST_fsm_state12 = 14'd2048;
  parameter ap_ST_fsm_state13 = 14'd4096;
  parameter ap_ST_fsm_state14 = 14'd8192;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [4:0] key_address0;
  output key_ce0;
  input [7:0] key_q0;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg key_ce0;
  (* fsm_encoding = "none" *)
  reg [13:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg [8:0] word_address0;
  reg word_ce0;
  reg word_we0;
  reg [31:0] word_d0;
  wire [31:0] word_q0;
  reg [8:0] word_address1;
  reg word_ce1;
  wire [31:0] word_q1;
  wire [7:0] Sbox_address0;
  reg Sbox_ce0;
  wire [7:0] Sbox_q0;
  wire [7:0] Sbox_address1;
  reg Sbox_ce1;
  wire [7:0] Sbox_q1;
  wire [7:0] Sbox_address2;
  reg Sbox_ce2;
  wire [7:0] Sbox_q2;
  wire [7:0] Sbox_address3;
  reg Sbox_ce3;
  wire [7:0] Sbox_q3;
  wire [4:0] Rcon0_address0;
  reg Rcon0_ce0;
  wire [7:0] Rcon0_q0;
  wire [2:0] add_ln73_fu_325_p2;
  reg [2:0] add_ln73_reg_1134;
  wire ap_CS_fsm_state2;
  wire [3:0] tmp_s_fu_335_p3;
  reg [3:0] tmp_s_reg_1139;
  wire [0:0] icmp_ln73_fu_319_p2;
  reg [8:0] word_addr_4_reg_1151;
  wire ap_CS_fsm_state3;
  wire [2:0] add_ln76_fu_410_p2;
  reg [2:0] add_ln76_reg_1159;
  wire [0:0] icmp_ln76_fu_404_p2;
  wire [8:0] zext_ln83_fu_438_p1;
  reg [8:0] zext_ln83_reg_1172;
  wire ap_CS_fsm_state5;
  wire [5:0] add_ln96_fu_448_p2;
  reg [5:0] add_ln96_reg_1180;
  wire [0:0] icmp_ln83_fu_442_p2;
  wire [8:0] zext_ln97_1_fu_454_p1;
  reg [8:0] zext_ln97_1_reg_1187;
  wire ap_CS_fsm_state6;
  wire ap_CS_fsm_state7;
  reg [31:0] temp_1_1_reg_1212;
  wire [3:0] trunc_ln97_fu_496_p1;
  reg [3:0] trunc_ln97_reg_1219;
  wire [7:0] trunc_ln97_1_fu_500_p1;
  reg [7:0] trunc_ln97_1_reg_1225;
  reg [31:0] temp_2_1_reg_1230;
  wire [3:0] trunc_ln98_fu_504_p1;
  reg [3:0] trunc_ln98_reg_1237;
  wire [7:0] trunc_ln98_1_fu_508_p1;
  reg [7:0] trunc_ln98_1_reg_1243;
  wire [0:0] icmp_ln87_fu_515_p2;
  reg [0:0] icmp_ln87_reg_1248;
  wire ap_CS_fsm_state8;
  reg [31:0] word_load_3_reg_1252;
  wire [3:0] trunc_ln96_fu_521_p1;
  reg [3:0] trunc_ln96_reg_1259;
  reg [31:0] temp_0_reg_1264;
  wire [3:0] trunc_ln96_2_fu_529_p1;
  reg [3:0] trunc_ln96_2_reg_1271;
  wire [7:0] add_ln251_fu_636_p2;
  reg [7:0] add_ln251_reg_1276;
  wire [7:0] add_ln251_1_fu_741_p2;
  reg [7:0] add_ln251_1_reg_1281;
  reg [3:0] trunc_ln251_8_reg_1286;
  wire [3:0] sub_ln251_12_fu_763_p2;
  reg [3:0] sub_ln251_12_reg_1291;
  reg [3:0] trunc_ln251_s_reg_1296;
  wire [3:0] sub_ln251_14_fu_785_p2;
  reg [3:0] sub_ln251_14_reg_1301;
  wire ap_CS_fsm_state9;
  wire [8:0] zext_ln110_fu_1026_p1;
  reg [8:0] zext_ln110_reg_1331;
  wire ap_CS_fsm_state10;
  reg [8:0] word_addr_5_reg_1336;
  wire ap_CS_fsm_state11;
  reg [8:0] word_addr_6_reg_1341;
  wire [2:0] add_ln110_fu_1086_p2;
  reg [2:0] add_ln110_reg_1349;
  wire [31:0] tmp_fu_1092_p6;
  reg [31:0] tmp_reg_1354;
  wire [0:0] icmp_ln110_fu_1080_p2;
  wire [31:0] xor_ln112_fu_1116_p2;
  reg [31:0] xor_ln112_reg_1359;
  wire ap_CS_fsm_state13;
  reg [2:0] i_reg_249;
  wire ap_CS_fsm_state4;
  wire [31:0] zext_ln91_fu_1011_p1;
  reg [31:0] temp_2_0_reg_260;
  wire [31:0] zext_ln90_fu_1006_p1;
  reg [31:0] temp_1_0_reg_270;
  wire [31:0] zext_ln89_1_fu_1001_p1;
  reg [31:0] temp_0_0_reg_280;
  wire [31:0] zext_ln94_fu_1016_p1;
  reg [31:0] temp_3_reg_290;
  reg [2:0] i_4_reg_300;
  wire ap_CS_fsm_state14;
  wire [63:0] zext_ln78_4_fu_395_p1;
  wire [63:0] zext_ln78_fu_421_p1;
  wire [63:0] zext_ln97_3_fu_466_p1;
  wire [63:0] zext_ln98_fu_477_p1;
  wire [63:0] zext_ln99_fu_491_p1;
  wire [63:0] zext_ln97_fu_482_p1;
  wire [63:0] zext_ln251_2_fu_791_p1;
  wire [63:0] zext_ln89_fu_810_p1;
  wire [63:0] zext_ln251_5_fu_815_p1;
  wire [63:0] zext_ln251_8_fu_902_p1;
  wire [63:0] zext_ln251_11_fu_990_p1;
  wire [63:0] zext_ln112_1_fu_1065_p1;
  wire [63:0] zext_ln112_2_fu_1075_p1;
  reg [2:0] j_fu_104;
  reg [5:0] j_2_fu_108;
  wire [5:0] add_ln83_fu_1106_p2;
  wire [31:0] zext_ln78_1_fu_430_p1;
  wire ap_CS_fsm_state12;
  wire [1:0] empty_60_fu_331_p1;
  wire [9:0] tmp_4_fu_348_p3;
  wire [5:0] tmp_5_fu_360_p3;
  wire [10:0] zext_ln78_2_fu_356_p1;
  wire [10:0] zext_ln78_3_fu_368_p1;
  wire [10:0] sub_ln78_fu_372_p2;
  wire [5:0] tmp_19_cast_fu_378_p4;
  wire [8:0] tmp_6_fu_388_p3;
  wire [3:0] zext_ln76_fu_400_p1;
  wire [3:0] add_ln78_fu_416_p2;
  wire [7:0] zext_ln97_2_fu_457_p1;
  wire [7:0] add_ln97_fu_460_p2;
  wire [8:0] add_ln98_fu_471_p2;
  wire [8:0] add_ln99_fu_486_p2;
  wire [1:0] empty_63_fu_512_p1;
  wire [7:0] sub_ln251_fu_544_p2;
  wire [3:0] trunc_ln251_4_fu_549_p4;
  wire [0:0] tmp_1_fu_537_p3;
  wire [3:0] sub_ln251_1_fu_559_p2;
  wire [3:0] tmp_7_fu_565_p4;
  wire [3:0] select_ln251_fu_574_p3;
  wire [4:0] p_and_f1_fu_590_p3;
  wire [3:0] sub_ln251_8_fu_601_p2;
  wire [4:0] p_and_t1_fu_606_p3;
  wire [5:0] zext_ln251_1_fu_614_p1;
  wire [5:0] sub_ln251_9_fu_618_p2;
  wire [5:0] zext_ln251_fu_597_p1;
  wire [5:0] select_ln251_1_fu_624_p3;
  wire [7:0] tmp_8_fu_582_p3;
  wire signed [7:0] sext_ln251_fu_632_p1;
  wire [7:0] sub_ln251_2_fu_649_p2;
  wire [3:0] trunc_ln251_6_fu_654_p4;
  wire [0:0] tmp_2_fu_642_p3;
  wire [3:0] sub_ln251_3_fu_664_p2;
  wire [3:0] tmp_9_fu_670_p4;
  wire [3:0] select_ln251_2_fu_679_p3;
  wire [4:0] p_and_f2_fu_695_p3;
  wire [3:0] sub_ln251_10_fu_706_p2;
  wire [4:0] p_and_t2_fu_711_p3;
  wire [5:0] zext_ln251_4_fu_719_p1;
  wire [5:0] sub_ln251_11_fu_723_p2;
  wire [5:0] zext_ln251_3_fu_702_p1;
  wire [5:0] select_ln251_3_fu_729_p3;
  wire [7:0] tmp_10_fu_687_p3;
  wire signed [7:0] sext_ln251_1_fu_737_p1;
  wire [7:0] trunc_ln96_1_fu_525_p1;
  wire [7:0] sub_ln251_4_fu_747_p2;
  wire [7:0] trunc_ln96_3_fu_533_p1;
  wire [7:0] sub_ln251_6_fu_769_p2;
  wire [3:0] trunc_ln4_fu_795_p4;
  wire [3:0] add_ln89_fu_804_p2;
  wire [0:0] tmp_3_fu_819_p3;
  wire [3:0] sub_ln251_5_fu_826_p2;
  wire [3:0] tmp_11_fu_831_p4;
  wire [3:0] select_ln251_4_fu_840_p3;
  wire [4:0] p_and_f4_fu_856_p3;
  wire [4:0] p_and_t6_fu_867_p3;
  wire [5:0] zext_ln251_7_fu_874_p1;
  wire [5:0] sub_ln251_13_fu_878_p2;
  wire [5:0] zext_ln251_6_fu_863_p1;
  wire [5:0] select_ln251_5_fu_884_p3;
  wire [7:0] tmp_12_fu_848_p3;
  wire signed [7:0] sext_ln251_2_fu_892_p1;
  wire [7:0] add_ln251_2_fu_896_p2;
  wire [0:0] tmp_13_fu_907_p3;
  wire [3:0] sub_ln251_7_fu_914_p2;
  wire [3:0] tmp_14_fu_919_p4;
  wire [3:0] select_ln251_6_fu_928_p3;
  wire [4:0] p_and_f_fu_944_p3;
  wire [4:0] p_and_t_fu_955_p3;
  wire [5:0] zext_ln251_10_fu_962_p1;
  wire [5:0] sub_ln251_15_fu_966_p2;
  wire [5:0] zext_ln251_9_fu_951_p1;
  wire [5:0] select_ln251_7_fu_972_p3;
  wire [7:0] tmp_15_fu_936_p3;
  wire signed [7:0] sext_ln251_3_fu_980_p1;
  wire [7:0] add_ln251_3_fu_984_p2;
  wire [7:0] temp_0_1_fu_995_p2;
  wire [5:0] empty_64_fu_1021_p2;
  wire [1:0] trunc_ln112_fu_1030_p1;
  wire [5:0] tmp_17_fu_1042_p3;
  wire [8:0] tmp_16_fu_1034_p3;
  wire [8:0] zext_ln112_fu_1050_p1;
  wire [8:0] sub_ln112_fu_1054_p2;
  wire [8:0] add_ln112_fu_1060_p2;
  wire [8:0] add_ln112_1_fu_1070_p2;
  reg [13:0] ap_NS_fsm;
  reg ap_ST_fsm_state1_blk;
  wire ap_ST_fsm_state2_blk;
  wire ap_ST_fsm_state3_blk;
  wire ap_ST_fsm_state4_blk;
  wire ap_ST_fsm_state5_blk;
  wire ap_ST_fsm_state6_blk;
  wire ap_ST_fsm_state7_blk;
  wire ap_ST_fsm_state8_blk;
  wire ap_ST_fsm_state9_blk;
  wire ap_ST_fsm_state10_blk;
  wire ap_ST_fsm_state11_blk;
  wire ap_ST_fsm_state12_blk;
  wire ap_ST_fsm_state13_blk;
  wire ap_ST_fsm_state14_blk;
  wire ap_ce_reg;

  initial begin
    #0 ap_CS_fsm = 14'd1;
  end


  aes_main_KeySchedule_word_RAM_AUTO_1R1W
  #(
    .DataWidth(32),
    .AddressRange(480),
    .AddressWidth(9)
  )
  word_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(~word_address0),
    .ce0(word_ce0),
    .we0(word_we0),
    .d0(~word_d0),
    .q0(word_q0),
    .address1(~word_address1),
    .ce1(word_ce1),
    .q1(word_q1)
  );


  aes_main_KeySchedule_Sbox_ROM_AUTO_1R
  #(
    .DataWidth(8),
    .AddressRange(256),
    .AddressWidth(8)
  )
  Sbox_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(Sbox_address0),
    .ce0(Sbox_ce0),
    .q0(Sbox_q0),
    .address1(Sbox_address1),
    .ce1(Sbox_ce1),
    .q1(Sbox_q1),
    .address2(Sbox_address2),
    .ce2(Sbox_ce2),
    .q2(Sbox_q2),
    .address3(Sbox_address3),
    .ce3(Sbox_ce3),
    .q3(Sbox_q3)
  );


  aes_main_KeySchedule_Rcon0_ROM_AUTO_1R
  #(
    .DataWidth(8),
    .AddressRange(30),
    .AddressWidth(5)
  )
  Rcon0_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(Rcon0_address0),
    .ce0(Rcon0_ce0),
    .q0(Rcon0_q0)
  );


  aes_main_mux_42_32_1_1
  #(
    .ID(1),
    .NUM_STAGE(1),
    .din0_WIDTH(32),
    .din1_WIDTH(32),
    .din2_WIDTH(32),
    .din3_WIDTH(32),
    .din4_WIDTH(2),
    .dout_WIDTH(32)
  )
  mux_42_32_1_1_U1
  (
    .din0(temp_0_0_reg_280),
    .din1(temp_1_0_reg_270),
    .din2(temp_2_0_reg_260),
    .din3(temp_3_reg_290),
    .din4(trunc_ln112_fu_1030_p1),
    .dout(tmp_fu_1092_p6)
  );


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      i_4_reg_300 <= 3'd0;
    end else if(1'b1 == ap_CS_fsm_state14) begin
      i_4_reg_300 <= add_ln110_reg_1349;
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln73_fu_319_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      i_reg_249 <= 3'd0;
    end else if(1'b1 == ap_CS_fsm_state4) begin
      i_reg_249 <= add_ln76_reg_1159;
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln73_fu_319_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
      j_2_fu_108 <= 6'd4;
    end else if((icmp_ln110_fu_1080_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) begin
      j_2_fu_108 <= add_ln83_fu_1106_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      j_fu_104 <= 3'd0;
    end else if((1'b1 == ap_CS_fsm_state3) & (icmp_ln76_fu_404_p2 == 1'd1)) begin
      j_fu_104 <= add_ln73_reg_1134;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state8) & (icmp_ln87_fu_515_p2 == 1'd0)) begin
      temp_0_0_reg_280 <= word_q1;
    end else if((1'b1 == ap_CS_fsm_state10) & (icmp_ln87_reg_1248 == 1'd1)) begin
      temp_0_0_reg_280 <= zext_ln89_1_fu_1001_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state8) & (icmp_ln87_fu_515_p2 == 1'd0)) begin
      temp_1_0_reg_270 <= temp_1_1_reg_1212;
    end else if((1'b1 == ap_CS_fsm_state10) & (icmp_ln87_reg_1248 == 1'd1)) begin
      temp_1_0_reg_270 <= zext_ln90_fu_1006_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state8) & (icmp_ln87_fu_515_p2 == 1'd0)) begin
      temp_2_0_reg_260 <= temp_2_1_reg_1230;
    end else if((1'b1 == ap_CS_fsm_state10) & (icmp_ln87_reg_1248 == 1'd1)) begin
      temp_2_0_reg_260 <= zext_ln91_fu_1011_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state8) & (icmp_ln87_fu_515_p2 == 1'd0)) begin
      temp_3_reg_290 <= word_q0;
    end else if((1'b1 == ap_CS_fsm_state10) & (icmp_ln87_reg_1248 == 1'd1)) begin
      temp_3_reg_290 <= zext_ln94_fu_1016_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state11) begin
      add_ln110_reg_1349 <= add_ln110_fu_1086_p2;
      word_addr_5_reg_1336 <= zext_ln112_1_fu_1065_p1;
      word_addr_6_reg_1341 <= zext_ln112_2_fu_1075_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state8) & (icmp_ln87_fu_515_p2 == 1'd1)) begin
      add_ln251_1_reg_1281 <= add_ln251_1_fu_741_p2;
      add_ln251_reg_1276 <= add_ln251_fu_636_p2;
      sub_ln251_12_reg_1291 <= sub_ln251_12_fu_763_p2;
      sub_ln251_14_reg_1301 <= sub_ln251_14_fu_785_p2;
      trunc_ln251_8_reg_1286 <= { { sub_ln251_4_fu_747_p2[7:4] } };
      trunc_ln251_s_reg_1296 <= { { sub_ln251_6_fu_769_p2[7:4] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      add_ln73_reg_1134 <= add_ln73_fu_325_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      add_ln76_reg_1159 <= add_ln76_fu_410_p2;
      word_addr_4_reg_1151 <= zext_ln78_4_fu_395_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state5) & (icmp_ln83_fu_442_p2 == 1'd0)) begin
      add_ln96_reg_1180 <= add_ln96_fu_448_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      icmp_ln87_reg_1248 <= icmp_ln87_fu_515_p2;
      temp_0_reg_1264 <= word_q1;
      trunc_ln96_2_reg_1271 <= trunc_ln96_2_fu_529_p1;
      trunc_ln96_reg_1259 <= trunc_ln96_fu_521_p1;
      word_load_3_reg_1252 <= word_q0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state7) begin
      temp_1_1_reg_1212 <= word_q1;
      temp_2_1_reg_1230 <= word_q0;
      trunc_ln97_1_reg_1225 <= trunc_ln97_1_fu_500_p1;
      trunc_ln97_reg_1219 <= trunc_ln97_fu_496_p1;
      trunc_ln98_1_reg_1243 <= trunc_ln98_1_fu_508_p1;
      trunc_ln98_reg_1237 <= trunc_ln98_fu_504_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln110_fu_1080_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state11)) begin
      tmp_reg_1354 <= tmp_fu_1092_p6;
    end 
  end


  always @(posedge ap_clk) begin
    if((icmp_ln73_fu_319_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      tmp_s_reg_1139[3:2] <= ~tmp_s_fu_335_p3[3:2];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      xor_ln112_reg_1359 <= xor_ln112_fu_1116_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      zext_ln110_reg_1331[5:0] <= zext_ln110_fu_1026_p1[5:0];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      zext_ln83_reg_1172[5:0] <= zext_ln83_fu_438_p1[5:0];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      zext_ln97_1_reg_1187[5:0] <= zext_ln97_1_fu_454_p1[5:0];
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      Rcon0_ce0 = 1'b1;
    end else begin
      Rcon0_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      Sbox_ce0 = 1'b1;
    end else begin
      Sbox_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      Sbox_ce1 = 1'b1;
    end else begin
      Sbox_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      Sbox_ce2 = 1'b1;
    end else begin
      Sbox_ce2 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      Sbox_ce3 = 1'b1;
    end else begin
      Sbox_ce3 = 1'b0;
    end
  end

  assign ap_ST_fsm_state10_blk = 1'b0;
  assign ap_ST_fsm_state11_blk = 1'b0;
  assign ap_ST_fsm_state12_blk = 1'b0;
  assign ap_ST_fsm_state13_blk = 1'b0;
  assign ap_ST_fsm_state14_blk = 1'b0;

  always @(*) begin
    if(ap_start == 1'b0) begin
      ap_ST_fsm_state1_blk = 1'b1;
    end else begin
      ap_ST_fsm_state1_blk = 1'b0;
    end
  end

  assign ap_ST_fsm_state2_blk = 1'b0;
  assign ap_ST_fsm_state3_blk = 1'b0;
  assign ap_ST_fsm_state4_blk = 1'b0;
  assign ap_ST_fsm_state5_blk = 1'b0;
  assign ap_ST_fsm_state6_blk = 1'b0;
  assign ap_ST_fsm_state7_blk = 1'b0;
  assign ap_ST_fsm_state8_blk = 1'b0;
  assign ap_ST_fsm_state9_blk = 1'b0;

  always @(*) begin
    if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0) | (1'b1 == ap_CS_fsm_state5) & (icmp_ln83_fu_442_p2 == 1'd1)) begin
      ap_done = 1'b1;
    end else begin
      ap_done = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) begin
      ap_idle = 1'b1;
    end else begin
      ap_idle = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state5) & (icmp_ln83_fu_442_p2 == 1'd1)) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      key_ce0 = 1'b1;
    end else begin
      key_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state14) begin
      word_address0 = ~word_addr_6_reg_1341;
    end else if(1'b1 == ap_CS_fsm_state7) begin
      word_address0 = ~zext_ln99_fu_491_p1;
    end else if(1'b1 == ap_CS_fsm_state6) begin
      word_address0 = ~zext_ln98_fu_477_p1;
    end else if(1'b1 == ap_CS_fsm_state4) begin
      word_address0 = ~word_addr_4_reg_1151;
    end else begin
      word_address0 = ~'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state12) begin
      word_address1 = ~word_addr_5_reg_1336;
    end else if(1'b1 == ap_CS_fsm_state7) begin
      word_address1 = ~zext_ln97_fu_482_p1;
    end else if(1'b1 == ap_CS_fsm_state6) begin
      word_address1 = ~zext_ln97_3_fu_466_p1;
    end else begin
      word_address1 = ~'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6)) begin
      word_ce0 = 1'b1;
    end else begin
      word_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6)) begin
      word_ce1 = 1'b1;
    end else begin
      word_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state14) begin
      word_d0 = ~xor_ln112_reg_1359;
    end else if(1'b1 == ap_CS_fsm_state4) begin
      word_d0 = ~zext_ln78_1_fu_430_p1;
    end else begin
      word_d0 = ~'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state4)) begin
      word_we0 = 1'b1;
    end else begin
      word_we0 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((icmp_ln73_fu_319_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        if((1'b1 == ap_CS_fsm_state3) & (icmp_ln76_fu_404_p2 == 1'd1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state5: begin
        if((1'b1 == ap_CS_fsm_state5) & (icmp_ln83_fu_442_p2 == 1'd1)) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state7;
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state8: begin
        if((1'b1 == ap_CS_fsm_state8) & (icmp_ln87_fu_515_p2 == 1'd0)) begin
          ap_NS_fsm = ap_ST_fsm_state10;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state9;
        end
      end
      ap_ST_fsm_state9: begin
        ap_NS_fsm = ap_ST_fsm_state10;
      end
      ap_ST_fsm_state10: begin
        ap_NS_fsm = ap_ST_fsm_state11;
      end
      ap_ST_fsm_state11: begin
        if((icmp_ln110_fu_1080_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state12;
        end
      end
      ap_ST_fsm_state12: begin
        ap_NS_fsm = ap_ST_fsm_state13;
      end
      ap_ST_fsm_state13: begin
        ap_NS_fsm = ap_ST_fsm_state14;
      end
      ap_ST_fsm_state14: begin
        ap_NS_fsm = ap_ST_fsm_state11;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign Rcon0_address0 = zext_ln89_fu_810_p1;
  assign Sbox_address0 = zext_ln251_11_fu_990_p1;
  assign Sbox_address1 = zext_ln251_8_fu_902_p1;
  assign Sbox_address2 = zext_ln251_5_fu_815_p1;
  assign Sbox_address3 = zext_ln251_2_fu_791_p1;
  assign add_ln110_fu_1086_p2 = i_4_reg_300 + 3'd1;
  assign add_ln112_1_fu_1070_p2 = sub_ln112_fu_1054_p2 + zext_ln83_reg_1172;
  assign add_ln112_fu_1060_p2 = sub_ln112_fu_1054_p2 + zext_ln110_reg_1331;
  assign add_ln251_1_fu_741_p2 = $signed(tmp_10_fu_687_p3) + $signed(sext_ln251_1_fu_737_p1);
  assign add_ln251_2_fu_896_p2 = $signed(tmp_12_fu_848_p3) + $signed(sext_ln251_2_fu_892_p1);
  assign add_ln251_3_fu_984_p2 = $signed(tmp_15_fu_936_p3) + $signed(sext_ln251_3_fu_980_p1);
  assign add_ln251_fu_636_p2 = $signed(tmp_8_fu_582_p3) + $signed(sext_ln251_fu_632_p1);
  assign add_ln73_fu_325_p2 = j_fu_104 + 3'd1;
  assign add_ln76_fu_410_p2 = i_reg_249 + 3'd1;
  assign add_ln78_fu_416_p2 = zext_ln76_fu_400_p1 + ~tmp_s_reg_1139;
  assign add_ln83_fu_1106_p2 = j_2_fu_108 + 6'd1;
  assign add_ln89_fu_804_p2 = $signed(trunc_ln4_fu_795_p4) + $signed(4'd15);
  assign add_ln96_fu_448_p2 = $signed(j_2_fu_108) + $signed(6'd63);
  assign add_ln97_fu_460_p2 = zext_ln97_2_fu_457_p1 + 8'd120;
  assign add_ln98_fu_471_p2 = zext_ln97_1_fu_454_p1 + 9'd240;
  assign add_ln99_fu_486_p2 = $signed(zext_ln97_1_reg_1187) + $signed(9'd360);
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
  assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign empty_60_fu_331_p1 = j_fu_104[1:0];
  assign empty_63_fu_512_p1 = j_2_fu_108[1:0];
  assign empty_64_fu_1021_p2 = $signed(j_2_fu_108) + $signed(6'd60);
  assign icmp_ln110_fu_1080_p2 = (i_4_reg_300 == 3'd4)? 1'b1 : 1'b0;
  assign icmp_ln73_fu_319_p2 = (j_fu_104 == 3'd4)? 1'b1 : 1'b0;
  assign icmp_ln76_fu_404_p2 = (i_reg_249 == 3'd4)? 1'b1 : 1'b0;
  assign icmp_ln83_fu_442_p2 = (j_2_fu_108 == 6'd44)? 1'b1 : 1'b0;
  assign icmp_ln87_fu_515_p2 = (empty_63_fu_512_p1 == 2'd0)? 1'b1 : 1'b0;
  assign key_address0 = zext_ln78_fu_421_p1;
  assign p_and_f1_fu_590_p3 = { { 1'd0 }, { trunc_ln97_reg_1219 } };
  assign p_and_f2_fu_695_p3 = { { 1'd0 }, { trunc_ln98_reg_1237 } };
  assign p_and_f4_fu_856_p3 = { { 1'd0 }, { trunc_ln96_reg_1259 } };
  assign p_and_f_fu_944_p3 = { { 1'd0 }, { trunc_ln96_2_reg_1271 } };
  assign p_and_t1_fu_606_p3 = { { 1'd0 }, { sub_ln251_8_fu_601_p2 } };
  assign p_and_t2_fu_711_p3 = { { 1'd0 }, { sub_ln251_10_fu_706_p2 } };
  assign p_and_t6_fu_867_p3 = { { 1'd0 }, { sub_ln251_12_reg_1291 } };
  assign p_and_t_fu_955_p3 = { { 1'd0 }, { sub_ln251_14_reg_1301 } };
  assign select_ln251_1_fu_624_p3 = (tmp_1_fu_537_p3[0:0] == 1'b1)? sub_ln251_9_fu_618_p2 : zext_ln251_fu_597_p1;
  assign select_ln251_2_fu_679_p3 = (tmp_2_fu_642_p3[0:0] == 1'b1)? sub_ln251_3_fu_664_p2 : tmp_9_fu_670_p4;
  assign select_ln251_3_fu_729_p3 = (tmp_2_fu_642_p3[0:0] == 1'b1)? sub_ln251_11_fu_723_p2 : zext_ln251_3_fu_702_p1;
  assign select_ln251_4_fu_840_p3 = (tmp_3_fu_819_p3[0:0] == 1'b1)? sub_ln251_5_fu_826_p2 : tmp_11_fu_831_p4;
  assign select_ln251_5_fu_884_p3 = (tmp_3_fu_819_p3[0:0] == 1'b1)? sub_ln251_13_fu_878_p2 : zext_ln251_6_fu_863_p1;
  assign select_ln251_6_fu_928_p3 = (tmp_13_fu_907_p3[0:0] == 1'b1)? sub_ln251_7_fu_914_p2 : tmp_14_fu_919_p4;
  assign select_ln251_7_fu_972_p3 = (tmp_13_fu_907_p3[0:0] == 1'b1)? sub_ln251_15_fu_966_p2 : zext_ln251_9_fu_951_p1;
  assign select_ln251_fu_574_p3 = (tmp_1_fu_537_p3[0:0] == 1'b1)? sub_ln251_1_fu_559_p2 : tmp_7_fu_565_p4;
  assign sext_ln251_1_fu_737_p1 = $signed(select_ln251_3_fu_729_p3);
  assign sext_ln251_2_fu_892_p1 = $signed(select_ln251_5_fu_884_p3);
  assign sext_ln251_3_fu_980_p1 = $signed(select_ln251_7_fu_972_p3);
  assign sext_ln251_fu_632_p1 = $signed(select_ln251_1_fu_624_p3);
  assign sub_ln112_fu_1054_p2 = tmp_16_fu_1034_p3 - zext_ln112_fu_1050_p1;
  assign sub_ln251_10_fu_706_p2 = 4'd0 - trunc_ln98_reg_1237;
  assign sub_ln251_11_fu_723_p2 = 6'd0 - zext_ln251_4_fu_719_p1;
  assign sub_ln251_12_fu_763_p2 = 4'd0 - trunc_ln96_fu_521_p1;
  assign sub_ln251_13_fu_878_p2 = 6'd0 - zext_ln251_7_fu_874_p1;
  assign sub_ln251_14_fu_785_p2 = 4'd0 - trunc_ln96_2_fu_529_p1;
  assign sub_ln251_15_fu_966_p2 = 6'd0 - zext_ln251_10_fu_962_p1;
  assign sub_ln251_1_fu_559_p2 = 4'd0 - trunc_ln251_4_fu_549_p4;
  assign sub_ln251_2_fu_649_p2 = 8'd0 - trunc_ln98_1_reg_1243;
  assign sub_ln251_3_fu_664_p2 = 4'd0 - trunc_ln251_6_fu_654_p4;
  assign sub_ln251_4_fu_747_p2 = 8'd0 - trunc_ln96_1_fu_525_p1;
  assign sub_ln251_5_fu_826_p2 = 4'd0 - trunc_ln251_8_reg_1286;
  assign sub_ln251_6_fu_769_p2 = 8'd0 - trunc_ln96_3_fu_533_p1;
  assign sub_ln251_7_fu_914_p2 = 4'd0 - trunc_ln251_s_reg_1296;
  assign sub_ln251_8_fu_601_p2 = 4'd0 - trunc_ln97_reg_1219;
  assign sub_ln251_9_fu_618_p2 = 6'd0 - zext_ln251_1_fu_614_p1;
  assign sub_ln251_fu_544_p2 = 8'd0 - trunc_ln97_1_reg_1225;
  assign sub_ln78_fu_372_p2 = zext_ln78_2_fu_356_p1 - zext_ln78_3_fu_368_p1;
  assign temp_0_1_fu_995_p2 = Sbox_q3 ^ Rcon0_q0;
  assign tmp_10_fu_687_p3 = { { select_ln251_2_fu_679_p3 }, { 4'd0 } };
  assign tmp_11_fu_831_p4 = { { word_load_3_reg_1252[7:4] } };
  assign tmp_12_fu_848_p3 = { { select_ln251_4_fu_840_p3 }, { 4'd0 } };
  assign tmp_13_fu_907_p3 = temp_0_reg_1264[32'd31];
  assign tmp_14_fu_919_p4 = { { temp_0_reg_1264[7:4] } };
  assign tmp_15_fu_936_p3 = { { select_ln251_6_fu_928_p3 }, { 4'd0 } };
  assign tmp_16_fu_1034_p3 = { { trunc_ln112_fu_1030_p1 }, { 7'd0 } };
  assign tmp_17_fu_1042_p3 = { { i_4_reg_300 }, { 3'd0 } };
  assign tmp_19_cast_fu_378_p4 = { { sub_ln78_fu_372_p2[8:3] } };
  assign tmp_1_fu_537_p3 = temp_1_1_reg_1212[32'd31];
  assign tmp_2_fu_642_p3 = temp_2_1_reg_1230[32'd31];
  assign tmp_3_fu_819_p3 = word_load_3_reg_1252[32'd31];
  assign tmp_4_fu_348_p3 = { { i_reg_249 }, { 7'd0 } };
  assign tmp_5_fu_360_p3 = { { i_reg_249 }, { 3'd0 } };
  assign tmp_6_fu_388_p3 = { { tmp_19_cast_fu_378_p4 }, { j_fu_104 } };
  assign tmp_7_fu_565_p4 = { { temp_1_1_reg_1212[7:4] } };
  assign tmp_8_fu_582_p3 = { { select_ln251_fu_574_p3 }, { 4'd0 } };
  assign tmp_9_fu_670_p4 = { { temp_2_1_reg_1230[7:4] } };
  assign tmp_s_fu_335_p3 = { { empty_60_fu_331_p1 }, { 2'd0 } };
  assign trunc_ln112_fu_1030_p1 = i_4_reg_300[1:0];
  assign trunc_ln251_4_fu_549_p4 = { { sub_ln251_fu_544_p2[7:4] } };
  assign trunc_ln251_6_fu_654_p4 = { { sub_ln251_2_fu_649_p2[7:4] } };
  assign trunc_ln4_fu_795_p4 = { { j_2_fu_108[5:2] } };
  assign trunc_ln96_1_fu_525_p1 = word_q0[7:0];
  assign trunc_ln96_2_fu_529_p1 = word_q1[3:0];
  assign trunc_ln96_3_fu_533_p1 = word_q1[7:0];
  assign trunc_ln96_fu_521_p1 = word_q0[3:0];
  assign trunc_ln97_1_fu_500_p1 = word_q1[7:0];
  assign trunc_ln97_fu_496_p1 = word_q1[3:0];
  assign trunc_ln98_1_fu_508_p1 = word_q0[7:0];
  assign trunc_ln98_fu_504_p1 = word_q0[3:0];
  assign xor_ln112_fu_1116_p2 = word_q1 ^ tmp_reg_1354;
  assign zext_ln110_fu_1026_p1 = empty_64_fu_1021_p2;
  assign zext_ln112_1_fu_1065_p1 = add_ln112_fu_1060_p2;
  assign zext_ln112_2_fu_1075_p1 = add_ln112_1_fu_1070_p2;
  assign zext_ln112_fu_1050_p1 = tmp_17_fu_1042_p3;
  assign zext_ln251_10_fu_962_p1 = p_and_t_fu_955_p3;
  assign zext_ln251_11_fu_990_p1 = add_ln251_3_fu_984_p2;
  assign zext_ln251_1_fu_614_p1 = p_and_t1_fu_606_p3;
  assign zext_ln251_2_fu_791_p1 = add_ln251_reg_1276;
  assign zext_ln251_3_fu_702_p1 = p_and_f2_fu_695_p3;
  assign zext_ln251_4_fu_719_p1 = p_and_t2_fu_711_p3;
  assign zext_ln251_5_fu_815_p1 = add_ln251_1_reg_1281;
  assign zext_ln251_6_fu_863_p1 = p_and_f4_fu_856_p3;
  assign zext_ln251_7_fu_874_p1 = p_and_t6_fu_867_p3;
  assign zext_ln251_8_fu_902_p1 = add_ln251_2_fu_896_p2;
  assign zext_ln251_9_fu_951_p1 = p_and_f_fu_944_p3;
  assign zext_ln251_fu_597_p1 = p_and_f1_fu_590_p3;
  assign zext_ln76_fu_400_p1 = i_reg_249;
  assign zext_ln78_1_fu_430_p1 = key_q0;
  assign zext_ln78_2_fu_356_p1 = tmp_4_fu_348_p3;
  assign zext_ln78_3_fu_368_p1 = tmp_5_fu_360_p3;
  assign zext_ln78_4_fu_395_p1 = tmp_6_fu_388_p3;
  assign zext_ln78_fu_421_p1 = add_ln78_fu_416_p2;
  assign zext_ln83_fu_438_p1 = j_2_fu_108;
  assign zext_ln89_1_fu_1001_p1 = temp_0_1_fu_995_p2;
  assign zext_ln89_fu_810_p1 = add_ln89_fu_804_p2;
  assign zext_ln90_fu_1006_p1 = Sbox_q2;
  assign zext_ln91_fu_1011_p1 = Sbox_q1;
  assign zext_ln94_fu_1016_p1 = Sbox_q0;
  assign zext_ln97_1_fu_454_p1 = add_ln96_reg_1180;
  assign zext_ln97_2_fu_457_p1 = add_ln96_reg_1180;
  assign zext_ln97_3_fu_466_p1 = add_ln97_fu_460_p2;
  assign zext_ln97_fu_482_p1 = add_ln96_reg_1180;
  assign zext_ln98_fu_477_p1 = add_ln98_fu_471_p2;
  assign zext_ln99_fu_491_p1 = add_ln99_fu_486_p2;

  always @(posedge ap_clk) begin
    tmp_s_reg_1139[1:0] <= ~2'b00;
    zext_ln83_reg_1172[8:6] <= 3'b000;
    zext_ln97_1_reg_1187[8:6] <= 3'b000;
    zext_ln110_reg_1331[8:6] <= 3'b000;
  end


endmodule


