## IMPORTANT NOTE

According to the course requirement, one should use behavioral description to write each block first, then use structural description to put these block together. However, since each block may contain subcircuits, we make the claim below:

This folder contains *mainly* the behavioral description of each block. However, since each block maybe contain other subcircuits. Therefore, in this case we will use behavioral method to realize those **subcircuits** first, then use structural description to realize that block, which is far easier to accomplish.

For example, `Dff.vhdl` is a subcircuit for `buffer4bit.vhdl`. So we use behavioral description to write `Dff.vhdl` and then use structural description to write `buffer4bit.vhdl`.

## USAGE

### Toolchain Installation

First ensure you have installed the full compilation chain, if not, refer to [here](https://marcobisky.github.io/p/rtl-analysis-on-macos-under-300mb/)

### Specify Circuit Folder

Go to `Makefile`, uncomment this line:

```Makefile
CIRCUIT_DIR = behavior
```

Do NOT change other lines!!

### Test Each Block

You can run the following command to seek help:

```zsh
make help
```

All testbench files are placed inside the folder `testbench`. For example, if you want to see the simulation result of `adder2bit`, then run:

```zsh
make run CIRCUIT=adder2bit
```

Note that you cannot simulate a circuit if it does not appear in the `testbench` folder!!