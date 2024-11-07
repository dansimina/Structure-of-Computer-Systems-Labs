// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Nov  7 13:18:09 2024
// Host        : DESKTOP-65SG8SG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/Documents/Facultate/SSC/Structure-of-Computer-Systems-Labs/Lab
//               6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/absolut_value/absolut_value_sim_netlist.v}
// Design      : absolut_value
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "absolut_value,floating_point_v7_1_15,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "floating_point_v7_1_15,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module absolut_value
   (s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    m_axis_result_tvalid,
    m_axis_result_tready,
    m_axis_result_tdata);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_A TVALID" *) input s_axis_a_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_A TREADY" *) output s_axis_a_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_A TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_A, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_axis_a_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TVALID" *) output m_axis_result_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TREADY" *) input m_axis_result_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_RESULT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_result_tdata;

  wire \<const0> ;
  wire [30:0]\^m_axis_result_tdata ;
  wire m_axis_result_tready;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tready;
  wire s_axis_a_tvalid;
  wire NLW_inst_m_axis_result_tlast_UNCONNECTED;
  wire NLW_inst_s_axis_b_tready_UNCONNECTED;
  wire NLW_inst_s_axis_c_tready_UNCONNECTED;
  wire NLW_inst_s_axis_operation_tready_UNCONNECTED;
  wire [31:31]NLW_inst_m_axis_result_tdata_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tdata[31] = \<const0> ;
  assign m_axis_result_tdata[30:0] = \^m_axis_result_tdata [30:0];
  GND GND
       (.G(\<const0> ));
  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "1" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_PRIMITIVE_A = "0" *) 
  (* C_HAS_ACCUMULATOR_PRIMITIVE_S = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "0" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "0" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_A = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_S = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_ADD = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_SUB = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_PART = "xc7a35tcpg236-1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "24" *) 
  (* C_RESULT_TDATA_WIDTH = "32" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "32" *) 
  (* C_THROTTLE_SCHEME = "1" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  absolut_value_floating_point_v7_1_15 inst
       (.aclk(1'b0),
        .aclken(1'b1),
        .aresetn(1'b1),
        .m_axis_result_tdata({NLW_inst_m_axis_result_tdata_UNCONNECTED[31],\^m_axis_result_tdata }),
        .m_axis_result_tlast(NLW_inst_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(m_axis_result_tready),
        .m_axis_result_tuser(NLW_inst_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata({1'b0,s_axis_a_tdata[30:0]}),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_inst_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(1'b0),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_inst_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_inst_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mmOvRnJo0hx7+PqMGu3YoWxrEBYAxAdZi1zk+yzEFiZIJMjePV38Oa31uE0BaogpqUs7AS9njISN
GZXX2Xcd9eCF9tXyfpnThXpwLDha12v0ZRAsGKJHWGpBuDMZg6FXSDy2oeRxKIQMa0luoKI0vLk0
yZbC4dlqmTYczcsfIuQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fc8cpYYv5vI/H3z7pnHmVqePZADreJdu3RKVQcBi8nZYms7mT9oN5x0NgM+DUuXRd1Z7x8HYKYeE
kFyxlHaCo/HIJiqVA+2bOXqsng8BbIFNN+FiN3UgJaewkE9dTJVd/ROEVhqxJON57Tx6IVhV0WmJ
cWPYhMeEYFid4FpJ0H3xsk+KcoW4L+xz+/UK9Z+xiowEJep7aUN038Ga9jglCTb40A35B8+G1HZS
h9D3sOXIpp8/2ejcwVIcjIhUkppN+xHEnunW6OkL9vh91/NWQS/u+lphwOKOX+WDuHIngd1xnvKt
+i5AmVHnptjvzDMKlW6nFgNnkugxOVQma/k9HQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
DUm+EfBkI7e/sY7EMLDsRVZLuEfIgjt3sfz7ShHtswxkS45dBAv5l/yiKPu9/6DM/iz80pGT45/K
2/hjeTM9CVgsalBokhtLjhdSW6RJFxVp6ZKD9jR7RvDnnrEaAJd+02jPK9YzTdRbTzm0sMHn5mLU
ztqja0MbixEZImt/93U=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L0pKmZTGbWTdrIwcHYZ2dWbmD42xIJQXnGlG8XhayhBFtlOYgMREvK9vlHyPS4Isiz6mTW2yh6Qv
OPeDuapEOxbUo7SjK03RgNomPPKnMz5ZpZ4FfhJ56GCAA426m/cAckB5Ni0EugOisw15S0O3/HKb
qWmEcBkcQksqvkCitstRfS8T9LvOXQXTpDNIeo+gEPlQmIe7mfCp8xAJ5TzZDXLLRsK7lSeDj6qp
FCzCOerPsmRxTazCLJBRiRlMrDyjDjq2SYXmTSicf939s/rv31mpdYo4WdsKpJp1c9z8BxTjK1/x
pFKn1uL9i5TBnnp2PTTzxJgbND1J9nSw36/6CQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
4qHn9m5I5jLdIM/fNCqj608HG58k8mMnLL06oke1tI/TPvZ4Kl/RtSd3S+PLIQKxCTyojQBz/kAO
QIzZweo20v/r7iTHLCrsHEXDtFvI78WHwMbz9lg9BDszKLVO+U7VGTdmQrQC9aeYX/M0r/2qDSi1
WycGOpmo3WneDM6hA+pcMjs+byYGYKKNcRISNPkEblobug+u53AdSy7+DOQmJrXef1lUjI6L7/HK
hUtNHd3Qx/d5CwEC58xLAeM2kn57vUXKlTSUsUjVVEol3T7lv84kKHb5yrrcb8lHxV2IojdMO2o1
n9v7EbOJK/7G3Osc9osF+JcJad6wPIsa46INFw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ETbRXS7YQk/Ygxv+Qi9wEi7T+hk+MEMZI95u/c2eFw/pb27fXDUGP48hiMfCyAWlfuwwUH3fQPbz
khlm0LIUo6Xael/yAbJaAcaV66Am02ja53+YiCngXT9RVFQyefaIP/7YcAcFRYW3SxQK5rpXQeBK
Mj9avK2LlvOh+LjIUDQUUQnoZ0qftB72dPfopDt7GDpONMtf8aFY7I2aMTiQLt6NDkPJ5avK+R1b
rLXyWH898NyGxmRWkl0zw0637JVrYNxDIRPMv0uA3ujUDE5JX4TnBweHtgPk6MyO2/pikczw2iP3
l9uU2u8K1wHGqYv32+CcE2yLLNDxLF+4zBT/8g==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DGTJq6GIxpJpCyrcF3lPti11wrEojytsyrjbNsuQDbI/UwSi2ip7dvKR7MkXC8HGDqQ5vPbQSOuR
UY3Xniav28PBFc2qZMK07SKE02Z5QhaTju1tIy6ACa8GVuTGGquCC58NNupc4u/zPB+HeQTXDlrW
r3YrSeCS3VSSwjICQ8HL9+z9e4LSbJtq65BiAlS8V7qn/ENrhwkPWY5FPdBs9Y+C3UdMV/xI5IAA
a8hqPWQswv9vZDRxH/dXI+eklyMbwzbwRZCV1KTx5P5t5VUhFXDehns8OcYJoO7M8kmK7MIpsw2P
2diAjrDolQU/urY1X7gEiYnz3/3fdkLF9ARawQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
MqYYWpi5cUKxeqegUOZ/FE71PbGIeBKRaebYLZrsAQMHxp7rX2HLBfghj8DkaLpBvFZsRe3QHQKz
7J1EMjkJRnAZ99lDMCh1BUBj9yoG3aflK5SgQS3f8wlsLqzxJQbBRYVv77/LYvZT2OjIBhwl+6FU
aRzgPT7kw+CouWg5nRmaPHQpuF7RDIGYw3iAEgHi5JqIhbys9ADrgHdVkby+d1nfJ1QzimhoiEDF
nR2tfpELYmQO6yMjac1NMKwqamfGQ7sv7BCChIwYRvW9l2fN2Yp+2i05nuVSfAyEHC9Z7nSdSPmO
kwN5VI8z8fnBCE/0cAwavWW8BKo3rvlv6KOQXDuNYHOmb8oArzgg3a5htizGcx9BfdyK/+3Pd7u5
iNn4SGpLSWsRwMYQcGbNHsXPsWpEiVtHxs06Tc1S9Arn09eWIggn++2/3CDDG+nYQrcSlMaKtTmX
rbG7zsJpirzPDalNQh3HiAK+ZU+lVyaiMY86sPq6VhY43uq9Z78kF01R

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j8OUn7H0onPT0+ubA7jLFo+cW7C6hcKI39ZZ2/bHcowL1pbZqDp3KOJxwRqSNOB7aXQ3QKJvcel+
COdVz2X4+AsoLGzifagtsIFiRDNQ2ivmE7jUyJmsfO8F1cLTi2Ezd8szMAP9Q4wvU8Vazm4bGNLk
NceiyiGaMhtt4pPVY4RvuoRdCt3Ic9/usyfgfyjZSgIqc+oT36/FtQPznhXEiWcoc3P3rILT1LfZ
lFz11X3JH70rU3hNTPjhbmy4OtvUpx0hqViwWvMIOHoDuS1aqZegrgD/qnOb+XPD4U3gzoaEu1oj
KOFl4N48DoB8AvG8tlxSJLWw7OYcwucfAsGsGw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kh/BwxmtSwCDpQctxXakO5hI8OggS/9zMDjNK1V/Ufapul01l+NDTneYoBtsN+UxUhYCPjCD1iRv
UEPQt96rbQpuhjD8CP/jeFEPi5YxM4JHzHZ7VhQ9zS32J6hbHlfstvuhuRKtBiOJf5iRLyIJTz1j
EJZ18kSnoMReFelByrCrNGLLDOkS+sxDgQB+nTBka87G71suvq38OvKnym111J6E+SRrH5nzxQXf
PBMDfwgRolZG5SN1I1aIFj2H0LCapS9XBnmG2QHWSjP/KT0kokeODxN9I42ZRBHME7JI/9Hn0XRG
w1/IsPV0MTLW6HWYkQfY06khyOWX5/O92ibJwg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dm6du8uZrty0zRl3WYy8o85sg3euEFa9tiwBLRI5BkZVjzF5VRgKOynj4Wg5xPr4zqqus+I4Hv8c
/un5WIVHTOlJeCXdM2oZ+FZtumsbjALttq7T0OK5FAWCpCUmfPeJQwUcnPYEyPruqc87Oqxx3yse
GRkpa8jGflteewCCdAJEmDXYYBf2FXd1Cl+2z3alqSjC4xHq3u/IAzTFj2nGqrodt2vTrFjCeYJW
/wbcvHkMPmOoTK+vzCW3B7glk7tou5Jx1VIBKDiA3jIla8mP2p+OBSnJSPe041KE07Y+mtPtPiIb
yY/EgBZILpY/WOcXU66VLX8bV5NIbIlrQGXplg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13728)
`pragma protect data_block
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
`pragma protect end_protected
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
