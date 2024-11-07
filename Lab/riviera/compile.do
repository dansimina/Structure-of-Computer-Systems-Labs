vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_data_fifo_v2_0_9
vlib riviera/xil_defaultlib
vlib riviera/xbip_utils_v3_0_10
vlib riviera/axi_utils_v2_0_6
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_dsp48_multadd_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_18
vlib riviera/floating_point_v7_1_15

vmap xpm riviera/xpm
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_9 riviera/axis_data_fifo_v2_0_9
vmap xil_defaultlib riviera/xil_defaultlib
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 riviera/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 riviera/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_18 riviera/mult_gen_v12_0_18
vmap floating_point_v7_1_15 riviera/floating_point_v7_1_15

vlog -work xpm  -sv2k12 "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/axis_data_fifo_0/hdl" "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fifo32x64/hdl" \
"D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/axis_data_fifo_0/hdl" "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fifo32x64/hdl" \
"../hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_9  -v2k5 "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/axis_data_fifo_0/hdl" "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fifo32x64/hdl" \
"../hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/axis_data_fifo_0/hdl" "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fifo32x64/hdl" \
"../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fifo32x64/sim/fifo32x64.v" \

vcom -work xbip_utils_v3_0_10 -93  \
"../hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93  \
"../hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93  \
"../hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93  \
"../hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93  \
"../hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -93  \
"../hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93  \
"../hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_18 -93  \
"../hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_15 -93  \
"../hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_15  -v2k5 "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/axis_data_fifo_0/hdl" "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fifo32x64/hdl" \
"../hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/axis_data_fifo_0/hdl" "+incdir+../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fifo32x64/hdl" \
"../../Lab 6/Streaming_Data_Processing/Streaming_Data_Processing.gen/sources_1/ip/fp_subtractor/sim/fp_subtractor.v" \

vcom -work xil_defaultlib -93  \
"../../Lab 6/temperature_subtractor.vhd" \
"../../Lab 6/testbench_stimulus_file.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

