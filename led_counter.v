module Counter #(
    parameter integer CLK_FREQ = 10 
) (
    input  wire clk,
    input  wire rst_n,
    output reg [7:0] leds
);
    localparam integer ciclos_incremento = CLK_FREQ / 2;
    localparam integer largura_contador = $clog2(ciclos_incremento + 1);

    reg [largura_contador-1:0] counter;

    always @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
            leds <= 0;
        end else begin
            if (counter == ciclos_incremento - 1) begin
                counter <= 0;
                leds <= leds + 1;
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
