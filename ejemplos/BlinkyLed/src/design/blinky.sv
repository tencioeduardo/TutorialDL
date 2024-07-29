module blinky_led
(
    input  logic         clk,
    output logic [5 : 0] led
);

localparam WAIT_TIME        = 13500000;
logic [5 : 0]  ledCounter   = 0;
logic [23 : 0] clockCounter = 0;

always_ff @ (posedge clk) begin
    clockCounter <= clockCounter + 1;
    if (clockCounter == WAIT_TIME) begin
        clockCounter <= 0;
        ledCounter   <= ledCounter + 1;
    end
end

assign led = ~ledCounter;
endmodule
