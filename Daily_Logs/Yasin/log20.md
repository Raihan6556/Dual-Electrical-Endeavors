# 11/04/2026

## Work

Today, we talked about ternary and I wasn't quite able to explain why it's so
weird.

In binary, we have zeros, and ones. Immediately I think of low and high, off and
on, dead and alive.

This allows us to model numbers quite easily:

```
|128|64|32|16|8|4|2|1|
01010000
In base 10, this is 80.
```

This is called a byte, and it is the building block of larger memory types, like
shorts, two bytes, longs, four bytes, and long longs, 8 bytes. These all have
varying levels of numeric precision, and for floating point numbers, we can use
IEEE-754 which is already made for us.

Signed numbers notably require a sign bit, via twos complement.

In ternary, we have negative one, zero, positive one, known as a trit. A ternary
byte is called a tryte and is either 6 trits or 9, most modern attempts
preferring 9.

As Wikipedia puts it:

> ternary offers a convenient way to represent 1/3 similar to senary (as opposed
> to its cumbersome representation as an infinite string of recurring digits in
> decimal); but a major drawback is that, in turn, ternary does not offer a
> finite representation for 1/2 (nor for 1/4, 1/8, etc.)

But, there are some benefits:

> Most notably, balanced ternary eliminates the need for an explicit sign bit,
> as the sign of a number is inherently determined by its most significant
> non-zero digit. Furthermore, mathematical negation is highly efficient,
> requiring only a simple entrywise inversion of symbols (swapping +1s and −1s)
> rather than the complex two's complement operations required by binary
> hardware.

So it would be a cool project, but the advantages are (likely) equal to the
disadvantages.

About the WebAssembly in hardware idea, WebAssembly is like machine code that is
recompiled by your browser to run really fast. It was designed to be safe to run
in the web, which means it has great sandboxing guarantees. For now though, we
should stick to RISC-V.

### See also

- <https://en.wikipedia.org/wiki/IEEE_754>
- <https://en.wikipedia.org/wiki/Ternary_numeral_system#Comparison_to_other_bases>
- <https://en.wikipedia.org/wiki/Ternary_computer>
- <https://webassembly.org/docs/security/>
