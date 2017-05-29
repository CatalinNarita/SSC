----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 09:26:26 PM
-- Design Name: 
-- Module Name: inc_dec_sim - Behavioral
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

entity inc_dec_sim is
--  Port ( );
end inc_dec_sim;

architecture Behavioral of inc_dec_sim is

signal exponentIn : STD_LOGIC_VECTOR (7 downto 0);
signal exponentOut : STD_LOGIC_VECTOR (7 downto 0);
signal overflow : STD_LOGIC;
signal underflow : STD_LOGIC;
signal positions : integer;
signal incrementEnable : STD_LOGIC;
signal exponentControl : STD_LOGIC;

begin

DUT: entity WORK.Inc_Dec port map(exponentIn, exponentOut, overflow, underflow, positions, incrementEnable, exponentControl);

SIMULATION: process
            begin
                exponentIn <= "00000001";
                overflow <= '0';
                underflow <= '0';
                exponentControl<='1';
                incrementEnable <= '1';
                positions <= 1;
                wait;
            end process;
                
                
                


end Behavioral;
