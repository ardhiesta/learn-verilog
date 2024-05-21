module tb_counter;
    reg clk;
    reg rstn;
    wire [3:0] out;

    // instantiate counter design
    counter c0(.clk (clk),
        .rstn (rstn),
        .out (out)
    );

    // generate clock
    always #5 clk = ~clk;

    initial begin
        clk <= 0;
        rstn <= 0;

        $monitor ("[$monitor] time=%0t rstn=0x%0b clk=0x%0b out=0x%0b", $time, rstn, clk, out); 

        #20 rstn <= 1; // time ke-20 nilai rstn = 1
        #80 rstn <= 0; // time ke (20+80), rstn = 0
        #50 rstn <= 1; // time ke (20+80+50), rstn = 1

        #20 $finish;
    end
endmodule