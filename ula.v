module Ula (In1, In2, OP, result, Zero_flag);
	
	input wire [31:0] In1;
	input wire [31:0] In2;
	input wire [3:0] OP;
	output reg [31:0] result;
	output wire Zero_flag;
	
	assign Zero_flag = (result == 0);

	always@ (*) begin
			
		case (OP)
			 0: result <= In1 + In2; 
          1: result <= In1 - In2;
          3: result <= In1 & In2; 
          4: result <= ~(In1 | In2); 
          5: result <= In1 | In2;
          6: result <= In1 ^ In2; 
          7: result <= In2 << (In1); 
          8: result <= In1 << (In2); 
          9: result <= In2 >> (In1); 
          10: result <= In1 >> (In2); 
          12: result <= In2 >>> (In1); 
          13: result <= In1 >>> (In2); 
          14: result <=  ($signed(In1) < $signed(In2)) ? 1 : 0; 
          15: result <= (In1 < In2) ? 1 : 0 ;
        default: result <= 0;
		endcase
	end

endmodule