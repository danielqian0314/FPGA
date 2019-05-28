library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity mux is
  port (
    a        : in  std_logic_vector(3 downto 0);
    b        : in  std_logic_vector(3 downto 0);
    c        : in  std_logic_vector(3 downto 0);
    d        : in  std_logic_vector(3 downto 0);
    sel      : in  std_logic_vector(1 downto 0);
    selected : out std_logic_vector(3 downto 0));
end entity mux;

architecture rtl of mux is

begin  -- architecture rtl

--process (a,b,c,d,sel) is
--begin
 
with sel select
  selected <= a when "00",
     b when "01",
     c when "10",
     d when others;



--if (sel="00") then selected <= a;
--elsif (sel="01") then selected <= b;
--elsif (sel="10") then selected <= c;
--else selected<=d; 

--end if;


--case sel is 
--    when "00" => selected <= a;
--    when "01" => selected <= b;
--    when "10" => selected <= c;
--    when others => selected <= d;
--end case;
--end process;

--selected <= a when (sel = "00") 
--X <= A when (SEL = '1') else B
  

end architecture rtl;
