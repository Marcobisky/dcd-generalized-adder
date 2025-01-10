LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY adder4bit_tb IS
END adder4bit_tb;

ARCHITECTURE behavior OF adder4bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT adder4bit
    PORT (
        A  : IN std_logic_vector(3 downto 0);
        B  : IN std_logic_vector(3 downto 0);
        C  : OUT std_logic;
        Rl : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL A  : std_logic_vector(3 downto 0) := "0000";
    SIGNAL B  : std_logic_vector(3 downto 0) := "0000";
    SIGNAL C  : std_logic;
    SIGNAL Rl : std_logic_vector(3 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: adder4bit
        PORT MAP (
            A  => A,
            B  => B,
            C  => C,
            Rl => Rl
        );

    -- Test Process
    stim_proc: PROCESS
    BEGIN
        -- Test Case 1: A = 0000, B = 0000
        A <= "0000"; B <= "0000";
        WAIT FOR 10 ns;
        ASSERT (C = '0' AND Rl = "0000") 
        REPORT "Test case 1 failed!" SEVERITY error;

        -- Test Case 2: A = 0001, B = 0001
        A <= "0001"; B <= "0001";
        WAIT FOR 10 ns;
        ASSERT (C = '0' AND Rl = "0010") 
        REPORT "Test case 2 failed!" SEVERITY error;

        -- Test Case 3: A = 1111, B = 0001
        A <= "1111"; B <= "0001";
        WAIT FOR 10 ns;
        ASSERT (C = '1' AND Rl = "0000") 
        REPORT "Test case 3 failed!" SEVERITY error;

        -- Test Case 4: A = 1010, B = 0101
        A <= "1010"; B <= "0101";
        WAIT FOR 10 ns;
        ASSERT (C = '0' AND Rl = "1111") 
        REPORT "Test case 4 failed!" SEVERITY error;

        -- Test Case 5: A = 1111, B = 1111
        A <= "1111"; B <= "1111";
        WAIT FOR 10 ns;
        ASSERT (C = '1' AND Rl = "1110") 
        REPORT "Test case 5 failed!" SEVERITY error;

        -- Stop simulation
        WAIT;
    END PROCESS;

END behavior;