// Copyright (c) 2026 techs-sus and Contributors

module negation(
	input wire a,
	output reg b
);
	always @* begin
		b = ~a;
	end
endmodule
