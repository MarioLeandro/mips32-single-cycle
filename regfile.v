module RegFile (ReadAddr1, ReadAddr2, ReadData1, ReadData2, WriteAddr, WriteData, RegWrite, Clock, Reset);
	
	output  wire [31:0] ReadData1;
	output  wire [31:0] ReadData2;
	input wire [31:0] WriteData;
	input wire [4:0] ReadAddr1;
	input wire [4:0] ReadAddr2;
	input wire [4:0] WriteAddr;
	input wire RegWrite, Clock, Reset;
	
	reg [31:0] regs [31:0];
	
	initial begin
    	regs[0] = 0;
    	regs[1] = 0;
    	regs[2] = 0;
    	regs[3] = 0;
    	regs[4] = 0;
    	regs[5] = 0;
    	regs[6] = 0;
    	regs[7] = 0;
    	regs[8] = 0;
    	regs[9] = 0;
    	regs[10] = 0;
    	regs[11] = 0;
    	regs[12] = 0;
    	regs[13] = 0;
    	regs[14] = 0;
    	regs[15] = 0;
    	regs[16] = 0;
    	regs[17] = 0;
    	regs[18] = 0;
    	regs[19] = 0;
    	regs[20] = 0;
    	regs[21] = 0;
    	regs[22] = 0;
    	regs[23] = 0;
    	regs[24] = 0;
    	regs[25] = 0;
    	regs[26] = 0;
    	regs[27] = 0;
    	regs[28] = 0;
    	regs[29] = 0;
    	regs[30] = 0;
    	regs[31] = 0;
  end
  

	integer i;

	always@ (posedge Clock, posedge Reset) begin
		if (Reset) 
			for (i = 0; i < 32; i = i + 1)
				regs[i] <= 0;
		else if (RegWrite && WriteAddr!= 0)
			regs[WriteAddr] <= WriteData;
	end
	
	assign ReadData1 = (ReadAddr1 == 0) ? 0 : regs[ReadAddr1];
   assign ReadData2 = (ReadAddr2 == 0) ? 0 : regs[ReadAddr2];

endmodule