module mealy_1011_tb;

reg clk,rst,x;
wire z;

mealy_1011 uut (clk,rst,x,z);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    x = 0;

    #10 rst = 0;

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
    #10 
    x = 0;

    #50 $stop;
end

endmodule