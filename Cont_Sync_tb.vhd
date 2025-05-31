----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2025 19:14:23
-- Design Name: 
-- Module Name: Cont_Sync_tb - Behavioral
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

use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cont_Sync_tb is
--  Port ( );
end Cont_Sync_tb;

architecture behavior of Cont_Sync_tb is

    
    component Cont_Sync
        Port (
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            enable : in  STD_LOGIC;
            count  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal clk    : STD_LOGIC := '0';
    signal reset  : STD_LOGIC := '0';
    signal enable : STD_LOGIC := '0';
    signal count  : STD_LOGIC_VECTOR(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut: Cont_Sync
        port map (
            clk    => clk,
            reset  => reset,
            enable => enable,
            count  => count
        );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        enable <= '0';
        wait for 20 ns; 

        reset <= '0';   
        enable <= '1';
        wait for 200 ns; 

        
        enable <= '0';
        wait for 50 ns;

        wait;
    end process;

end behavior;