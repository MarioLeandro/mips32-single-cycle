module UlaCtrl (ALUOp, func, operation, shamt, JR);

	input wire [2:0] ALUOp;
	input wire [5:0] func;
	output reg [3:0] operation;
	output wire shamt, JR;
	
	reg [3:0] OpCheck;

	always @(*) begin
        case(ALUOp)
            0: operation = 0; 
            1: operation = 1; 
            2: operation = 3; 
            3: operation = 5; 
            4: operation = 6; 
            5: operation = 14; 
            6: operation = OpCheck; 
            7: operation = 15; 
            default: operation = 0; 
        endcase
    end

    always @(*) begin
        case(func)
            0: OpCheck <= 7; 
            2:  OpCheck <= 9; 
            3: OpCheck <= 12; 
            4: OpCheck <= 8;
            6: OpCheck <= 10; 
            7: OpCheck <= 13;
            32: OpCheck <= 0; 
            34: OpCheck <= 1;
            36: OpCheck <= 3;
            37: OpCheck <= 5;  
            38: OpCheck <= 6; 
            39: OpCheck <= 4; 
            42: OpCheck <= 14; 
            43: OpCheck <= 15; 
            default: OpCheck <= 0;
        endcase
    end

    assign JR = (ALUOp == 6) ? ((func == 8) ? 1 : 0) : 0;
    assign shamt = (ALUOp == 6) ? ((func == 0 || func == 2 || func == 3) ? 1 : 0) : 0;

endmodule