----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2017 11:12:32 PM
-- Design Name: 
-- Module Name: mantissa_alu_sim - Behavioral
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

entity mantissa_alu_sim is
--  Port ( );
end mantissa_alu_sim;

architecture Behavioral of mantissa_alu_sim is

signal mantisa1 : STD_LOGIC_VECTOR (26 downto 0);
signal mantisa2 : STD_LOGIC_VECTOR (26 downto 0);
signal mantisaSum : STD_LOGIC_VECTOR (27 downto 0);
signal addsub : STD_LOGIC;
signal enableAluMantisa : STD_LOGIC;

begin

DUT: entity WORK.aluMantisa port map (mantisa1, mantisa2, mantisaSum, addsub, enableAluMantisa);

SIMULATION: process
                begin
                    mantisa1 <= x"000000" & b"111";
                    mantisa2 <= x"000000" & b"111";
                    addSub <= '0';
                    enableAluMantisa <= '1';
                    wait;
                end process;

end Behavioral;
