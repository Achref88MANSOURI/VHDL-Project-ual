----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2025 18:58:31
-- Design Name: 
-- Module Name: Cont_Sync - Behavioral
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

entity Cont_Sync is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end Cont_Sync;

architecture Behavioral of Cont_Sync is
signal lfsr : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            
            lfsr  <= "1111";
            count <= "1111";
        elsif rising_edge(clk) then
            if enable = '1' then
                
                lfsr <= lfsr(2 downto 0) & (lfsr(3) xor lfsr(0));
            end if;
           
            count <= lfsr;
        end if;
    end process;
end Behavioral;

