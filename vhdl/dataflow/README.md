## IMPORTANT NOTE

According to the course requirement, dataflow description is not part of the work. However, I put a lot of effort to build the actual circuit in **Digital**, so I write the dataflow version of (*almost*) each block. However, not all of the files in this folder is in dataflow version. Some blocks (such as the 4-bit decoder `DECODER_4.vhdl`) have systematic way to design and therefore we think they are a little bit tedious to write them again, so you may see some files *not* in the standard style of dataflow version.


## USAGE

### Toolchain Installation

First ensure you have installed the full compilation chain, if not, refer to [here](https://marcobisky.github.io/p/rtl-analysis-on-macos-under-300mb/)

### Specify Circuit Folder

Go to `Makefile`, uncomment this line:

```Makefile
CIRCUIT_DIR = dataflow
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

### Test the Whole System

We also include the `main.vhdl` in this dataflow description (which is also included in the structural description but not included in the behavioral description). Run:

```zsh
make run
```

to test if the whole generalized adder works properly.