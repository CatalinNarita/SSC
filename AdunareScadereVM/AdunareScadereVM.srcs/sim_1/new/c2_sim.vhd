----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 08:56:10 PM
-- Design Name: 
-- Module Name: c2_sim - Behavioral
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

entity c2_sim is
--  Port ( );
end c2_sim;

architecture Behavioral of c2_sim is

signal input : STD_LOGIC_VECTOR (22 downto 0) := (others => '0');
signal output : STD_LOGIC_VECTOR (22 downto 0);
signal changeSign: STD_LOGIC;
signal sign : STD_LOGIC := '0';

begin

DUT: entity WORK.comp2 port map(input, output, changeSign, sign);

SIMULATION: process
                begin
                    input <= x"4a41c" & b"101";
                    sign <= '1';
                    wait for 100 ns;
                    sign <= '0';
                    wait;
                end process;


end Behavioral;
