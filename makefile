BANCO  = bancosumador.v
YS1 = Y1.ys

all: sum


sum:  
	@echo ----------------------------------
	@echo Corriendo Sintesis Completa para el Mux 2x1: 
	@echo ----------------------------------
	yosys $(YS1)
	@echo ----------------------------------
	@echo Cambiando nombre al module para evitar problemas:
	@echo ----------------------------------
	sed -i 's/sum30_dd/sum30_dd_estruct/' sumador_estructural.v
	sed -i 's/idx_dd/idx_dd_estruct/' sumador_estructural.v
	sed -i 's/sumador/sumador_estruct/' sumador_estructural.v
	@echo ----------------------------------
	@echo Corriendo pruebas del bus control :
	@echo ----------------------------------
	emacs --batch $(BANCO) -f verilog-batch-auto 
	iverilog -o prueba.vvp $(BANCO) cmos_cells.v sumador_estructural.v
	vvp prueba.vvp
	gtkwave sumador.vcd