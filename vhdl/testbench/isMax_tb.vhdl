LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY isMax_tb IS
END isMax_tb;

ARCHITECTURE behavior OF isMax_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT isMax
    PORT (
        N    : IN std_logic_vector(3 downto 0);
        Addr : IN std_logic_vector(3 downto 0);
        rst  : OUT std_logic
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL N    : std_logic_vector(3 downto 0) := "0000";
    SIGNAL Addr : std_logic_vector(3 downto 0) := "0000";
    SIGNAL rst  : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: isMax
        PORT MAP (
            N    => N,
            Addr => Addr,
            rst  => rst
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: N = Addr
        N <= "1010"; Addr <= "1010";
        WAIT FOR 10 ns;
        ASSERT (rst = '1') REPORT "Test case 1 failed!" SEVERITY error;

        -- Test Case 2: N != Addr (one bit differs)
        N <= "1010"; Addr <= "1000";
        WAIT FOR 10 ns;
        ASSERT (rst = '0') REPORT "Test case 2 failed!" SEVERITY error;

        -- Test Case 3: N != Addr (completely different)
        N <= "1111"; Addr <= "0000";
        WAIT FOR 10 ns;
        ASSERT (rst = '0') REPORT "Test case 3 failed!" SEVERITY error;

        -- Test Case 4: N = Addr (all bits equal)
        N <= "1100"; Addr <= "1100";
        WAIT FOR 10 ns;
        ASSERT (rst = '1') REPORT "Test case 4 failed!" SEVERITY error;

        -- Test Case 5: N != Addr (alternating bits)
        N <= "1010"; Addr <= "0101";
        WAIT FOR 10 ns;
        ASSERT (rst = '0') REPORT "Test case 5 failed!" SEVERITY error;

        -- Stop simulation
        WAIT;
    END PROCESS;

END behavior;