module vga_sig_gen(input clk_27Mhz, input rst, output reg red, output reg blue, output reg green, output reg hsync, output reg vsync);

    wire clk_40MHz;

    reg[10:0] horizontal_counter;
    reg[9:0] vertical_counter;

    Gowin_rPLL pll(.clkout(clk_40MHz), .clkin(clk_27Mhz));
    
    always @(posedge clk_40MHz or negedge rst) begin
        if (!rst) begin //Reset
            horizontal_counter <= 0;
            vertical_counter <= 0;
        end
        else begin //Output signals
            
            if (horizontal_counter < 800 && vertical_counter < 600) begin
                //Output video
                red <= vertical_counter[4];
                green <= vertical_counter[5];
                blue <= vertical_counter[6];
            end
            else begin
                //Do not output video
                red <= 1'bz;
                green <= 1'bz;
                blue <= 1'bz;
            end

            hsync <= !(horizontal_counter >= 840 && horizontal_counter < 968);
            vsync <= !(vertical_counter >= 601 && vertical_counter < 605);

            //Increment counters
            horizontal_counter <= horizontal_counter + 1'b1;
            if (horizontal_counter >= 1056) begin
                horizontal_counter <= 0;
                vertical_counter <= vertical_counter +1;
                if (vertical_counter >= 628) begin
                    vertical_counter <= 0;
                end
            end
        end
    end

endmodule