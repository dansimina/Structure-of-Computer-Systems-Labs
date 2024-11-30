vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../Lab 8_9/Anomaly_Detection_in_Sensor_Data/Anomaly_Detection_in_Sensor_Data.gen/sources_1/ip/fifo/hdl" "+incdir+../../Lab 8_9/Anomaly_Detection_in_Sensor_Data/Anomaly_Detection_in_Sensor_Data.gen/sources_1/ip/broadcaster/hdl" \
"D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  \
"../../Lab 8_9/Anomaly_Detection_in_Sensor_Data/Anomaly_Detection_in_Sensor_Data.srcs/sources_1/new/threshold_exceeding_comparator.vhd" \
"../../Lab 8_9/Anomaly_Detection_in_Sensor_Data/Anomaly_Detection_in_Sensor_Data.srcs/sim_1/new/tb_threshold_exceeding_comparator.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

