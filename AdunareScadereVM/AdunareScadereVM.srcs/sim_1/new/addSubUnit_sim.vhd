----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 03:05:32 PM
-- Design Name: 
-- Module Name: ALU1 - Behavioral
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

entity ALU1 is
    Port ( exp1 : in STD_LOGIC_VECTOR (7 downto 0);
           exp2 : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0);
           alu1Enable : in STD_LOGIC;
           rst : in STD_LOGIC;
           NanFlag : out STD_LOGIC);
end ALU1;

architecture Behavioral of ALU1 is

begin
    process(rst , exp1 , exp2)
    begin
        if rst = '1' then 
            output <= x"00";
        else 
            if alu1Enable = '1' then 
                output <= to_integer(unsigned(exp1)) - to_integer(unsigned(exp1));
            end if;
        end if ;
    end process;

end Behavioral;
