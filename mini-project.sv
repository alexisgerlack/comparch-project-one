module top(RGB_B,RGB_G,RGB_R, input clk);
    output logic  RGB_B, RGB_R, RGB_G;
    // because the clock ticks at 12MHz we need to have out interval be every 12 million clock ticks
    parameter INTERVAL = 12000000;
    int current_index = 0;
    int counter = 0;

    logic color_one[6][3] = '{
        '{1'b0,1'b1,1'b1}, //creating red by assigning red-on green-off and blue-off
        '{1'b0,1'b0,1'b1},//creating yellow by assigning red-on green-on and blue-off
        '{1'b1,1'b0,1'b1},//creating green by assigning red-off green-on and blue-off
        '{1'b1,1'b0,1'b0},//creating cyan by assigning red-off greenv and blue-on
        '{1'b1,1'b1,1'b0},//creating blue by assigning red-off green-off and blue-on
        '{1'b0,1'b1,1'b0}};//creating magenta by assigning red-on green-off and blue-on

    always@(posedge clk) begin
        if (counter == INTERVAL) begin
            RGB_R <= color_one[current_index][0];
            RGB_G <= color_one[current_index][1];
            RGB_B <= color_one[current_index][2];
            counter <=0;
            if (current_index == 5)
                current_index <= 0;
            else
                current_index <= current_index + 1;
        end
        else
            counter <= counter +1;
    end

endmodule
