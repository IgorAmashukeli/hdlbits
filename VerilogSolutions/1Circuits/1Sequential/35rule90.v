/*
Rule 90 is a one-dimensional cellular automaton with interesting properties.

The rules are simple. There is a one-dimensional array of cells (on or off). 
At each time step, the next state of each cell is the XOR of the cell's two current neighbours. 
A more verbose way of expressing this rule is the following table, where a cell's next state is a function of itself and its two neighbours:


Left	Center	Right	Center's next state
1	1	1	0
1	1	0	1
1	0	1	0
1	0	0	1
0	1	1	1
0	1	0	0
0	0	1	1
0	0	0	0
(The name "Rule 90" comes from reading the "next state" column: 01011010 is decimal 90.)


In this circuit, create a 512-cell system (q[511:0]), and advance by one time step each clock cycle. 
The load input indicates the state of the system should be loaded with data[511:0]. 
Assume the boundaries (q[-1] and q[512]) are both zero (off).

*/



module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

    dff_l dffs[511:0] (
        .clk({512{clk}}),
        .load({512{load}}),
        .left({1'b0, q[511:1]}),
        .right({q[510:0], 1'b0}),
        .d(data),
        .q(q)
    );

endmodule


module dff_l(
    input clk,
    input load,
    input left,
    input right,
    input d,
    output q
);

    always @(posedge clk) begin
        q <= (load) ? d : left ^ right;
    end

endmodule