----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 11:03:16 PM
-- Design Name: 
-- Module Name: alu1_sim - Behavioral
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

entity alu1_sim is
--  Port ( );
end alu1_sim;

architecture Behavioral of alu1_sim is

signal exp1 : STD_LOGIC_VECTOR (7 downto 0);
signal exp2 : STD_LOGIC_VECTOR (7 downto 0);
signal output : integer;
signal alu1Enable : STD_LOGIC;
signal rst : STD_LOGIC;
signal NanFlag : STD_LOGIC;
signal ready : STD_LOGIC;

begin

DUT: entity WORK.ALU1 port map( exp1, exp2, output, alu1Enable, rst, NanFLag, ready);

SIMULATION: process
                begin
                    alu1Enable <= '1';
                    exp1 <= "00000100";
                    exp2 <= "00000010";
                    wait;
                end process;

end Behavioral;
