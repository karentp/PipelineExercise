module sum_pipe(
    input clk, reset_L,
    input [3:0] dataA, dataB,
    output reg [3:0] sum30_dd, idx_dd
);

    reg [1:0] acarreo, acarreo_d;
    reg [2:0] sum_conacarreo;
    reg [3:0] sum30_d, dataA_d, dataB_d, dataAant, dataBant, idx,idx_d;
    reg [1:0] sum10, sum10_d;

    always @(*) begin
        if (reset_L) begin
            sum_conacarreo <= dataA[1:0] + dataB[1:0];
            sum10 <= sum_conacarreo[1:0];
            acarreo <= sum_conacarreo[2];
            dataAant  = dataA;
            dataBant = dataB;
            
        end
        else begin
            sum_conacarreo = 0;
            sum10 = 0;
            acarreo = 0;
            sum10_d = 0;
            acarreo_d = 0;
            sum30_d = 0;
            dataAant  = 0;
            dataBant = 0;
            idx = 0;
        end


    end
   //Segundo Etapa ya va tener 2 tiempos de retraso
   always @(posedge clk) begin
       idx <= idx +1;
       idx_d <= idx;
       idx_dd <= idx_d;
       sum10_d <= sum10;
       acarreo_d <= acarreo;
       sum30_d[3:2] <= dataAant[3:2] + dataBant[3:2]+ acarreo;
       sum30_dd[3:2] <= dataA_d[3:2] + dataB_d[3:2]+ acarreo_d;
       dataA_d<= dataAant;
       dataB_d <= dataBant;   
       sum30_d[1:0] <= sum10;
       sum30_dd[1:0] <= sum10_d;
   end 
 
endmodule
