----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2025 20:37:14
-- Design Name: 
-- Module Name: SHIFT_L - Behavioral
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

entity SHIFT_L is
    Port ( DATA : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end SHIFT_L;

architecture Behavioral of SHIFT_L is

signal reg : STD_LOGIC_VECTOR(7 downto 0) := "00000000";  -- Registre interne
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            -- Décalage à gauche et insertion de DATA
            reg <= reg(6 downto 0) & DATA;
        end if;
    end process;

    -- Sortie du registre
    Q <= reg;
end Behavioral;