----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 07:37:57 PM
-- Design Name: 
-- Module Name: Round_Unit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Round_Unit is
    Port ( shiftedSum : in STD_LOGIC_VECTOR (26 downto 0);
           exponent : in STD_LOGIC_VECTOR (7 downto 0);
           finalExponent : out STD_LOGIC_VECTOR (7 downto 0);
           finalRes : out STD_LOGIC_VECTOR (24 downto 0);
           overflow : in STD_LOGIC
           );
end Round_Unit;

architecture Behavioral of Round_Unit is

begin
    process(shiftedSum , overflow , exponent)
    variable temp  : std_logic_vector (24 downto 0) := (others => '0');
    begin
           if (overflow = '1') then         
               temp := (others => '0');
           elsif (shiftedSum(2)='0') then
               temp := '0' & shiftedSum(26 downto 3);
           elsif (shiftedSum(2)='1' and ((shiftedSum(1) or shiftedSum(0)) = '1')) then
               temp := std_logic_vector(unsigned('0' & shiftedSum(26 downto 3)) + 1);
           elsif (shiftedSum(2 downto 0)="100" and shiftedSum(3)='0') then
               temp := '0' & shiftedSum(26 downto 3);
           else 
               temp := std_logic_vector(unsigned('0' & shiftedSum(26 downto 3)) + 1);
           end if;
           
           finalExponent <= exponent;
           finalRes <= temp;
    end process;
end Behavioral;
