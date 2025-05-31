----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2025 13:23:01
-- Design Name: 
-- Module Name: porte - Behavioral
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

entity porte is
    Port ( rest : in STD_LOGIC;
           clk : in STD_LOGIC;
           capteur_presence : in STD_LOGIC;
           capteur_position_ouverte : in STD_LOGIC;
           capteur_position_fermee : in STD_LOGIC;
           ouvrir_porte : out STD_LOGIC;
           fermer_porte : out STD_LOGIC;
           ouvert : out STD_LOGIC;
           fermee : out STD_LOGIC);
end porte;

architecture Behavioral of porte is


----------------------------------------------------------------------------------


type etat_type is (ferme, ouverture , ouverte, fermeture);
signal etat_actuel, etat_suivant : etat_type;

begin
 process (clk, rest)
   begin
       if rest = '1' then
           etat_actuel <= ferme;
       elsif rising_edge(clk) then
           etat_actuel <= etat_suivant;
       end if;
   end process;
process (etat_actuel, capteur_presence, capteur_position_ouverte, capteur_position_fermee)
       begin
           
           ouvrir_porte <= '0';
           fermer_porte <= '0';
           ouvert <= '0';
           fermee <= '0';
           case etat_actuel is
           
               when ferme =>                       
                   if capteur_presence = '1' then
                          etat_suivant <= ouverture;
                          ouvrir_porte <= '1'; 
                    else
                           etat_suivant <= ferme;
                    end if;
                  when ouverture =>
                           if capteur_position_ouverte = '1' then
                                    etat_suivant <= ouverte;
                                    ouvert <= '1';
                           else
                                    etat_suivant <= ouverture;
                                    ouvrir_porte <= '1'; 
                           end if;
                   when ouverte =>
                            if capteur_presence = '0' then
                                  etat_suivant <= fermeture;
                                  fermer_porte <= '1'; -- Ferme la porte
                            else
                                  etat_suivant <= ouverte;
                            end if;
                   when fermeture =>
                             if capteur_position_fermee = '1' then
                                       etat_suivant <= ferme;
                                       fermee <= '1';
                             else
                                       etat_suivant <= fermeture;
                                       fermer_porte <= '1'; 
                             end if;
            end case;
  end process;
end Behavioral;




