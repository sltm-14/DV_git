`ifndef CONTROL_SV
    `define CONTROL_SV

module control
import mxv_pkg::*;
(
//	input clk_wr,
	input clk,
	input rst,

	input logic      rcv,
	input data_dec_t data,
	input logic      cv_ovf,
	input logic      cc_ovf,
	input count_t    counter,


	output 
);
	n_t          n;
    state_ctrl_t state;
    command_t    command;
    frame_size_t frame_size;

    always@(posedge clk, negedge rst)begin
    	if (!rst)begin
    		state = IDLE;
    	end
    	else begin
    		case(state)
    			FE:begin
    				if ( cc_ovf ) begin
    					if ( data == FE ) begin
    						state = UC_1;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = FE;
    				end
    			end

    			UC_1:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FRAME_SIZE;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_1;
    				end
    			end

    			FRAME_SIZE:begin
    				if ( cc_ovf ) begin
    					if ( data == FE ) begin
    						state = UC_2;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = FRAME_SIZE;
    				end	
    			end

    			UC_2:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = COMMAND;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_2;
    				end
    			end

    			COMMAND:begin
    				if ( cc_ovf ) begin
    					if ( data > 0 && data < 5 ) begin
    						state = UC_3;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = COMMAND;
    				end	
    			end

    			UC_3:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						if (command == COMMAND_REPEAT || command == COMMAND_START )
    							state = EF;
    						else if ( command == COMMAND_SIZE)
    							state = SIZE;
    						else if ( command == COMMAND_MV && (frame_size == n*n) )
    							state = FIFO_0;
    						else if ( frame_size == n+1 )
    							state = FIFO_V;
    						else 
    							state = CLEAN;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_3;
    				end
    			end

    			SIZE:begin
    				if ( cc_ovf ) begin
    					if ( data > 0 && data < 9 ) begin
    						state = UC_SZ;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = SIZE;
    				end	
    			end

    			UC_SZ:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = EF;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_SZ;
    				end
    			end

    			FIFO_M0:begin
    				if ( cc_ovf ) begin
    					if ( data == FE ) begin
    						state = UC_2;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = FRAME_SIZE;
    				end	
    			end

    			UC_M0:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FIFO_M1;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M0;
    				end
    			end

    			FIFO_M1:begin
    			end

    			UC_M1:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FIFO_M2;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M1;
    				end
    			end

    			FIFO_M2:begin
    			end

    			UC_M2:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FIFO_M3;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M2;
    				end
    			end

    			FIFO_M3:begin
    				
    			end

    			UC_M3:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FIFO_M4;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M3;
    				end
    			end

    			FIFO_M4:begin
    			end

    			UC_M4:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FIFO_M5;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M4;
    				end
    			end

    			FIFO_M5:begin
    			end

    			UC_M5:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FIFO_M6;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M5;
    				end
    			end

    			FIFO_M6:begin
    			end

    			UC_M6:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state = FIFO_M7;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M6;
    				end
    			end

    			FIFO_M7:begin
    			end

    			UC_M7:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						if( counter == ( (n*n) + 1 + n ) )
    							state = EF;
    						else 
    							state = FIFO_M0;
    					end
    					else begin
    						state = CLEAN;
    					end 
    				end
    				else begin
    					state = UC_M7;
    				end
    			end

    			FIFO_V:begin
    			end

    			UC_V:begin
    			end

    			EF:begin
    			end

    			REPEAT: begin
    				state = FE;
    			end

    			CLEAN: begin
    				state = FE;
    			end
    		endcase
    	end
    end


    always@(*)begin
 	    case(state)
    		FE:begin

    		end

    		UC_1:begin

    		end

    		FRAME_SIZE:begin

    		end

    		UC_2:begin
    	
    		end

    		COMMAND:begin
    		
    		end

    		UC_3:begin
    		
    		end

    		SIZA:begin
    		
    		end

    		UC_SZ:begin
    		
    		end

    		FIFO_M0:begin
    		
    		end

    		UC_M0:begin
    		
    		end

    		FIFO_M1:begin
    		
    		end

    		UC_M1:begin
    		
    		end

    		FIFO_M2:begin
    		
    		end

    		UC_M2:begin
    		
    		end

    		FIFO_M3:begin
    		
    		end

    		UC_M3:begin
    		
    		end

    		FIFO_M4:begin
    		
    		end

    		UC_M4:begin
    		
    		end

    		FIFO_M5:begin
    		
    		end

    		UC_M5:begin
    		
    		end

    		FIFO_M6:begin
    		
    		end

    		UC_M6:begin
    		
    		end

    		FIFO_M7:begin
    		
    		end

    		UC_M7:begin
    		
    		end

    		FIFO_V:begin
    		
    		end

    		UC_V:begin
    		
    		end

    		EF:begin
    		
    		end

    		REPEAT: begin

   			end

    		CLEAN: begin

    		end

    	endcase
    end



endmodule
`endif