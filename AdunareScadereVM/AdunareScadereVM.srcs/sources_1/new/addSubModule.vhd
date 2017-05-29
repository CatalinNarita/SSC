----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/27/2017 02:44:02 PM
-- Design Name: 
-- Module Name: addSubModule - Behavioral
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

entity addSubModule is
    Port ( x : in STD_LOGIC_VECTOR (31 downto 0);
           yIN : in STD_LOGIC_VECTOR (31 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           op : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC);
end addSubModule;

architecture Behavioral of addSubModule is

--small ALU
signal exponentDifference : integer;
signal NanFlag :std_logic;


--control unit
signal AluEnable :std_logic;
signal large_exp :  STD_LOGIC;
signal small_num :  STD_LOGIC;
signal large_num :  STD_LOGIC;
signal shift_right_pos :  integer;
signal addsub :  STD_LOGIC;
signal sign :  STD_LOGIC;
signal muxEnable :  STD_LOGIC;
signal shiftEnable :  STD_LOGIC;
signal stop : STD_LOGIC;
signal shiftResult : STD_LOGIC;
signal exponentControl :  STD_LOGIC;
signal shiftPos :  integer;
signal enableCheck : STD_LOGIC;
signal incrementEnable : STD_LOGIC;
signal shiftResultEnable : STD_LOGIC;
signal roundEnable :  STD_LOGIC;
signal done : STD_LOGIC := '0';

--multiplexer
signal smallMantisa : std_logic_vector(23 downto 0);
signal largeMantisa : std_logic_vector(23 downto 0);
signal largeExponent : std_logic_vector(7 downto 0);
signal smallExponent : std_logic_vector(7 downto 0);
signal exponentSelect: std_logic_vector(7 downto 0);
 
--shiftUnit
signal smallMantisaShifted :  STD_LOGIC_VECTOR (26 downto 0);
signal largeMantisaShifted :  STD_LOGIC_VECTOR (26 downto 0);

--ALU mantisa
signal mantisaSum :  STD_LOGIC_VECTOR (27 downto 0);
signal enableAluMantisa :  STD_LOGIC;


signal finalRes : STD_LOGIC_VECTOR(24 downto 0) := (others => '0');
signal finalExponent : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal overflow : STD_LOGIC;
signal underflow : STD_LOGIC;

signal sum :  STD_LOGIC_VECTOR(27 downto 0) := (others => '0');

--increment_decrement
signal exponentIncremented :STD_LOGIC_VECTOR(7 downto 0) := (others => '0');


--shift LEFT RIGHT
signal shiftedSum :  STD_LOGIC_VECTOR (26 downto 0);

signal smallNumber : STD_LOGIC_VECTOR (31 downto 0);
signal largeNumber : STD_LOGIC_VECTOR (31 downto 0); 
signal compareRes : STD_LOGIC;
signal opCheckEnable : STD_LOGIC := '0';
signal shiftNum : integer;
signal ready : STD_LOGIC := '0';
signal changeSign : STD_LOGIC;

signal y : STD_LOGIC_VECTOR (31 downto 0);
begin

    COMPLEMENT : entity WORK.comp2 port map(yIN(22 downto 0) , y(22 downto 0) , changeSign , op);
    
    y(30 downto 23) <= yIN(30 downto 23);
    y(31) <= changeSign;
    
    INCREMENT : entity WORK.Inc_Dec port map(exponentSelect , exponentIncremented , overflow , underflow , shiftPos ,incrementEnable, exponentControl);
    
    SHIFT_LEFT_RIGHT : entity WORK.shift_LR port map(largeExponent , shiftResultEnable , shiftResult , overflow , underflow , shiftPos , sum , shiftedSum);

    ROUND_U : entity WORK.Round_Unit port map(shiftedSum , exponentIncremented , finalExponent , finalRes , overflow);

    SMALL_ALU : entity WORK.ALU1 port map(x(30 downto 23) , y(30 downto 23) , exponentDifference , AluEnable , rst , NanFlag , ready);
    

    
    SHIFT : entity WORK.shiftUnit port map(
                smallMantisa => smallMantisa, 
                largeMantisa => largeMantisa,
                shiftPos => shift_right_pos,
                enable => shiftEnable,
                smallMantisaShifted => smallMantisaShifted,
                largeMantisaShifted => largeMantisaShifted
                );
    ALU_MANTISA : entity WORK.aluMantisa port map(largeMantisaShifted , smallMantisaShifted , mantisaSum , addsub , enableAluMantisa);
               
    CONTROL : entity WORK.controlUnit port map(
                clk => clk , 
                rst => rst, 
                x => x,
                y => y,
                mantisaSum => mantisaSum,
                finalRes => finalRes,
                exponentDifference => exponentDifference,
                ready => ready,
                AluEnable => AluEnable,
                large_exp => large_exp,
                small_num => small_num,
                large_num => large_num,
                shift_right_pos => shift_right_pos,
                addsub => addsub,
                sign => sign,
                muxEnable => muxEnable,
                shiftEnable =>shiftEnable,
                enableAluMantisa => enableAluMantisa,
                stop => stop,
                shiftResult => shiftResult,
                exponentControl => exponentControl ,
                shiftPos => shiftPos,
                enableCheck => enableCheck,
                incrementEnable => incrementEnable,
                shiftResultEnable => shiftResultEnable,
                roundEnable => roundEnable ,
                done => done,
                opCheckEnable => opCheckEnable
   
                );
          
                
     MULTIPLEXERS: process(muxEnable)
     begin 
        if muxEnable = '1' then 
                if small_num = '1' then
                    smallMantisa <= ('1' & x(22 downto 0));
                else    
                    smallMantisa <= ('1' & y(22 downto 0));
                end if;
                
                if large_num = '1' then
                    largeMantisa <= ('1' & x(22 downto 0));
                else 
                    largeMantisa <= ('1' & y(22 downto 0));
                end if;
                
                if large_exp = '1' then
                    largeExponent <= x(30 downto 23);
                else
                    largeExponent <= y(30 downto 23);
                end if;
        end if;    
     end process;   
     
     OVERUNDER_FLOW : process(enableCheck)
     begin
        if enableCheck = '1' then
            if ((exponentControl = '0') and (to_integer(unsigned(largeExponent)) - shiftPos <= 0)) then
                underflow <= '1';
            else
                underflow <= '0';
            end if ;
            
            if ((exponentControl = '1') and (to_integer(unsigned(largeExponent)) + shiftPos >= 255)) or (largeExponent = "11111111") then
                overflow <= '1';
            else
                overflow <= '0';
            end if; 
         end if;
     end process;        
      
     MUX_MANTISA : process(enableCheck)
     begin
        if enableCheck = '1' then
            if stop = '1' then
                sum <= finalRes & "000";
                exponentSelect <= exponentIncremented;
            else
                sum <= mantisaSum;
                exponentSelect <= largeExponent;
            end if;
        end if;
     end process; 

     
     FINALIZE:process(done)
     begin

        if done = '1' then
        
            result <= sign & finalExponent & finalRes(22 downto 0);  
        end if ;
     end process;
end Behavioral;
