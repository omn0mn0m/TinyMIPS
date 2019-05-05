TOP_LEVEL = ./src/datapath.v
SUPPORT_FILES = ./datapath/src/alu.v ./datapath/src/datapath.v ./datapath/src/dff.v ./datapath/src/mux.v ./datapath/src/regfile.v
TESTBENCH_FILES = ./src/datapath_tb.v

.PHONY: compile syn test atpg

compile:
	sim-nc $(TOP_LEVEL) $(SUPPORT_FILES)

sim:
	sim-nc $(TESTBENCH_FILES) $(TOP_LEVEL) $(SUPPORT_FILES)

syn:
	dc_shell -f dc_syn.tcl

test:
	dc_shell -f dc_test.tcl

atpg:
	tmax tmax_atpg.tcl