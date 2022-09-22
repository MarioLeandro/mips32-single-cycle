module DMem (Address, WriteData, ReadData, MemWrite, MemRead);

	input wire [31:0] Address;
	input wire [31:0] WriteData;
	output wire [31:0] ReadData;
	input wire MemWrite;
	input wire MemRead;
	
	reg [31:0] data [255:0];
	
	integer i;
    

    initial begin
      for (i = 0; i < 256; i = i + 1) begin
        data[i] <= 0;
      end
    end	
	
	always @ (*) begin
		if (MemWrite == 1)
			data[Address] <= WriteData;			
	end

	assign ReadData = (MemRead == 0) ? 0 : data[Address];


endmodule