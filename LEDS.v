module LEDS (
	input iSignal,
	input iClk,
	output [9:0]LEDs
);

reg [9:0]rled_D;
reg [9:0]rled_Q;
always @ (posedge iClk)

	begin 
	rled_Q <= rled_D;
	end

always @ *
if(iSignal)
begin
	rled_D = 10'b1111111111;
end
endmodule 

