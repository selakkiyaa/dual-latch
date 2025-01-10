module dual_latch (
    input wire clk, 
    input wire en,
    input wire rst,
    output wire gated_clk
);
    reg latch1, latch2;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            latch1 <= 1'b0;
        end else begin
            latch1 <= en;
        end
    end

    always @(negedge clk or posedge rst) begin
        if (rst) begin
            latch2 <= 1'b0;
        end else begin
            latch2 <= latch1;
        end
    end

    assign gated_clk = clk & latch2;
endmodule

