// how should we design the memory?
module top (
	input wire clk,
	input wire reset
);
  logic signed [31:0] registers[32];
  logic [31:0] pc;
	logic [31:0] memory[1024];

	logic [31:0] instruction;

	decode u_decode (
		.instruction (instruction),
		.registers (registers),
		.pc (pc)
	);

  // when reset is high, reset all registers to initial state
  always @(posedge reset) begin
    // TODO: figure out where pc should actually be on a reset
    pc = 0;

    registers = {
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };

		instruction = 0;
		memory = 0;
  end

  // when reset is low, cpu should be running
  always @(clk) begin
		if (!reset) begin
			// always hardwire x0 to 0 on every clock cycle
			registers[0] = 0;
			instruction = memory[pc];

			// $display(pc);
		end
	end
endmodule
