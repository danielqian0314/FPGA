library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lsr is  
  port (
    clk_enable : in std_logic;
    clk      : in  std_logic;
    rst      : in  std_logic;
    load     : in  std_logic;
    data_in  : in  std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0));
end entity lsr;

architecture rtl of lsr is

begin  -- architecture rtl

  
process(data_in, load, clk, rst)
variable reg: std_logic_vector(7 downto 0) :="00000000";
begin
if rising_edge(clk) then
    if rst = '1' then
        data_out <="00000000";
        reg:="00000000";        
    else
        if clk_enable = '1' then
                if load = '0' then
                    data_out <= std_logic_vector(shift_left(unsigned(reg), 1));
                else
                    reg := data_in;
                end if;
             end if;
         end if;
     end if;
end process;
end architecture rtl;
