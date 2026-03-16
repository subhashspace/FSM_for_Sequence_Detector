module mealy_1011(clk,rst,x,z);
    input clk,rst,x;
    output reg z;
reg [1:0] state, next_state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

always @(posedge clk)
begin
    if(rst)
        state <= S0;
    else
        state <= next_state;
end

always @(*)
begin
    case(state)

        S0:
        begin
            if(x)
                next_state = S1;
            else
                next_state = S0;
            z = 0;
        end

        S1:
        begin
            if(x)
                next_state = S1;
            else
                next_state = S2;
            z = 0;
        end

        S2:
        begin
            if(x)
                next_state = S3;
            else
                next_state = S0;
            z = 0;
        end

        S3:
        begin
            if(x)
            begin
                next_state = S1;
                z = 1;  
            end
            else
            begin
                next_state = S2;
                z = 0;
            end
        end

        default:
        begin
            next_state = S0;
            z = 0;
        end

    endcase
end

endmodule