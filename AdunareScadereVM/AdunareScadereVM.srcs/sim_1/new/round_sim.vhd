----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 10:57:20 PM
-- Design Name: 
-- Module Name: round_sim - Behavioral
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

entity round_sim is
--  Port ( );
end round_sim;

architecture Behavioral of round_sim is

signal shiftedSum : STD_LOGIC_VECTOR (26 downto 0);
signal exponent : STD_LOGIC_VECTOR (7 downto 0);
signal finalExponent : STD_LOGIC_VECTOR (7 downto 0);
signal finalRes : STD_LOGIC_VECTOR (24 downto 0);
signal overflow : STD_LOGIC;

begin

DUT: entity WORK.Round_Unit port map(shiftedSum, exponent, finalExponent, finalRes, overflow);

SIMULATION: process
                begin
                    shiftedSum <= x"ffffff" & b"011";
                    exponent <= "11111111";
                    overflow <= '0';
                    wait;
                end process;

end Behavioral;
