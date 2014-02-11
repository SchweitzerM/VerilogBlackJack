module adder(reg4,flipflop,sum,carryout);
	parameter n=5;
	input [n-1:0]reg4;
	input [n-1:0]flipflop;
	output reg [0:n-1]sum;
	output reg carryout;
	reg [n:0]C;
	integer k;
	
	always @(reg4 or flipflop)
	begin
		C[0]=0;
		for (k=0;k<=n-1;k=k+1)
		begin
			sum[k]=reg4[k]^flipflop[k]^C[k];
			C[k+1]=(reg4[k]&flipflop[k])|(C[k]&reg4[k])|(C[k]&flipflop[k]);
		end
		carryout=C[n];
	end

endmodule