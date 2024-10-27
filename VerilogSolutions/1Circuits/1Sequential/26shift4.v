/*
Build a 4-bit shift register (right shift), with asynchronous reset, synchronous load, and enable.

areset: Resets shift register to zero.
load: Loads shift register with data[3:0] instead of shifting.
ena: Shift right (q[3] becomes zero, q[0] is shifted out and disappears).
q: The contents of the shift register.
If both the load and ena inputs are asserted (1), the load input has higher priority.
*/



module top_module(
    input clk,
    input areset,
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            q <= 4'b0000;
        end
        else if (load) begin
            q <= data;
        end
        else if (ena) begin
            q <= {1'b0, q[3], q[2], q[1]};
        end
    end

endmodule


