onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+testbench_stimulus_file  -L xpm -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_9 -L xil_defaultlib -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L xbip_pipe_v3_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_6 -L xbip_dsp48_multadd_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_18 -L floating_point_v7_1_15 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.testbench_stimulus_file xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {testbench_stimulus_file.udo}

run 1000ns

endsim

quit -force
