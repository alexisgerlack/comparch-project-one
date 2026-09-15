module top(RGB_B,RGB_G,RGB_R, input clk);
    output logic  RGB_B, RGB_R, RGB_G; //RGB outputs
    // because the clock ticks at 12MHz we need to have out interval be every 12 million clock ticks
    parameter INTERVAL = 12000000;
    //index of the different colors in color_one 2d array
    int current_index = 0;
    //placeholder value to make it change once ever 12 million ticks
    int counter = 0;
    //color logic 2d array where the active low LED is represented by a binary value for on or off
    logic color_one[6][3] = '{
        '{1'b0,1'b1,1'b1},//creating red by assigning red-on green-off and blue-off
        '{1'b0,1'b0,1'b1},//creating yellow by assigning red-on green-on and blue-off
        '{1'b1,1'b0,1'b1},//creating green by assigning red-off green-on and blue-off
        '{1'b1,1'b0,1'b0},//creating cyan by assigning red-off greenv and blue-on
        '{1'b1,1'b1,1'b0},//creating blue by assigning red-off green-off and blue-on
        '{1'b0,1'b1,1'b0}};//creating magenta by assigning red-on green-off and blue-on
    //clock loop that only activates when the clock ticks 12 million times.
    //otherwise it adds one to the counter
    always@(posedge clk) begin
        if (counter == INTERVAL) begin
            RGB_R <= color_one[current_index][0];
            RGB_G <= color_one[current_index][1];
            RGB_B <= color_one[current_index][2];
            counter <=0;
            //index incramenter
            if (current_index == 5)
                current_index <= 0;
            else
                current_index <= current_index + 1;
        end
        else
            counter <= counter +1;
    end

endmodule
