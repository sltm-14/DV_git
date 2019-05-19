module debouncer(
    input clk,
    input pb,  

    output reg pb_state,
    output pb_down,  
    output pb_up   
);


reg pb_sync_0;  always @(posedge clk) pb_sync_0 <= ~pb;  
reg pb_sync_1;  always @(posedge clk) pb_sync_1 <= pb_sync_0;


reg [15:0] pb_cnt;



wire pb_idle = (pb_state==pb_sync_1);
wire pb_cnt_max = &pb_cnt;	

always @(posedge clk)
if(pb_idle)
    pb_cnt <= 0;  
else
begin
    pb_cnt <= pb_cnt + 16'd1;  
    if(pb_cnt_max) pb_state <= ~pb_state;  
end

assign pb_down = ~pb_idle & pb_cnt_max & ~pb_state;
assign pb_up   = ~pb_idle & pb_cnt_max &  pb_state;
endmodule