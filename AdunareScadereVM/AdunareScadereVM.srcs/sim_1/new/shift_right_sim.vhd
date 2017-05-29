----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 11:07:13 PM
-- Design Name: 
-- Module Name: shift_right_sim - Behavioral
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

entity shift_right_sim is
--  Port ( );
end shift_right_sim;

architecture Behavioral of shift_right_sim is

signal smallMantisa : STD_LOGIC_VECTOR (23 downto 0);
signal largeMantisa : STD_LOGIC_VECTOR (23 downto 0);
signal shiftPos : integer;
signal enable : STD_LOGIC;
signal smallMantisaShifted : STD_LOGIC_VECTOR (26 downto 0);
signal largeMantisaShifted : STD_LOGIC_VECTOR (26 downto 0);

begin

DUT: entity WORK.shiftUnit port map(smallMantisa, largeMantisa, shiftPos, enable, smallMantisaShifted, largeMantisaShifted);

SIMULATION: process
                begin
                    smallMantisa <= x"00000f";
                    largeMantisa <= x"00000f";
                    shiftPos <= 1;
                    enable <= '1';
                    wait;
                end process;

end Behavioral;
