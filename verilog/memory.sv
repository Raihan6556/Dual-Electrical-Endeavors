// TODO: when we know what fpga we will use we can write an actual ddr3 controller
// TODO: this is still good as it lets us abstract away rv32i reads/writes

module memory #(
    parameter int BYTES = 32768,
    parameter int ADDRESS_BITS = 32,
    parameter int DATA_WIDTH = 32
) (
    input wire clk,
    input logic [ADDRESS_BITS-1:0] addr,
    inout logic [DATA_WIDTH-1:0] data,

    input write,
    input read,
    input chip_select,
    input output_enabled
);
  logic [DATA_WIDTH-1:0] mem[BYTES];

  always @(posedge clk) begin
    if (chip_select & write) mem[addr] <= data;
    if (chip_select & read & output_enabled & !write) data <= mem[addr];
    data = 'hz;
  end

endmodule
