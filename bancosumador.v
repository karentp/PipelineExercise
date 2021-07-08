//++++++++++BANCO PRUEBAS +++++++++++++++


`timescale 	1ns	/ 100ps

`include "sumador.v"
`include "probador.v"

 // Testbench

module bancopruebas_sumador;

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		clk;			// From probador_sumador of probador.v
    wire [3:0]		dataA;			// From probador_sumador of probador.v
    wire [3:0]		dataB;			// From probador_sumador of probador.v
    wire [3:0]		idx_dd;			// From sum of sumador.v
    wire		reset_L;		// From probador_sumador of probador.v
    wire [3:0]		sum30_dd;		// From sum of sumador.v
    // End of automatics
    

	sumador sum(/*AUTOINST*/
		    // Outputs
		    .sum30_dd		(sum30_dd[3:0]),
		    .idx_dd		(idx_dd[3:0]),
		    // Inputs
		    .clk		(clk),
		    .reset_L		(reset_L),
		    .dataA		(dataA[3:0]),
		    .dataB		(dataB[3:0]));

    sumador_estructural sum_estruct(/*AUTOINST*/);

	probador probador_sumador(/*AUTOINST*/
				  // Outputs
				  .clk			(clk),
				  .reset_L		(reset_L),
				  .dataA		(dataA[3:0]),
				  .dataB		(dataB[3:0]),
				  // Inputs
				  .sum30_dd		(sum30_dd[3:0]),
				  .idx_dd		(idx_dd[3:0]));
	

endmodule
