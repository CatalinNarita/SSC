----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 04:48:46 PM
-- Design Name: 
-- Module Name: shiftUnit - Behavioral
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

entity shiftUnit is
    Port ( smallMantisa : in STD_LOGIC_VECTOR (23 downto 0);
           largeMantisa : in STD_LOGIC_VECTOR (23 downto 0);
           shiftPos : in integer;
           enable : in STD_LOGIC;
           smallMantisaShifted : out STD_LOGIC_VECTOR (26 downto 0);
           largeMantisaShifted : out STD_LOGIC_VECTOR (26 downto 0));
end shiftUnit;

architecture Behavioral of shiftUnit is

signal  round: integer;
signal  shifter: std_logic_vector (26 downto 0);
signal mantisaShifted : STD_LOGIC_VECTOR (26 downto 0);
begin

    
    RIGHT_SHIFT: process(enable , largeMantisa , smallMantisa , shifter , mantisaShifted , shiftPos,round)
    variable smallMantisaExt : STD_LOGIC_VECTOR (26 downto 0);
    variable largeMantisaExt : STD_LOGIC_VECTOR (26 downto 0);
    begin
     
        if enable = '1' then
            largeMantisaExt := largeMantisa & "000";
            smallMantisaExt := smallMantisa & "000";
     
            if(shiftPos < 27) then
                --round <= to_integer(unsigned(smallMantisaExt(pos downto 0)));
                case shiftPos is
                    when 0 => round <= to_integer(unsigned(smallMantisaExt(0 downto 0)));                      
                    when 1 => round <= to_integer(unsigned(smallMantisaExt(1 downto 0))); 
                    when 2 => round <= to_integer(unsigned(smallMantisaExt(2 downto 0))); 
                    when 3 => round <= to_integer(unsigned(smallMantisaExt(3 downto 0))); 
                    when 4 => round <= to_integer(unsigned(smallMantisaExt(4 downto 0))); 
                    when 5 => round <= to_integer(unsigned(smallMantisaExt(5 downto 0))); 
                    when 6 => round <= to_integer(unsigned(smallMantisaExt(6 downto 0))); 
                    when 7 => round <= to_integer(unsigned(smallMantisaExt(7 downto 0))); 
                    when 8 => round <= to_integer(unsigned(smallMantisaExt(8 downto 0))); 
                    when 9 => round <= to_integer(unsigned(smallMantisaExt(9 downto 0))); 
                    when 10 => round <= to_integer(unsigned(smallMantisaExt(10 downto 0))); 
                    when 11 => round <= to_integer(unsigned(smallMantisaExt(11 downto 0)));
                    when 12 => round <= to_integer(unsigned(smallMantisaExt(12 downto 0))); 
                    when 13 => round <= to_integer(unsigned(smallMantisaExt(13 downto 0)));
                    when 14 => round <= to_integer(unsigned(smallMantisaExt(14 downto 0)));
                    when 15 => round <= to_integer(unsigned(smallMantisaExt(15 downto 0))); 
                    when 16 => round <= to_integer(unsigned(smallMantisaExt(16 downto 0))); 
                    when 17 => round <= to_integer(unsigned(smallMantisaExt(17 downto 0))); 
                    when 18 => round <= to_integer(unsigned(smallMantisaExt(18 downto 0))); 
                    when 19 => round <= to_integer(unsigned(smallMantisaExt(19 downto 0))); 
                    when 20 => round <= to_integer(unsigned(smallMantisaExt(20 downto 0))); 
                    when 21 => round <= to_integer(unsigned(smallMantisaExt(21 downto 0))); 
                    when 22 => round <= to_integer(unsigned(smallMantisaExt(22 downto 0))); 
                    when 23 => round <= to_integer(unsigned(smallMantisaExt(23 downto 0))); 
                    when 24 => round <= to_integer(unsigned(smallMantisaExt(24 downto 0))); 
                    when 25 => round <= to_integer(unsigned(smallMantisaExt(25 downto 0)));
                    when 26 => round <= to_integer(unsigned(smallMantisaExt(26 downto 0)));                 
                    when others => round <= to_integer(unsigned(smallMantisaExt(0 downto 0)));
                end case;
            elsif(smallMantisaExt = "000000000000000000000000000") then
                round <= 0;
            else
                round <= 1;
            end if;
            shifter <= std_logic_vector(unsigned(smallMantisaExt) srl shiftPos);
            if round > 0 then
                mantisaShifted <= (shifter(26 downto 1) & '1');
            else
                mantisaShifted <= (shifter(26 downto 1) & '0');
            end if;
         
         end if;
         
          largeMantisaShifted <= largeMantisaExt;
          smallMantisaShifted <= mantisaShifted;
    end process;
end Behavioral;
