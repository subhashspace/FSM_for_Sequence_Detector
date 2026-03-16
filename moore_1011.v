module moore_1011 (clk,rst,x,z);

    input clk,rst,x;
    output reg z;

reg [2:0] state;
reg [2:0] next_state;

reg [3:0] rom [0:31];  

integer i;

initial
begin
    for(i = 0; i < 32; i = i + 1)
        rom[i] = $random;
end

wire [4:0] addr;
assign addr = {state, x};

always @(*)
begin
    {next_state, z} = rom[addr];
end

always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= 3'b000;
    else
        state <= next_state;
end

endmodule