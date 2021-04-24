module counter (
	input iClk,
	input iPWM,
	output oPWM
);

reg [7:0]rcount_D;
reg [7:0]rcount_Q;

reg rsignal_D;
reg rsignal_Q;

reg [3:0]rvalue_D;
reg [3:0]rvalue_Q;

assign oPWM = rsignal_Q;

always @ (posedge iClk)
begin
	rcount_Q <= rcount_D;
	rsignal_Q <= rsignal_D;
	rvalue_Q <= rvalue_D;
end

always @ *
begin
	rvalue_D = iPWM;

	if(rcount_Q == 100)
	begin
		rcount_D = 8'd0;
	end
	else
	begin
		rcount_D = rcount_Q + 8'd1;
	end

	if(rcount_Q < rvalue_Q) //25 - 50 - 75 - 100
	begin
		rsignal_D = 1'd1;
	end
	else
	begin
		rsignal_D = 1'd0;
	end
end

endmodule