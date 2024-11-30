-makelib xcelium_lib/xpm -sv \
  "D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../Lab 8_9/Anomaly_Detection_in_Sensor_Data/Anomaly_Detection_in_Sensor_Data.srcs/sources_1/new/threshold_exceeding_comparator.vhd" \
  "../../Lab 8_9/Anomaly_Detection_in_Sensor_Data/Anomaly_Detection_in_Sensor_Data.srcs/sim_1/new/tb_threshold_exceeding_comparator.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

