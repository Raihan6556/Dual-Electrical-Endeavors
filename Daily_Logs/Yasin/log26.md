# 11/10/2026

## Work

From the website:

> WebAssembly (abbreviated Wasm) is a binary instruction format for a
> stack-based virtual machine. Wasm is designed as a portable compilation target
> for programming languages, enabling deployment on the web for client and
> server applications.

What does that mean?

Binary instruction format: Just means instructions are in pure binary and bits.

Stack-based virtual machine: This means a Virtual Machine that depends on a
stack. Like a turing machine.

Portable compilation target: This means that other languages can compile to
WebAssembly. C, C++, Rust, Go, etc. are good examples.

Deployment on the web: Like hosting it on the web and it working.

Client and server: Client being a home user's computer and server being a server
in the Cloud (where the Cloud is Amazon's servers, Google's servers, etc.)

So... how does it work in the browser?

The browser first streams/loads HTML when fetching the web page. It loads CSS,
Javascript, etc. Javascript can then call a function to load WebAssembly code.

After the Javascript call to load WebAssembly, the browser will verify the
WebAssembly binary (extension is .wasm) is safe to run in one O(n) linear pass.

Then, the browser will have two options:

- immediately compile the WASM to the host architecture (your laptop's
  architecture) -> code is ran later after the initial compile step, browsers
  may choose to fallback to interpreter
- immediately start running the WASM via a bytecode interpreter (like a loop
  that will run it one by one) -> code is running

Some modern browsers do both, by starting the interpreter and choosing to
compile some hot (as in frequently used) procedures.

Compilers also have options, like optimization levels. Ideally higher
optimization levels would be fast to compile and fast to run, but thats not the
reality. The more optimizations you want at compile time, the more time you will
need to wait for the code to be compiled. Most start at optimization zero, which
means no optimizations, but this is somewhat misleading as optimization 0 (O0)
code will likely be twice or thrice as fast as interpreted code.

A similar approach is used for Javascript running, but most browsers start
Javascript with an interpreter and then start compiling "hot"
functions/procedures. This is due to Javascript not having a concrete type
system, and each variable can be ANY value instead of a known value. Imagine a
variable could be a string, or a number or a BigInt or a null or an undefined
(those are two different things), etc. Javascript compilers guess the correct
types and if they are wrong, sometimes they will bug out and create
vulnerabilities or they will correctly fallback to interpreted execution.

This is also why WASM **SHOULD** be faster than Javascript if it's done
correctly. WASM has concrete types, meaning that a variable will ALWAYS be one
type or a list of KNOWN types, allowing the compiler to aggressively optimize
the code.

Why is this relevant? WebAssembly basically lets you port desktop code to code
on the web. A good example is Figma. Figma is actually written in C++ and is
compiled through "emscripten" (C++ to JS bridge basically) to WebAssembly. So
when you use Figma, it doesn't use Javascript for the editor, it instead uses a
C++ backed editor running in WebAssembly in your broswer.

This is also relevant to what I was talking about yesterday, as FreeCAD could be
ported to the web in a similar fashion with enough work.

### See also

- <https://webassembly.org/>
- <https://www.figma.com/blog/building-a-professional-design-tool-on-the-web/>
  (old article, asm.js is wasm's first iteration basically)
