----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2025 15:03:50
-- Design Name: 
-- Module Name: ual_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ual_tb is
--  Port ( );
end ual_tb;






architecture testbench of ual_tb is

    
    signal A_tb, B_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal rst_tb:STD_LOGIC_VECTOR (1 downto 0);
    signal OUTPUT_tb  : STD_LOGIC_VECTOR (7 downto 0);
    signal clk_tb : STD_LOGIC := '0';

    
    COMPONENT ual
        Port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            OUTPUT : out STD_LOGIC_VECTOR (7 downto 0);
            clk : in STD_LOGIC;
            rst : in STD_LOGIC_VECTOR (1 downto 0)
        );
    END COMPONENT;

BEGIN

    
    uut: ual 
    PORT MAP (
        A => A_tb,
        B => B_tb,
        OUTPUT => OUTPUT_tb,
        clk => clk_tb,
        rst => rst_tb
    );

   
    clk_process: PROCESS
    BEGIN
        WHILE NOW < 500 ns LOOP  
            clk_tb <= '0';
            WAIT FOR 5 ns;
            clk_tb <= '1';
            WAIT FOR 5 ns;
        END LOOP;
        WAIT;
    END PROCESS;

    
    stimulus_process: PROCESS
    BEGIN
        
        rst_tb <= "10";
        A_tb <= (others => '0');
        B_tb <= (others => '0');
        
        WAIT FOR 10 ns ;
        
        
        rst_tb <= "00";
        WAIT FOR 10 ns;

        
        A_tb <= "0001";  
        B_tb <= "0000";
        WAIT FOR 10 ns;

        A_tb <= "0100";  
        WAIT FOR 10 ns;
        A_tb <= "1000";  
         WAIT FOR 10 ns;
          A_tb <= "0000";  
          WAIT FOR 20 ns;
          A_tb <= "0000";  
          B_tb <= "0001";
          WAIT FOR 20 ns;
          A_tb <= "0100";  
          WAIT FOR 10 ns;
          

       
        rst_tb <= "01";
        WAIT FOR 20 ns;
        A_tb <= "0010";
        

        
        WAIT;
    END PROCESS;

END testbench;



