library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculMantisa_sim is
--  Port ( );
end calculMantisa_sim;

architecture Behavioral of calculMantisa_sim is

signal mantisaX: std_logic_vector(22 downto 0) := (others => '0');
signal mantisaY: std_logic_vector(22 downto 0) := (others => '0');
signal clk: std_logic;
signal mantisaOut: std_logic_vector(22 downto 0);
signal depasire: std_logic;

constant CLK_PERIOD : time := 10 ns;

begin

GENERARE_CLOCK: process
                    begin
                        clk <= '0';
                        wait for CLK_PERIOD/2;
                        clk <= '1';
                        wait for CLK_PERIOD/2;
                    end process;
                    
COMPONENTA: entity WORK.calculMantisa port map(mantisaX, mantisaY, clk, mantisaOut, depasire);

SIMULARE: process
            begin
                mantisaX <= "00000000000000000000011"; 
                mantisaY <= "00000000000000000001100";
                wait for 10 ns;              
              
                mantisaX <= "10000000000000000000000"; 
                mantisaY <= "10000000000000000000000";
                wait for 10 ns;
                
            end process;
                      
end Behavioral;
