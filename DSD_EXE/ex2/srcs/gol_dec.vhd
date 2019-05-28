library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity gol_dec is
  port (
    codeword : in  std_logic_vector(5 downto 0);
    symbol   : out std_logic_vector(3 downto 0)
    );
end entity gol_dec;

architecture rtl of gol_dec is
  signal q     : std_logic_vector(1 downto 0);
  signal r     : std_logic_vector(1 downto 0);
  signal r_pad : std_logic_vector(5 downto 0);
begin  -- architecture rtl
r(0)<=codeword(0);
r(1)<=codeword(1);

process(codeword)
begin
if codeword(5)='1' then
    q<="00" ;
    elsif codeword(4)='1' then
    q<="01";
    elsif codeword(3)='1' then
    q<="10";
    else
    q<="11";
    
    
        
end architecture rtl;
