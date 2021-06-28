`timescale 1ns/100ps
`include "FetchC.v"

module tb_FetchCircuit;

reg clk;
wire [2:0] s;

reg write;
reg pc_ld, pc_clr;
reg ar_inr, ar_clr;
reg sc_inr, sc_clr;

wire [15:0] sys_bus;
wire [11:0] w_ar_data;
wire [11:0] w_pc_data;
wire [15:0] w_ir_data;
wire [15:0] w_mem_data;

FetchCircuit obj(clk, s, write, sc_inr, sc_clr, pc_ld, pc_clr, ar_inr, ar_clr,
			sys_bus, w_ar_data, w_pc_data, w_ir_data, w_mem_data);

initial begin
	clk = 0;
	sc_clr = 0;
	sc_inr = 0;

	write = 0;
	pc_ld = 0;
	pc_clr = 0;
	ar_inr = 0;
	ar_clr = 0;

	#20 sc_inr = 1;
end

always #10 clk = ~clk;

endmodule


/*module tb_FetchCircuit;

reg clk;
reg [2:0] s;

reg read, write;
reg pc_ld, pc_clr, pc_inr;
reg ar_ld, ar_inr, ar_clr;
reg ir_ld;

wire [15:0] sys_bus;
wire [11:0] w_ar_data;
wire [11:0] w_pc_data;
wire [15:0] w_ir_data;
wire [15:0] w_mem_data;

FetchCircuit obj(clk, s, read, write, pc_ld, pc_clr, pc_inr, ar_ld, ar_inr, ar_clr,
			ir_ld, sys_bus, w_ar_data, w_pc_data, w_ir_data, w_mem_data);

initial begin
	clk <= 0;
	pc_inr <= 0;
	pc_clr <= 0;
	ar_clr <= 0;
	ar_inr <= 0;
	pc_ld <= 0;
	ar_ld <= 0;
	read <= 0;
	write <= 0;
	ir_ld <= 0;
	s <= 3'b010;
end

initial begin
	#5 ar_ld <= 1;
	#25 ar_ld <= 0;
end

initial begin
	#30 read <= 1;
	#30 read <= 0;
end

initial begin
	#20 pc_inr <= 1;
	#20 pc_inr <= 0;
end

initial begin
	#25 s <= 3'b111;
end

initial begin
	#25 ir_ld <= 1;
	#10 ir_ld <= 0;
end

always #10 clk <= ~clk;

endmodule*/
