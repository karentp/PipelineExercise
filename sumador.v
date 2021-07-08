`include "sum_pipe.v"

module sumador(
    input clk,reset_L,
    input [3:0] dataA, dataB,
    output [3:0] sum30_dd, idx_dd
);

    sum_pipe sum(.reset_L(reset_L), .clk(clk), .dataA(dataA), .dataB(dataB), .sum30_dd(sum30_dd), .idx_dd(idx_dd));
    

endmodule
