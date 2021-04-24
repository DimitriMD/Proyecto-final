module PWM (
	input iClk,
	input [1:0]iSW,
	output [9:0]LEDs
);

wire [7:0]percentage;
wire modulated;

switches Values (
.iClk (iClk),
.iSW (iSW),
.oValue (percentage)
);

counter Modulator (
.iClk (iClk),
.iPWM (percentage),
.oPWM (modulated)
);

LEDS LEDS(

.iSignal(modulated),
.iClk(iClk),
.LEDs(LEDs)
);
endmodule 