----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2025 09:09:26 PM
-- Design Name: 
-- Module Name: calculatrice - Behavioral
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

entity calculatrice is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           OP : in STD_LOGIC_VECTOR (1 downto 0);
           Result : out STD_LOGIC_VECTOR (4 downto 0));
end calculatrice;

architecture Behavioral of calculatrice is
begin
    process(A, B, Op)
        variable int_A : integer := 0;
        variable int_B : integer := 0;
        variable int_Result : integer := 0;
    begin
        int_A := to_integer(unsigned(A));
        int_B := to_integer(unsigned(B));

        case Op is
            when "00" => int_Result := int_A + int_B; 
            when "01" => int_Result := int_A - int_B; 
            when "10" => int_Result := int_A * int_B;  
            when "11" =>
                if int_B /= 0 then
                    int_Result := int_A / int_B;  
                else
                    int_Result := 0;  
                end if;
            when others => int_Result := 0;
        end case;

        Result <= std_logic_vector(to_unsigned(int_Result, 5));  
    end process;
end Behavioral;
