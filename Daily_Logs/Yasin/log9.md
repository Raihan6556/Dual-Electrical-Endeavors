# 10/24/2026

## Work

Finally got the simulator to work via:

```bash
verilator --cc --exe --build -j 0 sim_main.cpp top.sv
./obj_dir/Vtop
```

Prints garbage for now, I will eventually figure out how to give the sim its own
initial program.

TODO/Next steps:

- get the simulator working (kinda done)
- run ISA tests
-
  - implement privilege levels (Machine, Supervisor, User)
    - can be found at <https://github.com/riscv-software-src/riscv-tests>

### See also

No links for today.
