`ifndef VALIDATION_SV
    `define VALIDATION_SV
    
module validation
import mxv_pkg::*;
(
	input state_ctrl_t    state,
	input logic           ena,
	input data_hex_sipo_t frame,

	output logic          match
	output logic          repaet,
	output n_t            n, 
);


always @(*) begin
	case (state)
		IDLE:begin
		/*	if () begin
			end*/
		end
		SIZE:begin
		end
		START:begin
		end
		MATRIX:begin
		end
		FIFO_0:begin
		end
		FIFO_1:begin
		end
		FIFO_2:begin
		end
		FIFO_3:begin
		end
		FIFO_4:begin
		end
		FIFO_5:begin
		end
		FIFO_6:begin
		end
		FIFO_7:begin
		end
		FIFO_GUION:begin
		end
		END_FIFO_M:begin
		end
		END_MATRIX:begin
		end
		VECTOR:begin
		end
		FIFO_VECTOR:begin
		end
		END_VECTOR:begin
		end
		REPEAT:begin
		end
		CLEAN:begin
		end
		default:begin
		end
	endcase
end

	

endmodule 
`endif