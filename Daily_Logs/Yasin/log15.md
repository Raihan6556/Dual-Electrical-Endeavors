# 10/30/2026

## Work

Fixed the Xunlong Orange Pi 5... I don't really know U-Boot by heart so I asked
an LLM to fix a patch off of my initial implementation.

Basically I got a bad board revision that switched a GPIO power pin for the NVME
drive. It is fixable in software and someone already made a patch but their
patch was no longer available, which is why I asked the LLM to help me recreate
it. I don't really like asking any LLM's for help but I have free tokens
w/OpenCode so I might as well.

Anyways, this is relevant because that little board is actually my Samba server
so this should let me return to maximal operating efficiency.

Also, the reason I had to do all of this is because I wanted to update the
kernel + patch a bunch of security vulnerabilities. I was using a bad image that
was archived/deprecated a few months ago, and I have been wanting to switch to
Armbian anyway. Armbian supports unattended upgrades too, which is great for me,
so I can forget about patching everyday.

On a good note, I don't need an SD card to boot anymore! U-Boot can now boot
directly from the NVME which lets me actually restart the board and have it come
back online without me tinkering with it. But I did lose my ~120 or 180 day
uptime, so thats a bummer.

Anyways this whole thing taught me alot about embedded programming. Device tree
overlays, device tree binary, etc. We will likely need to write a little bit of
device tree to let our little chip have input and output. Linux requires a
device tree on non arm64 CPUs (via a pointer in a register) to my knowledge.

And we will need a bootloader too! My little board enjoys only U-Boot but can
also support a regular UEFI implementation, its just more niche.

TODO/Next steps:

- get the simulator working (kinda done)
- run ISA tests
-
  - implement privilege levels (Machine, Supervisor, User)
    - can be found at <https://github.com/riscv-software-src/riscv-tests>
- design a board + case for the FPGA/silicon chip

### See also

- <https://github.com/techs-sus/build/commit/e8f5ffe3345a998889f17e055a917c1551a59015.patch>
- <https://github.com/edk2-porting/edk2-rk3588>
