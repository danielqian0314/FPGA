library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity prior_enc is
  port (
    r      : in  std_logic_vector(3 downto 0);
    code   : out std_logic_vector(1 downto 0);
    active : out std_logic);
end entity prior_enc;

architecture rtl of prior_enc is

begin  -- architecture rtl



end architecture rtl;
