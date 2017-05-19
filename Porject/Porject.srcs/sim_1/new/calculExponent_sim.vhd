library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculExponent_sim is
--  Port ( );
end calculExponent_sim;

architecture Behavioral of calculExponent_sim is

signal exponentIn: STD_LOGIC_VECTOR(7 downto 0) := x"00";
signal clk: std_logic := '0';
signal load: std_logic := '0';
signal enable: std_logic := '0';
signal operation: std_logic := '0';
signal depasireSup: std_logic;
signal depasireInf: std_logic;
signal exponentOut: STD_LOGIC_VECTOR(7 downto 0);

constant CLK_PERIOD : time := 10 ns;

begin

GENERARE_CLOCK: process
                    begin
                        clk <= '0';
                        wait for CLK_PERIOD/2;
                        clk <= '1';
                        wait for CLK_PERIOD/2;
                    end process;
                    
COMPONENTA: entity WORK.calculExponent port map(exponentIn, clk, load, enable, operation, depasireSup, depasireInf, exponentOut);

SIMULARE: process
            begin
                load <= '1';               
                exponentIn <= "00000001";
                wait for 10 ns;
                load <= '0';
                enable <= '1';          
                operation <= '0'; 
                wait for 20 ns;
                        
                load <= '1';               
                exponentIn <= "00000010";
                wait for 10 ns;
                load <= '0';
                enable <= '1';          
                operation <= '1'; 
                wait for 20 ns;
                                
                load <= '1';               
                exponentIn <= "00000000";
                wait for 10 ns;
                load <= '0';
                enable <= '1';          
                operation <= '1'; 
                wait for 20 ns; 
                
                load <= '1';               
                exponentIn <= "11111111";
                wait for 10 ns;
                load <= '0';
                enable <= '1';          
                operation <= '0'; 
                wait for 20 ns;               
                
            end process;
                      
end Behavioral;
