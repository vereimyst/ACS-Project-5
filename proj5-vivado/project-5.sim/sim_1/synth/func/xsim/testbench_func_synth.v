// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu Dec  5 13:32:54 2024
// Host        : Delphinium running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/tmpProjs/project-5/project-5.sim/sim_1/synth/func/xsim/testbench_func_synth.v
// Design      : top_module
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CARRY_LIMIT = "4" *) (* N = "8" *) 
(* NotValidForBitStream *)
module top_module
   (a,
    b,
    clk,
    sum_exact,
    sum_truncated,
    sum_simplified,
    sum_reduced,
    sum_stochastic);
  input [7:0]a;
  input [7:0]b;
  input clk;
  output [7:0]sum_exact;
  output [7:0]sum_truncated;
  output [7:0]sum_simplified;
  output [7:0]sum_reduced;
  output [7:0]sum_stochastic;

  wire [7:0]a;
  wire [7:0]a_IBUF;
  wire [7:0]b;
  wire [7:0]b_IBUF;
  wire \exact_adder/carry_3 ;
  wire \exact_adder/carry_5 ;
  wire [7:0]sum_exact;
  wire [7:4]sum_exact_OBUF;
  wire [7:0]sum_reduced;
  wire [3:1]sum_reduced_OBUF;
  wire [7:0]sum_simplified;
  wire [7:0]sum_simplified_OBUF;
  wire [7:0]sum_stochastic;
  wire [7:0]sum_stochastic_OBUF;
  wire [7:0]sum_truncated;
  wire [7:4]sum_truncated_OBUF;
  wire \sum_truncated_OBUF[7]_inst_i_2_n_0 ;

  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \a_IBUF[2]_inst 
       (.I(a[2]),
        .O(a_IBUF[2]));
  IBUF \a_IBUF[3]_inst 
       (.I(a[3]),
        .O(a_IBUF[3]));
  IBUF \a_IBUF[4]_inst 
       (.I(a[4]),
        .O(a_IBUF[4]));
  IBUF \a_IBUF[5]_inst 
       (.I(a[5]),
        .O(a_IBUF[5]));
  IBUF \a_IBUF[6]_inst 
       (.I(a[6]),
        .O(a_IBUF[6]));
  IBUF \a_IBUF[7]_inst 
       (.I(a[7]),
        .O(a_IBUF[7]));
  IBUF \b_IBUF[0]_inst 
       (.I(b[0]),
        .O(b_IBUF[0]));
  IBUF \b_IBUF[1]_inst 
       (.I(b[1]),
        .O(b_IBUF[1]));
  IBUF \b_IBUF[2]_inst 
       (.I(b[2]),
        .O(b_IBUF[2]));
  IBUF \b_IBUF[3]_inst 
       (.I(b[3]),
        .O(b_IBUF[3]));
  IBUF \b_IBUF[4]_inst 
       (.I(b[4]),
        .O(b_IBUF[4]));
  IBUF \b_IBUF[5]_inst 
       (.I(b[5]),
        .O(b_IBUF[5]));
  IBUF \b_IBUF[6]_inst 
       (.I(b[6]),
        .O(b_IBUF[6]));
  IBUF \b_IBUF[7]_inst 
       (.I(b[7]),
        .O(b_IBUF[7]));
  OBUF \sum_exact_OBUF[0]_inst 
       (.I(sum_stochastic_OBUF[0]),
        .O(sum_exact[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_exact_OBUF[0]_inst_i_1 
       (.I0(b_IBUF[0]),
        .I1(a_IBUF[0]),
        .O(sum_stochastic_OBUF[0]));
  OBUF \sum_exact_OBUF[1]_inst 
       (.I(sum_reduced_OBUF[1]),
        .O(sum_exact[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    \sum_exact_OBUF[1]_inst_i_1 
       (.I0(b_IBUF[0]),
        .I1(a_IBUF[0]),
        .I2(a_IBUF[1]),
        .I3(b_IBUF[1]),
        .O(sum_reduced_OBUF[1]));
  OBUF \sum_exact_OBUF[2]_inst 
       (.I(sum_reduced_OBUF[2]),
        .O(sum_exact[2]));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \sum_exact_OBUF[2]_inst_i_1 
       (.I0(b_IBUF[0]),
        .I1(a_IBUF[0]),
        .I2(a_IBUF[1]),
        .I3(b_IBUF[1]),
        .I4(a_IBUF[2]),
        .I5(b_IBUF[2]),
        .O(sum_reduced_OBUF[2]));
  OBUF \sum_exact_OBUF[3]_inst 
       (.I(sum_reduced_OBUF[3]),
        .O(sum_exact[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \sum_exact_OBUF[3]_inst_i_1 
       (.I0(\exact_adder/carry_3 ),
        .I1(a_IBUF[3]),
        .I2(b_IBUF[3]),
        .O(sum_reduced_OBUF[3]));
  OBUF \sum_exact_OBUF[4]_inst 
       (.I(sum_exact_OBUF[4]),
        .O(sum_exact[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \sum_exact_OBUF[4]_inst_i_1 
       (.I0(\exact_adder/carry_3 ),
        .I1(a_IBUF[3]),
        .I2(b_IBUF[3]),
        .I3(a_IBUF[4]),
        .I4(b_IBUF[4]),
        .O(sum_exact_OBUF[4]));
  OBUF \sum_exact_OBUF[5]_inst 
       (.I(sum_exact_OBUF[5]),
        .O(sum_exact[5]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    \sum_exact_OBUF[5]_inst_i_1 
       (.I0(\exact_adder/carry_3 ),
        .I1(a_IBUF[3]),
        .I2(b_IBUF[3]),
        .I3(a_IBUF[4]),
        .I4(b_IBUF[4]),
        .I5(sum_stochastic_OBUF[5]),
        .O(sum_exact_OBUF[5]));
  LUT6 #(
    .INIT(64'hEEE8E888E888E888)) 
    \sum_exact_OBUF[5]_inst_i_2 
       (.I0(b_IBUF[2]),
        .I1(a_IBUF[2]),
        .I2(b_IBUF[1]),
        .I3(a_IBUF[1]),
        .I4(a_IBUF[0]),
        .I5(b_IBUF[0]),
        .O(\exact_adder/carry_3 ));
  OBUF \sum_exact_OBUF[6]_inst 
       (.I(sum_exact_OBUF[6]),
        .O(sum_exact[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \sum_exact_OBUF[6]_inst_i_1 
       (.I0(\exact_adder/carry_5 ),
        .I1(a_IBUF[5]),
        .I2(b_IBUF[5]),
        .I3(a_IBUF[6]),
        .I4(b_IBUF[6]),
        .O(sum_exact_OBUF[6]));
  OBUF \sum_exact_OBUF[7]_inst 
       (.I(sum_exact_OBUF[7]),
        .O(sum_exact[7]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    \sum_exact_OBUF[7]_inst_i_1 
       (.I0(\exact_adder/carry_5 ),
        .I1(a_IBUF[5]),
        .I2(b_IBUF[5]),
        .I3(a_IBUF[6]),
        .I4(b_IBUF[6]),
        .I5(sum_stochastic_OBUF[7]),
        .O(sum_exact_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \sum_exact_OBUF[7]_inst_i_2 
       (.I0(b_IBUF[4]),
        .I1(a_IBUF[4]),
        .I2(b_IBUF[3]),
        .I3(a_IBUF[3]),
        .I4(\exact_adder/carry_3 ),
        .O(\exact_adder/carry_5 ));
  OBUF \sum_reduced_OBUF[0]_inst 
       (.I(sum_stochastic_OBUF[0]),
        .O(sum_reduced[0]));
  OBUF \sum_reduced_OBUF[1]_inst 
       (.I(sum_reduced_OBUF[1]),
        .O(sum_reduced[1]));
  OBUF \sum_reduced_OBUF[2]_inst 
       (.I(sum_reduced_OBUF[2]),
        .O(sum_reduced[2]));
  OBUF \sum_reduced_OBUF[3]_inst 
       (.I(sum_reduced_OBUF[3]),
        .O(sum_reduced[3]));
  OBUF \sum_reduced_OBUF[4]_inst 
       (.I(sum_stochastic_OBUF[4]),
        .O(sum_reduced[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_reduced_OBUF[4]_inst_i_1 
       (.I0(b_IBUF[4]),
        .I1(a_IBUF[4]),
        .O(sum_stochastic_OBUF[4]));
  OBUF \sum_reduced_OBUF[5]_inst 
       (.I(sum_stochastic_OBUF[5]),
        .O(sum_reduced[5]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_reduced_OBUF[5]_inst_i_1 
       (.I0(b_IBUF[5]),
        .I1(a_IBUF[5]),
        .O(sum_stochastic_OBUF[5]));
  OBUF \sum_reduced_OBUF[6]_inst 
       (.I(sum_stochastic_OBUF[6]),
        .O(sum_reduced[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_reduced_OBUF[6]_inst_i_1 
       (.I0(b_IBUF[6]),
        .I1(a_IBUF[6]),
        .O(sum_stochastic_OBUF[6]));
  OBUF \sum_reduced_OBUF[7]_inst 
       (.I(sum_stochastic_OBUF[7]),
        .O(sum_reduced[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_reduced_OBUF[7]_inst_i_1 
       (.I0(b_IBUF[7]),
        .I1(a_IBUF[7]),
        .O(sum_stochastic_OBUF[7]));
  OBUF \sum_simplified_OBUF[0]_inst 
       (.I(sum_simplified_OBUF[0]),
        .O(sum_simplified[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[0]_inst_i_1 
       (.I0(a_IBUF[0]),
        .I1(b_IBUF[0]),
        .O(sum_simplified_OBUF[0]));
  OBUF \sum_simplified_OBUF[1]_inst 
       (.I(sum_simplified_OBUF[1]),
        .O(sum_simplified[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[1]_inst_i_1 
       (.I0(a_IBUF[1]),
        .I1(b_IBUF[1]),
        .O(sum_simplified_OBUF[1]));
  OBUF \sum_simplified_OBUF[2]_inst 
       (.I(sum_simplified_OBUF[2]),
        .O(sum_simplified[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[2]_inst_i_1 
       (.I0(a_IBUF[2]),
        .I1(b_IBUF[2]),
        .O(sum_simplified_OBUF[2]));
  OBUF \sum_simplified_OBUF[3]_inst 
       (.I(sum_simplified_OBUF[3]),
        .O(sum_simplified[3]));
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[3]_inst_i_1 
       (.I0(a_IBUF[3]),
        .I1(b_IBUF[3]),
        .O(sum_simplified_OBUF[3]));
  OBUF \sum_simplified_OBUF[4]_inst 
       (.I(sum_simplified_OBUF[4]),
        .O(sum_simplified[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[4]_inst_i_1 
       (.I0(a_IBUF[4]),
        .I1(b_IBUF[4]),
        .O(sum_simplified_OBUF[4]));
  OBUF \sum_simplified_OBUF[5]_inst 
       (.I(sum_simplified_OBUF[5]),
        .O(sum_simplified[5]));
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[5]_inst_i_1 
       (.I0(a_IBUF[5]),
        .I1(b_IBUF[5]),
        .O(sum_simplified_OBUF[5]));
  OBUF \sum_simplified_OBUF[6]_inst 
       (.I(sum_simplified_OBUF[6]),
        .O(sum_simplified[6]));
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[6]_inst_i_1 
       (.I0(a_IBUF[6]),
        .I1(b_IBUF[6]),
        .O(sum_simplified_OBUF[6]));
  OBUF \sum_simplified_OBUF[7]_inst 
       (.I(sum_simplified_OBUF[7]),
        .O(sum_simplified[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \sum_simplified_OBUF[7]_inst_i_1 
       (.I0(a_IBUF[7]),
        .I1(b_IBUF[7]),
        .O(sum_simplified_OBUF[7]));
  OBUF \sum_stochastic_OBUF[0]_inst 
       (.I(sum_stochastic_OBUF[0]),
        .O(sum_stochastic[0]));
  OBUF \sum_stochastic_OBUF[1]_inst 
       (.I(sum_stochastic_OBUF[1]),
        .O(sum_stochastic[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_stochastic_OBUF[1]_inst_i_1 
       (.I0(b_IBUF[1]),
        .I1(a_IBUF[1]),
        .O(sum_stochastic_OBUF[1]));
  OBUF \sum_stochastic_OBUF[2]_inst 
       (.I(sum_stochastic_OBUF[2]),
        .O(sum_stochastic[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_stochastic_OBUF[2]_inst_i_1 
       (.I0(b_IBUF[2]),
        .I1(a_IBUF[2]),
        .O(sum_stochastic_OBUF[2]));
  OBUF \sum_stochastic_OBUF[3]_inst 
       (.I(sum_stochastic_OBUF[3]),
        .O(sum_stochastic[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sum_stochastic_OBUF[3]_inst_i_1 
       (.I0(b_IBUF[3]),
        .I1(a_IBUF[3]),
        .O(sum_stochastic_OBUF[3]));
  OBUF \sum_stochastic_OBUF[4]_inst 
       (.I(sum_stochastic_OBUF[4]),
        .O(sum_stochastic[4]));
  OBUF \sum_stochastic_OBUF[5]_inst 
       (.I(sum_stochastic_OBUF[5]),
        .O(sum_stochastic[5]));
  OBUF \sum_stochastic_OBUF[6]_inst 
       (.I(sum_stochastic_OBUF[6]),
        .O(sum_stochastic[6]));
  OBUF \sum_stochastic_OBUF[7]_inst 
       (.I(sum_stochastic_OBUF[7]),
        .O(sum_stochastic[7]));
  OBUF \sum_truncated_OBUF[0]_inst 
       (.I(1'b0),
        .O(sum_truncated[0]));
  OBUF \sum_truncated_OBUF[1]_inst 
       (.I(1'b0),
        .O(sum_truncated[1]));
  OBUF \sum_truncated_OBUF[2]_inst 
       (.I(1'b0),
        .O(sum_truncated[2]));
  OBUF \sum_truncated_OBUF[3]_inst 
       (.I(1'b0),
        .O(sum_truncated[3]));
  OBUF \sum_truncated_OBUF[4]_inst 
       (.I(sum_truncated_OBUF[4]),
        .O(sum_truncated[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \sum_truncated_OBUF[4]_inst_i_1 
       (.I0(a_IBUF[4]),
        .I1(b_IBUF[4]),
        .O(sum_truncated_OBUF[4]));
  OBUF \sum_truncated_OBUF[5]_inst 
       (.I(sum_truncated_OBUF[5]),
        .O(sum_truncated[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    \sum_truncated_OBUF[5]_inst_i_1 
       (.I0(a_IBUF[4]),
        .I1(b_IBUF[4]),
        .I2(b_IBUF[5]),
        .I3(a_IBUF[5]),
        .O(sum_truncated_OBUF[5]));
  OBUF \sum_truncated_OBUF[6]_inst 
       (.I(sum_truncated_OBUF[6]),
        .O(sum_truncated[6]));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \sum_truncated_OBUF[6]_inst_i_1 
       (.I0(b_IBUF[4]),
        .I1(a_IBUF[4]),
        .I2(b_IBUF[5]),
        .I3(a_IBUF[5]),
        .I4(b_IBUF[6]),
        .I5(a_IBUF[6]),
        .O(sum_truncated_OBUF[6]));
  OBUF \sum_truncated_OBUF[7]_inst 
       (.I(sum_truncated_OBUF[7]),
        .O(sum_truncated[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \sum_truncated_OBUF[7]_inst_i_1 
       (.I0(\sum_truncated_OBUF[7]_inst_i_2_n_0 ),
        .I1(b_IBUF[6]),
        .I2(a_IBUF[6]),
        .I3(b_IBUF[7]),
        .I4(a_IBUF[7]),
        .O(sum_truncated_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    \sum_truncated_OBUF[7]_inst_i_2 
       (.I0(a_IBUF[5]),
        .I1(b_IBUF[5]),
        .I2(a_IBUF[4]),
        .I3(b_IBUF[4]),
        .O(\sum_truncated_OBUF[7]_inst_i_2_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
