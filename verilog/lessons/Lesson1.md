# What is Verilog?

- a programming language (!!!) like C or C++
- a **hardware description language**. This is its most important use case as
  the language is quite verbose on its own, so if it couldn't turn into circuits
  magically, no one would use it.
- [a standard from IEEE](https://ieeexplore.ieee.org/document/10458102)

Hardware description languages, like Verilog (and by extension SystemVerilog)
are used to synthesize physical hardware components from logic statements.

A synthesizer/compiler/simulator that accepts Verilog will optimize your
statements for you and then layout physical hardware blocks in the most
efficient way possible (space wise, speed wise).

From now on, I will refer to SystemVerilog as it made the language more modern
and usable for circuit development.

SystemVerilog has three main ways to declare variable types:

- `reg`/`logic` (Like an opaque bit type, by default an unsigned integer or
  signed with the `signed` keyword)
- `wire` (Can be treated as physical wires, can only be read or assigned, but no
  values can be stored in them)

Most times you will be using `logic`. `reg` is logically equivalent but some
guides recommend `logic` over `reg`, no clue why, but I will agree as it looks
nicer.

SystemVerilog has operators you'd expect from other languages and expressions
are in the form of: `a + b` or abstractally `a op b` where op is `+`, `-`, `*`,
`/`, [etc](https://en.wikipedia.org/wiki/Verilog#Operators).

It also has assign operators like `a /= b` which is equivalent to `a = a / b`.

Seems nice right... But some things are not hardware synthesizable, such as
`$display("hello")`. `initial *` is similarly only available in the simulator.

## Simulation

To actually test and use Verilog, we will need a simulator. I use
[Verilator](https://verilator.org/guide/latest/install.html), and I recommend
you use it too.

Then, you can invoke Verilator like so:

```bash
verilator --exe verilog/decode.sv
```

It will check for syntax/synthesization errors and fail to compile if any are raised.

Then, you can run the resulting binary and it should simulate your logic and hopefully succeed.

## FPGA/Hardware

I haven't actually done any real hardware synthesis yet... I don't have an FPGA,
but you can use software like
[Adept 2](https://digilent.com/reference/software/adept/start?redirect=1) which
lets you debug Verilog code on real hardware.

### Examples

The best way to learn is with examples, so here's one! (SystemVerilog):

```verilog
module NAME (
	input wire clk,
	output logic[31:0] D,
);
	// 32 bits, raw/unsigned (cannot store negatives)
	logic[31:0] A;
	// 32 bits, signed (can store negatives via twos complement)
	logic signed [31:0] B;

	// 1024 32 bit (4 byte) values as memory
	logic [31:0] mem[1024];

	// assign will automatically reevaluate itself when any of its inputs change
	assign D = A + B;

	// only runs when clk is high
	// negedge is this but only runs when clk is low
	always@(posedge clk) begin
		// applied at end of scope (asynchronous)
		D <= A + B;

		// applied immediately (synchronous)
		D = A + B;

		// write to mem
		mem[0] <= A - B;
	end;
endmodule
```
