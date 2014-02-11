module conditioner (Clock, w, z);

   input Clock, w;

   output z;

	reg [1:0] state;

   parameter A = 2'b00, B = 2'b01, C = 2'b10;

   always @(posedge Clock)

     case(state)

	     A: if (w) state <= B;

		  else state <= A;

		  B: if (w) state <= C;

		  else state <= A;

		  C: if (w) state <= C;

		  else state <= A;

	  endcase

	assign z = (state == B);

endmodule