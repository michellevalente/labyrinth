TARFILES = Makefile lab1.qpf lab1.qsf SoCKit_Top.sv VGA_LED_Emulator.sv \
	lab1.sdc lab1.sv

lab1.tar.gz : $(TARFILES)
	mkdir lab1
	ln $(TARFILES) lab1
	tar zcf lab1.tar.gz lab1
	rm -rf lab1

.PHONY : clean

clean :
	rm -rf db output_files hc_output incremental_db simulation \
	c5_pin_model_dump.txt *.qws
