module dual_latch_tb;
    reg clk;
    reg en;
    reg rst;

    wire gated_clk;
    dual_latch uut (
        .clk(clk),
        .en(en),
        .rst(rst),
        .gated_clk(gated_clk)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
       
        en = 0;
        rst = 1;
        #10 rst = 0;
        #10 en = 0;
        #20;
        #10 en = 1;
        #20;
        #10 en = 0;
        #10 en = 1;
        #10 en = 0;
        #10 en = 1;
        #20;
        #10 $finish;
    end
endmodule

