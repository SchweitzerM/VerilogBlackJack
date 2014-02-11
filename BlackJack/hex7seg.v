module hex7seg(zhand,leds,leds2);
  input zhand;
  output reg [0:6]leds,leds2;

always@(zhand) 
  case(zhand)
     0:
	  begin
			leds = 7'b0000001;
			leds2 = 7'b1111111;
	  end
     1:
		begin
			leds = 7'b1001111;
			leds2 = 7'b1111111;
		end
     2:
		begin
			leds = 7'b0010010;
			leds2 = 7'b1111111;
		end
     3:
		begin
			leds = 7'b0000110;
			leds2 = 7'b1111111;
		end
     4:
		begin
			leds = 7'b1001100;
			leds2 = 7'b1111111;
		end
     5:
		begin
			leds = 7'b0100100;
			leds2 = 7'b1111111;
		end
     6:
		begin
			leds = 7'b0100000;
			leds2 = 7'b1111111;
		end
	  7:
		begin
			leds = 7'b0001111;
			leds2 = 7'b1111111;
		end
     8:
		begin
			leds = 7'b0000000;
			leds2 = 7'b1111111;
		end
     9:
		begin
			leds = 7'b0001100;
			leds2 = 7'b1111111;
		end
     10:
		begin
			leds = 7'b0000001;
			leds2 = 7'b1001111;
		end
     11:
		begin
			leds = 7'b1001111;
			leds2 = 7'b1001111;
		end
     12:
		begin
			leds = 7'b0010010;
			leds2 = 7'b1001111;
		end
     13:
		begin
			leds = 7'b0000110;
			leds2 = 7'b1001111;
		end
	  14:
		begin
			leds = 7'b1001100;
			leds2 = 7'b1001111;
		end
	  15:
		begin
			leds = 7'b0100100;
			leds2 = 7'b1001111;
		end
	  16:
		begin
			leds = 7'b0100000;
			leds2 = 7'b1001111;
		end
	  17:
		begin
			leds = 7'b0001111;
			leds2 = 7'b1001111;
		end
     18:
		begin
			leds = 7'b0000000;
			leds2 = 7'b1001111;
		end
     19:
		begin
			leds = 7'b0001100;
			leds2 = 7'b1001111;
		end
	  20:
		begin
			leds = 7'b0000001;
			leds2 = 7'b0010010;
		end
	  21:
		begin
			leds = 7'b1001111;
			leds2 = 7'b0010010;
		end
  endcase  
endmodule
