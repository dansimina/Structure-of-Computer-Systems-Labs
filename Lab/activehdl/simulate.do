onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+tb_threshold_exceeding_comparator  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_threshold_exceeding_comparator xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {tb_threshold_exceeding_comparator.udo}

run 1000ns

endsim

quit -force
