
module FetchCircuit(clk, s, write, sc_inr, sc_clr, pc_ld, pc_clr, ar_inr, ar_clr,
			sys_bus, w_ar_data, w_pc_data, w_ir_data, w_mem_data);

input clk;
output [2:0] s;

input write;
input pc_ld, pc_clr;
input ar_inr, ar_clr;
input sc_inr, sc_clr;

output [15:0] sys_bus;
output [11:0] w_ar_data;
output [11:0] w_pc_data;
output [15:0] w_ir_data;
output [15:0] w_mem_data;

wire [7:0] dec_out1;

reg [15:0] w_sys_bus;

ControlUnit u0(sc_inr, sc_clr, w_ir_data, clk, s, dec_out1);

bus u1(s, clk, dec_out1[1], w_mem_data, w_ar_data, w_pc_data, w_ir_data, sys_bus);

ar u2(dec_out1[0], ar_clr, ar_inr, clk, sys_bus, w_ar_data);
pc u3(pc_ld, pc_clr, dec_out1[1], clk, sys_bus, w_pc_data);
ir u4(dec_out1[1], clk, sys_bus, w_ir_data);
mem u5(dec_out1[1], write, w_ar_data, sys_bus, w_mem_data);

endmodule
