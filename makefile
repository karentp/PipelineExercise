BANCO  = bancosumador.v
YS1 = Y1.ys

all: sum


sum:  
	@echo ----------------------------------
	@echo Corriendo Sintesis Completa para el Mux 2x1: 
	@echo ----------------------------------
	
	@echo ----------------------------------
	@echo Cambiando nombre al module para evitar problemas:
	@echo ----------------------------------

	@echo ----------------------------------
	@echo Corriendo pruebas del bus control :
	@echo ----------------------------------
	emacs --batch $(BANCO) -f verilog-batch-auto 
	iverilog -o prueba.vvp $(BANCO)
	vvp prueba.vvp
	gtkwave sumador.vcd