module top(RGB_B,RGB_G,RGB_R, input clk);
    output logic  RGB_B, RGB_R, RGB_G;
    parameter PWM_INTERVAL = 1200000;
    int current_index = 0;

    logic color_one[6][3] = '{
        '{1'b1,1'b0,1'b0}, //creating red by assigning red to 1 green to 0 and blue to 0
        '{1'b0,1'b1,1'b0},//creating yellow by assigning red to 1 green to 1 and blue to 0
        '{1'b0,1'b1,1'b0},//creating green by assigning red to 0 green to 1 and blue to 0
        '{1'b0,1'b1,1'b1},//creating cyan by assigning red to 0 green to 1 and blue to 1
        '{1'b0,1'b0,1'b1},//creating blue by assigning red to 0 green to 0 and blue to 1
        '{1'b1,1'b0,1'b1}};//creating magenta by assigning red to 1 green to 0 and blue to 1

    always@(posedge clk) begin
        RGB_R <= color_one[current_index][0];
        RGB_G <= color_one[current_index][1];
        RGB_B <= color_one[current_index][2];
        current_index <= (current_index +1) % 6;
    end

endmodule
