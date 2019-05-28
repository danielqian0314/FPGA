library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity gol_enc is
  port (
    symbol   : in  std_logic_vector(3 downto 0);
    codeword : out std_logic_vector(5 downto 0));
end entity gol_enc;

architecture rtl of gol_enc is
  constant K     : natural                      := 2;
  signal q       : std_logic_vector(3 downto 0);
  signal unary_q : std_logic_vector(5 downto 0) := (others => '0');
  signal code    : std_logic_vector(5 downto 0);
  signal r       : std_logic_vector(1 downto 0);
  signal r_pad   : std_logic_vector(5 downto 0);
begin  -- architecture rtl
    q<=std_logic_vector(shift_right(signed(symbol),K));
    unary_q <= b"1000_00" when unsigned(q) = 0 else
               b"0100_00" when unsigned(q) = 1 else
               b"0010_00" when unsigned(q) = 2 else
               b"0001_00";
   r<= symbol(K-1 to 0);
   r_pad<=(4->r(2), )
               
        
 
 
 
 process(q)
 
 begin   
 if q="0000" then
    unary_q(5) <= '1';
    r_pad(4)<= r(1);
    r_pad(3)<= r(0); 
    elsif q ="0001" then
        unary_q(5)<='0';
        unary_q(4)<='1';
        r_pad(3)<= r(1);
        r_pad(2)<= r(0); 
        elsif q ="0010" then
            unary_q(5)<='0';
            unary_q(4)<='0';
            unary_q(3)<='1';
            r_pad(2)<= r(1);
            r_pad(1)<= r(0); 
            elsif q ="0011" then
                unary_q(5)<='0';
                unary_q(4)<='0';
                unary_q(3)<='0';
                unary_q(2)<='1';
                r_pad(1)<= r(1);
                r_pad(0)<= r(0); 
  end if;
  end process; 
               
 code<= std_logic_vector(shift_left(unsigned(unary_q),2)+unsigned(r));
    
    
               
end architecture rtl;
