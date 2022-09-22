module IMem (address, i_out);

	input wire [31:0] address;
	output wire [31:0] i_out;
	
	reg [31:0] instructions[255:0];
	
	initial begin
		$readmemb("instruction.list", instructions);
	end
	
	assign i_out = instructions[address  >> 2];


endmodule