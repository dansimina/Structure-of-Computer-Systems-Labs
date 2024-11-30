onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib tb_threshold_exceeding_comparator_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {tb_threshold_exceeding_comparator.udo}

run 1000ns

quit -force
