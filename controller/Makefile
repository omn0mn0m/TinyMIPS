TOP_LEVEL = ./src/controller.v
SUPPORT_FILES = 
TESTBENCH_FILES = ./src/controller_tb.v

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