module switches (
	input iClk,
	input [1:0]iSW,
	output [7:0]oValue
);

reg [7:0]rsw_D;
reg [7:0]rsw_Q;

reg [1:0]rvalue_D;
reg [1:0]rvalue_Q;

assign oValue = rsw_Q;

always @ (posedge iClk)
begin
	rvalue_Q <= rvalue_D;
	rsw_Q <= rsw_D;
end

always @ * 
begin
	rvalue_D = iSW;

	case (rvalue_Q)

	2'b00:
	begin
		rsw_D = 8'd25;
	end

	2'b01:
	begin
		rsw_D = 8'd50;
	end

	2'b10:
	begin
		rsw_D = 8'd75;
	end

	2'b11:
	begin
		rsw_D = 8'd100;
	end

	default:
	begin
		rsw_D = 8'd0;
	end
	endcase

end
endmodule 