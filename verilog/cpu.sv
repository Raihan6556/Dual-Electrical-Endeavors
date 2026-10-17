// Copyright (c) 2026 techs-sus and Contributors

// how should we design the memory?
module cpu ();
  reg [31:0] registers[32];
  reg [31:0] pc;
  wire reset;

  // when reset is high, reset all registers to initial state
  always @(posedge reset) begin
    // TODO: figure out where pc should actually be on a reset
    pc = 0;
    registers = {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };
  end

  // when reset is low, cpu should be running
  always @(negedge reset) begin
    // always hardwire x0 to 0 on every clock cycle
    registers[0] = 0;
  end
endmodule
