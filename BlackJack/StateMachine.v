module StateMachine (Clock,Reset,Hit,Stay,z1,z2,z3,z4,z5,zhand);

   input Clock, Reset,Hit,Stay;

   output z1,z2,z3,z4,z5,zhand;

	reg [0:2] state,y;

	//reg y1 = 1'b0, y2 = 1'b1, y3 = 1'b1, y4 = 1'b0;

	reg hand = 5'b00000;

	reg dealerHand = 5'b00000;

   parameter play = 3'b001, win = 3'b010, lose = 3'b011, bust = 3'b100, dealerBust = 3'b101;

	always @(posedge Clock or negedge resetn)

	if (Reset)

		state = play;

	else

		begin

			case(state)

				play:

					begin

						/*hand += randomInt(1->10);*/ // <----Need that

						if (Hit)

							begin

								if (hand < 5'b10101)

									state=play;

								else

									state=bust;

							end

						else if (Stay)

							begin

								while (dealerHand < 5'b10001)

									begin

										/*dealerHand += randomInt(1->10);*/ // <----Need that

									end

								if (hand > dealerHand)

									state = win;

								else if (dealerHand > 5'b10101)

									state = dealerBust;

								else

									state = lose;

							end

						else

							state = play;

					end

				win: 

					if (Reset)

						hand = 5'b00000;

						state = play;

					else

						state = win;

				lose:

					if (Reset)

						hand = 5'b00000;

						state = play;

					else

						state = lose;

				bust:

					if (Reset)

						hand = 5'b00000;

						state = play;

					else

						state = bust;

				dealerBust:

					if (Reset)

						hand = 5'b00000;

						state = play;

					else

						state = dealerBust;

				default:

					state = play;

			endcase

		end

	assign z1 = (state == bust);

	assign z2 = (state == win);

	assign z3 = (state == lose);

	assign z4 = (state == play);

	assign z5 = (state == dealerBust);

	assign zhand = (hand);

endmodule