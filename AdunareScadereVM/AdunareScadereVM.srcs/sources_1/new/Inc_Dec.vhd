----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 06:59:45 PM
-- Design Name: 
-- Module Name: Inc_Dec - Behavioral
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

entity Inc_Dec is
    Port ( exponentIn : in STD_LOGIC_VECTOR (7 downto 0);
           exponentOut : out STD_LOGIC_VECTOR (7 downto 0);
           overflow : in STD_LOGIC;
           underflow : in STD_LOGIC;
           positions : in integer;
           incrementEnable : in STD_LOGIC;
           exponentControl : in STD_LOGIC);
end Inc_Dec;

architecture Behavioral of Inc_Dec is

begin
    process (overflow , underflow , exponentControl , incrementEnable, positions,exponentIn)
    begin

        if incrementEnable = '1' then 
            if (overflow = '1') then            
                  exponentOut <= "11111111";
            elsif (exponentControl='0' and positions=27 and overflow = '0') then
                  exponentOut <= "00000000";
            elsif (exponentControl='1' and overflow = '0') then
                  exponentOut <= std_logic_vector(unsigned(exponentIn) + to_unsigned(positions,8));
            elsif (exponentControl='0' and underflow = '0') then
                  exponentOut <= std_logic_vector(unsigned(exponentIn) - to_unsigned(positions,8) + to_unsigned(1,8));
            else 
                  exponentOut <= "00000000";
            end if; 
         end if;

    end process;
end Behavioral;
