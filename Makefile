TOP_LEVEL = ./src/mips.v
SUPPORT_FILES = ./alu_regf/src/alucontrol.v ./datapath/src/regfile.v ./datapath/src/alu.v ./controller/src/controller.v ./datapath/src/datapath.v ./datapath/src/dff.v ./datapath/src/mux.v ./pc/src/pc_controller.v
TESTBENCH_FILES = ./src/top_tb.v ./src/mips_mem.v ./src/exmem.v

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
