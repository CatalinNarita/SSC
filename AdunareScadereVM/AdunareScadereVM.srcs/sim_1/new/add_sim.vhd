----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 03:32:21 PM
-- Design Name: 
-- Module Name: add_sim - Behavioral
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

entity add_sim is
--  Port ( );
end add_sim;

architecture Behavioral of add_sim is

signal x , yIN , result: std_logic_vector(31 downto 0);
signal op , clk , rst: std_logic ;


begin

    ADD_UNIT : entity WORK.addSubModule port map(x => x, yIN => yIN , result => result , op => op , clk => clk , rst => rst);
    --ADD_UNIT : entity WORK.adder port map(clk , rst , x , y , result);
    CLOCK:process
    begin
        clk <='1';
        wait for 30 ns;
        clk <='0';
        wait for 30 ns;
    end process;
    
    adderproc: process
    begin
        --rst <= '1';
        --wait for 100 ns;
        --rst <= '0';
        --op <= '1'; --scadere
        --x <= x"4015c28f"; --2.34
        --yIN <= x"3f91eb85"; --1.14
        
        --wait for 1000 ns;
        rst <= '1';
        wait for 1000 ns;
        rst <= '0';
        op <= '0'; --adunare
        x <= x"3fb5c28f"; --1.42
        yIN <= x"40451eb8"; --3.08
        
        wait;
                
    end process;

end Behavioral;
