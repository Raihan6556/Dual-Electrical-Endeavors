# 10/23/2026

## Work

Moved lesson1 to verilog/lessons/*

Should tell him about Obsidian today... Would make this much, much easier, and
more fun...

Finally learned what a sign-extension even is... It's just after all the
immediate bits are reconstructed, reinterpret the bits as their signed variant.
For example, a u20 (U immediate) would become an i20 by marking the imm_u as
signed. In verilog it's literally just $signed(T) where T is an expression, or
just declare the variable as signed. Looks like I understood most of it, and
there was only one place I had to add the signed keyword.

Features/fixes:

- srai should use >>> as its an arithmetic shift
- sll
- sltu
- xor
- srl
- sra
- or
- and

TODO/Next steps:

- get the simulator working
- run ISA tests
-
  - implement privilege levels (Machine, Supervisor, User)
    - can be found at <https://github.com/riscv-software-src/riscv-tests>

### See also

Obsidian guides:

- <https://www.youtube.com/watch?v=3ccktMJ1YHI> (15 minute video, start with
  this)
- <https://www.youtube.com/watch?v=WqKluXIra70> (2 hour video, watch if ur
  interested)

Also related, lets you generate websites from Markdown:
<https://quartz.jzhao.xyz/>

Like Obsidian, but in Neovim: <https://github.com/obsidian-nvim/obsidian.nvim>
