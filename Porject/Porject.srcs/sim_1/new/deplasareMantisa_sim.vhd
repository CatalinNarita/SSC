

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity deplasareMantisa_sim is
--  Port ( );
end deplasareMantisa_sim;

architecture Behavioral of deplasareMantisa_sim is

signal mantisaIn: STD_LOGIC_VECTOR(22 downto 0) := (others => '0');
signal clk: std_logic := '0';
signal enable: std_logic := '0';
signal rst: std_logic := '0';
signal way:  std_logic := '0';
signal load: std_logic := '0';
signal mantisaZero: std_logic;
signal mantisaOut: STD_LOGIC_VECTOR(22 downto 0);

constant CLK_PERIOD : time := 10 ns;

begin

GENERARE_CLOCK: process
                    begin
                        clk <= '0';
                        wait for CLK_PERIOD/2;
                        clk <= '1';
                        wait for CLK_PERIOD/2;
                    end process;
                    
COMPONENTA: entity WORK.deplasareMantisa port map(mantisaIn, clk, enable, rst, way, load, mantisaZero, mantisaOut);

SIMULARE: process
            begin
                load <= '1';               
                mantisaIn <= "00000000000000000000001";
                wait for 10 ns;
                load <= '0';
                enable <= '1';          
                way <= '0'; 
                wait for 20 ns;
                        
                load <= '1';               
                mantisaIn <= "00000000000000000000010";
                wait for 10 ns;
                load <= '0';
                enable <= '1';          
                way <= '1'; 
                wait for 20 ns;
                                
                load <= '1';               
                mantisaIn <= "00000000000000000000001";
                wait for 10 ns;
                load <= '0';
                enable <= '1';          
                way <= '1'; 
                wait for 20 ns; 
                
            end process;
                      
end Behavioral;
