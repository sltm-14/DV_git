`ifndef CONTROL_SV
    `define CONTROL_SV

module control
import mxv_pkg::*;
(
//	input clk_wr,
	input clk,
	input rst,

	input logic       rcv,
	input data_dec_t  data,
	input logic       cc_ovf,
	input count_t     counter,

    output logic      ena_cv,
	output logic      ena_cc,
	output logic      push_result,
	output logic      pop_result,
	output logic      push_vector,
	output logic      pop_vector,
	output push_pop_t push_matrix,
	output push_pop_t pop_matrix,
	output val_t      val,
	output sltr_4_t   dmx_v_sltr,
    output sltr_2_t   mx_reg_sltr,

	output sltr_2_t   mx_a_sltr,
	output sltr_2_t   mx_b_sltr,
	output sltr_2_t   mx_c_sltr,
	output sltr_2_t   mx_d_sltr,
    output logic      sipo_ena,
	output logic      clear_val,
    output logic      clear_comm,

    output logic      ena_proc_a,
    output logic      ena_proc_b,
    output logic      ena_proc_c,
    output logic      ena_proc_d

);
	n_t            n          = 0;
    state_ctrl_t   state      = FE;
    command_t      command    = NO_COMMAND;
    frame_size_t   frame_size = 0;

    assign ena_cc = rcv;
    assign ena_cv = rcv && ( data != UNDERSCORE );
    assign val = data[VW-1:0];

    always@(posedge clk, negedge rst)begin
    	if (!rst)begin
    		state <= FE;
    	end
    	else begin
    		case(state)
    			FE:begin
    				if ( cc_ovf ) begin
    					if ( data == FE_FRAME ) begin
    						state <= UC_1;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= FE;
    				end
    			end

    			UC_1:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state <= FRAME_SIZE;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= UC_1;
    				end
    			end

    			FRAME_SIZE:begin
    				if ( cc_ovf ) begin
    					if (data > 0 && data < 65 ) begin
    						state <= UC_2;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= FRAME_SIZE;
    				end	
    			end

    			UC_2:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state <= COMMAND;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= UC_2;
    				end
    			end

    			COMMAND:begin
    				if ( cc_ovf ) begin
    					if ( data > 0 && data < 5 ) begin
    						state <= UC_3;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= COMMAND;
    				end	
    			end

    			UC_3:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						if (command == COMMAND_REPEAT || command == COMMAND_START )
    							state <= EF;
    						else if ( command == COMMAND_SIZE)
    							state <= SIZE;
    						else if ( command == COMMAND_MV && (frame_size == n*n) )
    							state <= FIFO_M0;
    						else if ( command == COMMAND_MV && frame_size == n )
    							state <= FIFO_V;
    						else 
    							state <= CLEAN;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= UC_3;
    				end
    			end

    			SIZE:begin
    				if ( cc_ovf ) begin
    					if ( data > 0 && data < 9 ) begin
    						state <= UC_SZ;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= SIZE;
    				end	
    			end

    			UC_SZ:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    						state <= EF;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= UC_SZ;
    				end
    			end

    			FIFO_M0:begin
    				if ( cc_ovf ) begin
    					if ( data >= 0 && data <= 9'hFF) begin
    						if ( (counter % n*2) == 0 )
                                state <= UC_M0;
                            else 
                                state <= FIFO_M1;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= FIFO_M0;
    				end	
    			end

    			UC_M0:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= UC_M0;
    				end
    			end

    			FIFO_M1:begin
                    if ( cc_ovf ) begin
                        if ( data >= 0 && data <= 9'hFF) begin
                            if ( (counter % n*2) == 0 )
                                state <= UC_M1;
                            else 
                                state <= FIFO_M2;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= FIFO_M1;
                    end 
    			end

    			UC_M1:begin
                    if ( rcv ) begin
                        if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= UC_M1;
                    end
    			end

    			FIFO_M2:begin
                    if ( cc_ovf ) begin
                        if ( data >= 0 && data <= 9'hFF) begin
                            if ( (counter % n*2) == 0 )
                                state <= UC_M2;
                            else 
                                state <= FIFO_M3;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= FIFO_M2;
                    end 
    			end

    			UC_M2:begin
                    if ( rcv ) begin
                        if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= UC_M2;
                    end
    			end

    			FIFO_M3:begin
                    if ( cc_ovf ) begin
                        if ( data >= 0 && data <= 9'hFF) begin
                            if ( (counter % n*2) == 0 )
                                state <= UC_M3;
                            else 
                                state <= FIFO_M4;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= FIFO_M3;
                    end 
    			end

    			UC_M3:begin
                    if ( rcv ) begin
                        if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= UC_M3;
                    end
    			end

    			FIFO_M4:begin
                    if ( cc_ovf ) begin
                        if ( data >= 0 && data <= 9'hFF) begin
                            if ( (counter % n*2) == 0 )
                                state <= UC_M4;
                            else 
                                state <= FIFO_M5;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= FIFO_M4;
                    end 
    			end

    			UC_M4:begin
                    if ( rcv ) begin
                        if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= UC_M4;
                    end
    			end

    			FIFO_M5:begin
                    if ( cc_ovf ) begin
                        if ( data >= 0 && data <= 9'hFF) begin
                            if ( (counter % n*2) == 0 )
                                state <= UC_M6;
                            else 
                                state <= FIFO_M5;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= FIFO_M6;
                    end 
    			end

    			UC_M5:begin
                    if ( rcv ) begin
                        if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= UC_M5;
                    end
    			end

    			FIFO_M6:begin
                    if ( cc_ovf ) begin
                        if ( data >= 0 && data <= 9'hFF) begin
                            if ( (counter % n*2) == 0 )
                                state <= UC_M7;
                            else 
                                state <= FIFO_M6;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= FIFO_M7;
                    end 
    			end

    			UC_M6:begin
                    if ( rcv ) begin
                        if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= UC_M6;
                    end
    			end

    			FIFO_M7:begin
                    if ( cc_ovf ) begin
                        if ( data >= 0 && data <= 9'hFF) begin
                            if ( (counter % n*2) == 0 )
                                state <= UC_M0;
                            else 
                                state <= FIFO_M7;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= FIFO_M7;
                    end 
    			end

    			UC_M7:begin
                    if ( rcv ) begin
                        if ( data == UNDERSCORE ) begin
                            if( counter >=  (n*n*2) )
                                state <= EF;
                            else 
                                state <= FIFO_M0;       
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= UC_M7;
                    end
    			end

    			FIFO_V:begin
    				if ( cc_ovf ) begin
    					if ( data >= 0 && data <= 9'hFF) begin
    						if (counter < n*2)
    							state <= FIFO_V;
    						else 
    							state <= UC_V;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= FIFO_V;
    				end	
    			end

    			UC_V:begin
    				if ( rcv ) begin
    					if ( data == UNDERSCORE ) begin
    							state <= EF;
    					end
    					else begin
    						state <= CLEAN;
    					end 
    				end
    				else begin
    					state <= UC_M7;
    				end
    			end

    			EF:begin
    				/*if ( command == COMMAND_MV && frame_size == n+1 )
    					state <= EF;*/
                    if ( cc_ovf ) begin
                        if ( data == EF_FRAME ) begin
                            state <= FE;
                        end
                        else begin
                            state <= CLEAN;
                        end 
                    end
                    else begin
                        state <= EF;
                    end

    			end

    			CLEAN: begin
    				state <= FE;
    			end
    		endcase
    	end
    end

    /* ----------------------------------------------------------------- */

    always@(*)begin
 	    case(state)
    		FE:begin
    			n            = n;           // n_t
				command      = command;     // command_t
			    frame_size   = frame_size;   // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_1:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FRAME_SIZE:begin
    			n            = n;          // n_t
			    command      = command;    // command_t
			    frame_size   = data; // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_2:begin
    		    n            = n;          // n_t
			    command      = command;    // command_t
			    frame_size   = frame_size; // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		COMMAND:begin
    			n            = n;             // n_t
			    command      = data;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_3:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 1;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		SIZE:begin
    			n            = data;    // n_t
			    command      = command;    // command_t
			    frame_size   = data;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_SZ:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M0:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

                

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0001;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
                push_matrix[0]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
                
    		end

    		UC_M0:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M1:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
                push_matrix  = 8'b0000_0000;    // push_pop_t
				push_matrix[1]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_M1:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M2:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
                push_matrix[2]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_M2:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr  = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M3:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
                push_matrix[3]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_M3:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M4:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
                push_matrix[4]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_M4:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M5:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
                push_matrix[5]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_M5:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M6:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
                push_matrix[6]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_M6:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_M7:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000; // sltr_8_t
				push_matrix  = 8'b0000_0000; // push_pop_t
                push_matrix[1]  = cc_ovf;    // push_pop_t
				pop_matrix   = 8'b0000_0000; // push_pop_t
                sipo_ena     = 0;            // logic
                clear_val    = 0;            // logic
                clear_comm   = 0;            // logic
    		end

    		UC_M7:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		FIFO_V:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = cc_ovf;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		UC_V:begin
    			n            = n;          // n_t
			    command      = command;    // command_t
			    frame_size   = frame_size; // frame_size_t


				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		EF:begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 0;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    		CLEAN: begin
    			n            = n;             // n_t
			    command      = command;       // command_t
			    frame_size   = frame_size;    // frame_size_t

				push_result  = 0;    // logic
				pop_result   = 0;    // logic
				push_vector  = 0;    // logic
				pop_vector   = 0;    // logic
                mx_reg_sltr = 0;
				mx_a_sltr   = 0;    // sltr_2_t
				mx_b_sltr   = 0;    // sltr_2_t
				mx_c_sltr   = 0;    // sltr_2_t
                mx_d_sltr   = 0;    // sltr_2_t
				dmx_v_sltr = 8'b0000_0000;    // sltr_8_t
				push_matrix  = 8'b0000_0000;    // push_pop_t
				pop_matrix   = 8'b0000_0000;    // push_pop_t
                sipo_ena     = 0;               // logic
                clear_val    = 0;               // logic
                clear_comm   = 1;               // logic
                ena_proc_a   = 0;
                ena_proc_b   = 0;
                ena_proc_c   = 0;
                ena_proc_d   = 0;
    		end

    	endcase
    end



endmodule
`endif