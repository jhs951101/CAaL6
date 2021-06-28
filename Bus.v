
module bus(s, clk, read, mem_data, ar_data, pc_data, ir_data, bus_data);

input clk, read;
input [2:0] s;
input [15:0] mem_data, ir_data;
input [11:0] ar_data, pc_data;
output [15:0] bus_data;

mux u0(clk, read, 0, ar_data, pc_data, 0, 0, ir_data, 0, mem_data, s, bus_data);

endmodule
