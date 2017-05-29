----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 07:16:05 PM
-- Design Name: 
-- Module Name: shift_LR - Behavioral
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

entity shift_LR is
    Port ( largeExponent : in STD_LOGIC_VECTOR (7 downto 0);
           enable : in STD_LOGIC;
           shiftResult : in STD_LOGIC;
           overflow : in STD_LOGIC;
           underflow : in STD_LOGIC;
           positions : in integer;
           sum : in STD_LOGIC_VECTOR (27 downto 0);
           shiftedSum : out STD_LOGIC_VECTOR (26 downto 0));
end shift_LR;

architecture Behavioral of shift_LR is

begin
    process(largeExponent , shiftResult , sum , underflow ,overflow , enable)
      variable temp :STD_LOGIC_VECTOR (27 downto 0);
      begin

        if enable = '1' then
                if (shiftResult='1' and overflow = '0') then
                    temp := std_logic_vector(unsigned(sum) srl positions);
                elsif (shiftResult='0' and underflow = '0') then
                    temp := std_logic_vector(unsigned(sum) sll positions);
                elsif (shiftResult='0' and underflow = '1') then
                    temp := std_logic_vector(unsigned(sum) sll (to_integer(unsigned(largeExponent))));
                end if;
                
                if (overflow = '1') then
                    shiftedSum <= "000000000000000000000000000";
                elsif (shiftResult='1') then
                    shiftedSum <= temp(26 downto 0);
                else
                    shiftedSum <= temp(27 downto 1); 
                end if;
       end if;   

end process;
end Behavioral;
