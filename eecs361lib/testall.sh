#!/bin/bash

./buildall.sh

vcom test/dec_n_test.vhd
vcom test/dff_test.vhd
vcom test/dffr_test.vhd
vcom test/mux_n_test.vhd
vcom test/sram_test.vhd

vsim -c -do 'run 1000ns; quit' dec_n_test
vsim -c -do 'run 1000ns; quit' dff_test
vsim -c -do 'run 1000ns; quit' dffr_test
vsim -c -do 'run 1000ns; quit' mux_n_test
vsim -c -do 'run 1000ns; quit' sram_test
