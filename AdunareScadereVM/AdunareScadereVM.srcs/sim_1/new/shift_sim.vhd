----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 10:44:43 PM
-- Design Name: 
-- Module Name: shift_sim - Behavioral
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

entity shift_sim is
--  Port ( );
end shift_sim;

architecture Behavioral of shift_sim is

signal largeExponent : STD_LOGIC_VECTOR (7 downto 0);
signal enable : STD_LOGIC;
signal shiftResult : STD_LOGIC;
signal overflow : STD_LOGIC;
signal underflow : STD_LOGIC;
signal positions : integer;
signal sum : STD_LOGIC_VECTOR (27 downto 0);
signal shiftedSum : STD_LOGIC_VECTOR (26 downto 0);

begin

DUT: entity WORK.shift_LR port map( largeExponent, enable, shiftResult, overflow, underflow, positions, sum, shiftedSum);

SIMULATION: process
                begin
                    enable <= '1';
                    shiftResult <= '1';
                    overflow <= '0';
                    sum <= x"0000002";
                    positions <= 1;
                    wait;
                end process;

end Behavioral;
