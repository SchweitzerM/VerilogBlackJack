module moore (Clock,Resetn,enter,userpass,change,z,storedpass,OPEN,ALARM,NEW);
	input Clock,Resetn,enter,change;
	input [3:0] userpass;
	output reg [3:0] storedpass;
	reg [3:0] def;
	output z;
	reg [2:0] y,Y;
	output reg ALARM,OPEN,NEW;
	parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101, G=3'b110, H=3'b111;
	
	always@(enter,change)
		case(y)
			A: if (enter)//either open or go to 2nd try
					begin
						if(z)
							begin
								OPEN<=1;
								Y = C;
							end
						else 
							begin
								Y = B;
								ALARM<=0;
							end
					 end
				else if (change)
					begin
						Y=E;
					end
						
			B: if (enter)//either open or go to alarm
					begin
						if (z)
							begin 
								OPEN<=1;
								Y=C;
							end
						else
							begin
								Y=D;
								ALARM<=0;
							end
					end
						
			C:if (enter) //display open
						begin
							OPEN<=0;
						   Y=A;
						end

			D:  begin
					ALARM<=1;
					NEW<=0;
				end
			E: if (change)//if Z then change password else give 2nd try
					begin
						if (z) 
							begin
								NEW<=1;
								Y=G;
							end
						else 					
							begin
								Y=F;
								NEW<=0;
							end;
					end
						
			F: if (change)//if Z change password else ALARM
					begin
						if (z) 
							begin
								NEW<=1;
								Y=G;
							end
						else 
							begin
								Y=D;
							end
					end
					
			G: begin
					if (change || enter) storedpass<=userpass;

				end
			
			H: if (Resetn==0)
							begin
								storedpass<=4'b0110;
								ALARM<=0;
								Y=A;
							end

		endcase
	
	always @(negedge Resetn, posedge Clock)
		begin
			if (Resetn==0) 
					begin
						y<=H;
					end
			else y<=Y;
		end
		
		
	assign z=(userpass==storedpass);

endmodule
