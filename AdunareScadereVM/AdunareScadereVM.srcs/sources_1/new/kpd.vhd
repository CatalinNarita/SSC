----------------------------------------------------------------------------------
-- Company: Digilent Inc 2011
-- Engineer: Michelle Yu  
-- Create Date:    17:05:39 08/23/2011 
--
-- Module Name:    PmodKYPD - Behavioral 
-- Project Name:  PmodKYPD
-- Target Devices: Nexys3
-- Tool versions: Xilinx ISE 13.2 
-- Description: 
--	This file defines a project that outputs the key pressed on the PmodKYPD to the seven segment display
--
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PmodKYPD is
    Port ( 
		      Clk : in  STD_LOGIC;
			  JA : inout  STD_LOGIC_VECTOR (7 downto 0); 
			  Rst: in std_logic;
			  memDebounce: in std_logic;
              Xfinal: out std_logic_vector(31 downto 0);
              Yfinal: out std_logic_vector(31 downto 0);
              ready1: out std_logic;
              ready2: out std_logic;             
              done: out std_logic         
          );
end PmodKYPD;

architecture Behavioral of PmodKYPD is

component Decoder is
	Port (
			 clk : in  STD_LOGIC;
             Row : in  STD_LOGIC_VECTOR (3 downto 0);
			 Col : out  STD_LOGIC_VECTOR (3 downto 0);
             DecodeOut : out  STD_LOGIC_VECTOR (3 downto 0)
         );
end component;

signal Decode: STD_LOGIC_VECTOR (3 downto 0);

signal afisare: std_logic_vector(31 downto 0);

signal Xout: std_logic_vector(31 downto 0) := (others => '0');
signal Yout: std_logic_vector(31 downto 0) := (others => '0');


signal count: integer := 0;

begin

	
C0: Decoder port map (clk=>clk, Row =>JA(7 downto 4), Col=>JA(3 downto 0), DecodeOut=> Decode);
	
SCHIMBA: process(Clk)
                       begin                  
                           if rising_edge(Clk) then
                               if Rst = '1' then
                                    afisare <= (others => '0');
                                    count <= 0;
                                else
                                    if  memDebounce = '1' then
                                       count <= count + 1;
                                       if count <= 8 then
                                           afisare <= afisare(27 downto 0) & x"0";
                                           afisare <= afisare + Decode;                                          
                                           Xout <= afisare;
                                       else
                                           afisare <= afisare(27 downto 0) & x"0";
                                           afisare <= afisare + Decode;                                          
                                           Yout <= afisare;
                                       end if;
                                    end if;
                                end if;
                           end if;
                       end process;
                   
Xfinal <= Xout when count > 8;
Yfinal <= Yout when count > 8;
ready1 <= '1' when count <= 8 else '0';
ready2 <= '1' when count > 8 else '0';
done <= '1' when count > 16;
             
end Behavioral;
