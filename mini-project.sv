module top(RGB_B,RGB_G,RGB_R, PWM_INTERVAL,clk);
    output logic  RGB_B, RGB_R, RGB_G;
    parameter PWM_INTERVAL = 1200;
    logic clk = 0;
    int color_one[3] = '{1,0,0};

    always@(posedge clk) begin
    assign RGB_R = color_one[0];
    end

endmodule
