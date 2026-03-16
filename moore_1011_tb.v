module moore_1011_tb;

reg clk,rst,x;
wire z;

moore_1011 uut(clk,rst,x,z);

initial
begin
    clk = 0;
    rst = 1;
    x = 0;

    #10 
    rst = 0;

    #10 
    x = 1;
    #10 
    x = 0;
    #10 
    x = 1;
    #10 
    x = 1;

    #10 
    x = 0;
    #10 
    x = 1;
    #10 
    x = 1;

    #50 
    $stop;
end

always #5 clk = ~clk;

endmodule