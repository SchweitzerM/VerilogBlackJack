module High(Clock,Reset,Hit,Stay);

input Hit, Reset, Stay;
output leds,leds2;
wire z1,z2,z3,z4,z5,zhand,z;

	conditioner(Clock,w);
	adder();
	hex7seg(zhand);
	StateMachine(Reset,Hit,Stay);


endmodule