library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control is
    port(
            compExp: in std_logic_vector(1 downto 0);
            clk: in std_logic;
            rst: in std_logic;
            start: in std_logic;
            operation: in std_logic;
            sign: out std_logic;
            mantisaRot: in std_logic_vector(22 downto 0);
            muxExp: out std_logic;
            muxM1: out std_logic;
            muxM2: out std_logic;
            sr: out std_logic;
            muxShift: out std_logic;
            sl: out std_logic;
            round: out std_logic;
            depasireSup: out std_logic;
            depasireInf: out std_logic;
            incDec: out std_logic;
            mantisaZero: in std_logic;
            final: out std_logic;
            depasire: in std_logic;
            dSup: in std_logic;
            dInf: in std_logic
        );
end control;

architecture Behavioral of control is

type stare is (idle, init, compare, increment, shiftR, manttisaZ, stop, addMantissa, incExp, depasireMantisa, depasireSupExp, rezultatNorm, incrementSumExp, shiftL, decrementSumExp, depasireInfExp,roundResult, rezNorm);

signal st: stare := idle;


begin

UC: process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then 
                    st <= idle;
                else   
                    case st is
                        when idle   =>  depasireSup <= '0';
                                        depasireInf <= '0';
                                        if start = '1' then
                                            st <= init;
                                        else
                                            st <= idle;
                                        end if;
                        when init   =>  if operation = '1' then
                                            sign <= '1';
                                        else
                                            sign <= '0';
                                        end if;
                                        st <= compare;
                        when compare => if compExp = "00" then
                                            st <= addMantissa;
                                        else
                                            st <= increment;
                                        end if;
                        when increment => incDec <= '0'; --incrementare exponent
                                          sr <= '1';
                                          if compExp = "01" then
                                                muxExp <= '0';
                                                muxShift <= '0';
                                                st <= increment;
                                          elsif compExp = "10" then
                                                muxExp <= '1';
                                                muxShift <= '1';
                                                st <= increment;
                                          end if;
                                          if mantisaZero = '1' then
                                                final <= '1';
                                                st <= stop;
                                          else
                                                st <= compare;
                                          end if;
                      when addMantissa => if mantisaZero = '1' then
                                                final <= '1';
                                                st <= stop;
                                           elsif depasire = '1' then
                                                sr <= '1';
                                                st <= incExp;
                                           end if;
                      when incExp => incDec <= '0';
                                     if dSup = '1' then
                                        depasireSup <= '1';
                                        final <= '1';
                                        st <= stop;
                                     else
                                        st <= rezultatNorm;
                                     end if;
                     when rezultatNorm => if mantisaRot(22) = '0' then
                                                st <= shiftL;
                                          else
                                                st <= roundResult;
                                          end if;
                     when shiftL => sr <= '0';
                                    sl <= '1';
                                    incDec <= '1';
                                    if dInf = '1' then
                                        depasireInf <= '1';
                                        final <= '1';
                                        st <= stop;
                                    end if;
                    when roundResult => if mantisaRot(22) = '0' then
                                            final <= '1';
                                            st <= stop;
                                        else
                                            st <= shiftL;
                                        end if;
                                        round <= '1';
                    when stop => st <= idle;
        
                end case;
            end if;
        end if;
    end process;
    
muxM1 <= compExp(1);
muxM2 <= compExp(0);

end Behavioral;
