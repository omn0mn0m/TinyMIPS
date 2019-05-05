.PHONY: syn test atpg

syn:
	dc_shell -f dc_syn.tcl

test:
	dc_shell -f dc_test.tcl

atpg:
	tmax tmax_atpg.tcl
    
# Test
