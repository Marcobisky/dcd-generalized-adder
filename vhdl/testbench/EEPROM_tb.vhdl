LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY EEPROM_tb IS
END EEPROM_tb;

ARCHITECTURE behavior OF EEPROM_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT EEPROM
    PORT (
        addr : IN std_logic_vector(3 downto 0);
        Din  : IN std_logic_vector(3 downto 0);
        Rst  : IN std_logic;
        WE   : IN std_logic;
        clk  : IN std_logic;
        Dout : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL addr : std_logic_vector(3 downto 0) := "0000";
    SIGNAL Din  : std_logic_vector(3 downto 0) := "0000";
    SIGNAL Rst  : std_logic := '0';
    SIGNAL WE   : std_logic := '0';
    SIGNAL clk  : std_logic := '0';
    SIGNAL Dout : std_logic_vector(3 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: EEPROM
        PORT MAP (
            addr => addr,
            Din  => Din,
            Rst  => Rst,
            WE   => WE,
            clk  => clk,
            Dout => Dout
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: Write to address 0
        Rst <= '0'; WAIT FOR 10 ns; -- Ensure Rst stabilizes
        WE <= '1'; addr <= "0000"; Din <= "1010"; WAIT FOR 10 ns; -- Stabilize WE and inputs
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge of clk

        -- Test Case 2: Read from address 0
        WE <= '0'; WAIT FOR 10 ns; -- Ensure WE stabilizes
        addr <= "0000"; WAIT FOR 10 ns; -- Stabilize address
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge of clk
        ASSERT (Dout = "1010") REPORT "Test case 2 success!" SEVERITY error;

        -- Test Case 3: Reset the EEPROM
        WE <= '0'; Rst <= '1'; WAIT FOR 10 ns; -- Stabilize reset
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge of clk
        ASSERT (Dout = "0000") REPORT "Test case 3 success!" SEVERITY error;

        -- Test Case 4: Remove reset and write new data
        Rst <= '0'; WAIT FOR 10 ns; -- Release reset
        WE <= '1'; addr <= "0001"; Din <= "1100"; WAIT FOR 10 ns; -- Prepare new data
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge of clk

        -- Test Case 5: Read back the new data
        WE <= '0'; WAIT FOR 10 ns; -- Stabilize WE
        addr <= "0001"; WAIT FOR 10 ns; -- Point to new address
        clk <= '1'; WAIT FOR 10 ns; -- Rising edge of clk
        clk <= '0'; WAIT FOR 10 ns; -- Falling edge of clk
        ASSERT (Dout = "1100") REPORT "Test case 5 success!" SEVERITY error;

        -- End simulation
        WAIT;
    END PROCESS;

END behavior;