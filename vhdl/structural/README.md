## IMPORTANT NOTE

This folder contain exactly the same thing as in `behavior` folder except we add a `main.vhdl` file, which uses structural description to put all blocks together. The reason is for convenient compilation.

## USAGE

You should already simulated all blocks in `behavior` folder. Therefore now in this folder, the only thing to do is to check whether the `main.vhdl` works, i.e., if the whole system works. 


### Specify Circuit Folder

Go to `Makefile`, uncomment this line:

```Makefile
CIRCUIT_DIR = structural
```

Do NOT change other lines!!

### Test Each Block

You can run the following command to seek help:

```zsh
make help
```

Then run the following command to see the final simulation result for the whole system:

```zsh
make run
```

which is equivalent to:

```zsh
make run CIRCUIT=main
```