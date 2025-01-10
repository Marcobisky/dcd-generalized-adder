LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY main_tb IS
END main_tb;

ARCHITECTURE behavior OF main_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT main
    PORT (
        N        : IN std_logic_vector(3 downto 0);
        data     : IN std_logic_vector(3 downto 0);
        write    : IN std_logic;
        addr     : IN std_logic_vector(3 downto 0);
        forceRst : IN std_logic;
        clock    : IN std_logic;
        Result   : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL N        : std_logic_vector(3 downto 0) := "0000";
    SIGNAL data     : std_logic_vector(3 downto 0) := "0000";
    SIGNAL write    : std_logic := '0';
    SIGNAL addr     : std_logic_vector(3 downto 0) := "0000";
    SIGNAL forceRst : std_logic := '0';
    SIGNAL clock    : std_logic := '0';
    SIGNAL Result   : std_logic_vector(7 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: main
        PORT MAP (
            N        => N,
            data     => data,
            write    => write,
            addr     => addr,
            forceRst => forceRst,
            clock    => clock,
            Result   => Result
        );

    -- Clock Process: Limited to 17 clock cycles
    clock_process: PROCESS
        VARIABLE cycle_count : INTEGER := 0; -- Counter for clock cycles
    BEGIN
        WHILE cycle_count < 15 LOOP
            WAIT FOR 10 ns;
            clock <= NOT clock;
            IF clock = '1' THEN -- Increment the counter on the rising edge
                cycle_count := cycle_count + 1;
            END IF;
        END LOOP;
        WAIT; -- Stop the process after 17 cycles
    END PROCESS;

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Initial State
        N <= "0101"; -- Set N, this is the number of the operands + 1
        WAIT FOR 5 ns;
        forceRst <= '1'; -- Apply reset
        write <= '1'; -- Enable write
        WAIT FOR 20 ns;
        write <= '0';
        WAIT FOR 40 ns;
        forceRst <= '0'; -- Release reset
        write <= '1'; -- Enable write
        addr <= "0000"; data <= "0011"; -- Set address and data
        WAIT FOR 20 ns;
        addr <= "0001"; data <= "0101"; -- Set address and data
        WAIT FOR 20 ns;
        addr <= "0010"; data <= "0111"; -- Set address and data
        WAIT FOR 20 ns;
        addr <= "0011"; data <= "1001"; -- Set address and data
        WAIT FOR 20 ns;
        write <= '0'; -- Disable write
        addr <= "0100"; data <= "0000"; -- Set address and data
        WAIT;

    END PROCESS;

END behavior;