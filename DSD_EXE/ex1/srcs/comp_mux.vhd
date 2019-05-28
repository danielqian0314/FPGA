library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity comp_mux is
  port (
    in0    : in  std_logic_vector(3 downto 0);
    in1    : in  std_logic_vector(3 downto 0);
    op     : in  std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0));
end entity comp_mux;

architecture rtl of comp_mux is

begin  -- architecture rtl



end architecture rtl;
