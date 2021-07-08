module probador(
    output reg clk,
    output reg reset_L,
    output reg [3:0] dataA, dataB,
    input [3:0] sum30_dd, idx_dd, sum30_dd_estruct, idx_dd_estruct
);



initial begin
	$dumpfile("sumador.vcd");
	$dumpvars;

    {reset_L} = 1'b0;
    @(posedge clk);	
    {reset_L} = 1'b1;
    {dataA} = 4'b0000;
    {dataB} = 4'b1111;
    repeat (7) begin

            // Espera/sincroniza con el flanco positivo del reloj	
            @(posedge clk);	
            {dataA} <= {dataA} +1 ;
            {dataB} <= {dataB} +1;
            {reset_L} = 1'b1;
    end

	$finish;
end  
   


    //Valor inicial del reloj para que no sea indeterminado
	initial	clk 	<= 0;	

    //Toggle cada 2*10 nano segundos		
	always	#1 clk 	<= ~clk;

endmodule
