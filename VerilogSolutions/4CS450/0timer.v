/*
Implement a timer that counts down for a given number of clock cycles, then asserts a signal to indicate that the given duration has elapsed. 
A good way to implement this is with a down-counter that asserts an output signal when the count becomes 0.

At each clock cycle:

If load = 1, load the internal counter with the 10-bit data, the number of clock cycles the timer should count before timing out. 
The counter can be loaded at any time, including when it is still counting and has not yet reached 0.
If load = 0, the internal counter should decrement by 1.
The output signal tc ("terminal count") indicates whether the internal counter has reached 0. Once the internal counter has reached 0, 
it should stay 0 (stop counting) until the counter is loaded again.

Below is an example of what happens when asking the timer to count for 3 cycles:
*/

module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);

    reg[9:0] counter;
    always @(posedge clk) begin
        counter <= (load) ? data : ((counter != 10'd0) ? counter - 10'd1 : 10'd0);
    end

    assign tc = (counter == 10'd0);

endmodule