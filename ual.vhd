----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2025 13:07:40
-- Design Name: 
-- Module Name: ual - Behavioral
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

USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ual is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC_VECTOR (1 downto 0));
end ual;

architecture Behavioral of ual is
SIGNAL controle_porte : std_logic_vector(7 downto 0);
SIGNAL compteur : std_logic_vector(7 downto 0);
SIGNAL registre    : std_logic_vector(7 downto 0);
SIGNAL calculatrice     : std_logic_vector(7 downto 0);



                     
COMPONENT porte
    PORT (
        rest : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        capteur_presence : IN STD_LOGIC;
        capteur_position_ouverte : IN STD_LOGIC;
        capteur_position_fermee : IN STD_LOGIC;
        ouvrir_porte : OUT STD_LOGIC;
        fermer_porte : OUT STD_LOGIC;
        ouvert : OUT STD_LOGIC;
        fermee : OUT STD_LOGIC
    );
END COMPONENT;
COMPONENT Cont_Sync
                     PORT (
                         reset : IN STD_LOGIC;
                         clk : IN STD_LOGIC;
                         enable : IN STD_LOGIC;
                         count : out STD_LOGIC_VECTOR (3 downto 0)
                         
                         
                         
                     );
END COMPONENT;
 
BEGIN
 control_portes_inst : porte
              PORT MAP (
                 rest => A(0),
                 clk => clk,
                 capteur_presence => A(2),
                 capteur_position_ouverte => A(3),
                 capteur_position_fermee => B(0),
                 
                 
                 ouvrir_porte => controle_porte(0),
                 fermer_porte => controle_porte(1),
                 ouvert => controle_porte(2),
                 fermee => controle_porte(3)
                 );
 compteur_inst : Cont_Sync
           PORT MAP (
           reset => A(0),
           clk => clk,
           enable  => A(1),
           count(0) => compteur(0),
           count(1) => compteur(1),
           count(2) => compteur(2),
           count(3) => compteur(3)
                            
              
                                 );

                 
                     
                     
                 
                     
compteur <= (others => '0');
registre<= (others => '0');
calculatrice<= (others => '0');  
                 
                     
       PROCESS (clk)
                     BEGIN
                         IF rising_edge(clk) THEN
                             IF rst = "00" THEN
                               OUTPUT<=controle_porte;
                               
                                
                                  
                              ELSE if rst="01" then 
                                 OUTPUT <= compteur; 
                                 end if; 
                              END IF;
                           END IF;
       END PROCESS;
                 
                     
                     
                 
                 END Behavioral;