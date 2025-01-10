# Default CIRCUIT
CIRCUIT ?= main

# Paths and variables
# CIRCUIT_DIR = dataflow
CIRCUIT_DIR = behavior
# CIRCUIT_DIR = structural

TB = $(CIRCUIT)_tb
BUILD_DIR = build
TESTBENCH_DIR = testbench

# List of files requiring the -fsynopsys flag
FSYNOPSYS_FILES = DIG_Counter.vhdl

# Predefined dependencies for specific circuits
DEPENDENCIES_main = DEMUX_GATE_1.vhdl DIG_Counter.vhdl RhCount.vhdl \
                    MUX_GATE_BUS_1.vhdl Dff.vhdl buffer4bit.vhdl \
                    buffer8bit.vhdl isMax.vhdl DECODER_4.vhdl \
                    EEPROM.vhdl adder2bit.vhdl adder4bit.vhdl

DEPENDENCIES_adder4bit = adder2bit.vhdl
DEPENDENCIES_RhCount = DIG_Counter.vhdl
DEPENDENCIES_buffer4bit = MUX_GATE_BUS_1.vhdl Dff.vhdl
DEPENDENCIES_buffer8bit = MUX_GATE_BUS_1.vhdl Dff.vhdl

DEPENDENCIES_EEPROM = DECODER_4.vhdl MUX_GATE_BUS_1.vhdl Dff.vhdl

# General pattern to resolve dependencies
DEPENDENCIES = $(addprefix $(CIRCUIT_DIR)/, $(DEPENDENCIES_$(CIRCUIT)))

# Determine if -fsynopsys is needed
FSYNOPSYS_FLAG = $(if $(filter $(CIRCUIT) $(DEPENDENCIES_$(CIRCUIT)), $(FSYNOPSYS_FILES)), -fsynopsys)

# Ensure the build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Ensure the testbench directory exists
$(TESTBENCH_DIR):
	mkdir -p $(TESTBENCH_DIR)

# Ensure the dataflow directory exists
$(CIRCUIT_DIR):
	mkdir -p $(CIRCUIT_DIR)

# Check for testbench file, create placeholder if not found
check_testbench: $(TESTBENCH_DIR)
	@if [ ! -f "$(TESTBENCH_DIR)/$(TB).vhdl" ]; then \
		echo "Error: Testbench file '$(TB).vhdl' not found in $(TESTBENCH_DIR)."; \
		exit 1; \
	fi

# Compile dependencies and circuit files
compile: $(BUILD_DIR) $(CIRCUIT_DIR) check_testbench
	@echo "\033[0;34mCompiling dependencies...\033[0m"
	@if [ -z "$(DEPENDENCIES)" ]; then \
		echo "\033[0;33mNo dependencies found.\033[0m"; \
	else \
		for file in $(DEPENDENCIES); do \
			echo "ghdl -a --workdir=$(BUILD_DIR) $(FSYNOPSYS_FLAG) $$file"; \
			ghdl -a --workdir=$(BUILD_DIR) $(FSYNOPSYS_FLAG) $$file; \
		done; \
	fi
	@echo "\033[0;34mCompiling $(CIRCUIT).vhdl ...\033[0m"
	ghdl -a --workdir=$(BUILD_DIR) $(FSYNOPSYS_FLAG) $(CIRCUIT_DIR)/$(CIRCUIT).vhdl;
	ghdl -a --workdir=$(BUILD_DIR) $(FSYNOPSYS_FLAG) $(TESTBENCH_DIR)/$(TB).vhdl;

# Elaborate the testbench
elaborate: compile
	@echo "\033[0;34mElaborating ...\033[0m"
	ghdl -e --workdir=$(BUILD_DIR) $(FSYNOPSYS_FLAG) $(TB)

# Simulate the testbench
simulate: elaborate
	@echo "\033[0;34mSimulating ...\033[0m"
	ghdl -r --workdir=$(BUILD_DIR) $(FSYNOPSYS_FLAG) $(TB) --vcd=$(BUILD_DIR)/$(TB).vcd

# Clean build directory
clean:
	rm -rf $(BUILD_DIR)

# Run all steps for the circuit
run: clean compile elaborate simulate
	@echo "\033[0;32mRun Finished\033[0m"

# Help target to display usage manual
help:
	@echo "Usage: make <target> [CIRCUIT=<circuit_name>]"
	@echo
	@echo "Targets:"
	@echo "  compile       Compile the specified circuit and dependencies."
	@echo "  elaborate     Elaborate the testbench for the specified circuit."
	@echo "  simulate      Simulate the testbench for the specified circuit."
	@echo "  run           Clean, compile, elaborate, and simulate the circuit."
	@echo "  clean         Remove build directory and temporary files."
	@echo "  help          Display this help message."
	@echo
	@echo "Options:"
	@echo "  CIRCUIT       Specify the circuit to process (default: main)."
	@echo "                Example: make run CIRCUIT=RhCount"
	@echo
	@echo "Note: "
	@echo "                The testbench file must be located in the 'testbench' directory."
	@echo "                All circuit files are located in the 'dataflow' directory."