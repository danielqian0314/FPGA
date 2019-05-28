library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unlocker is

port (
rst    : in  std_logic;
clk    : in  std_logic;
psw    : in  std_logic;
unlock : out std_logic);

end entity unlocker;

architecture rtl of unlocker is
TYPE State_type IS (START, A, B, C, D, UNLCK);
signal state : State_type;
begin  -- architecture rtl
process(clk,rst) is
begin
If (rst = '1') then            -- Upon reset, set the state to ZERO
State <= START;
elsif (clk'event and clk = '1') then   -- rising clock edge
case State is
    when START =>
            if (psw='1') then
                State <= A;
      
            else
                State <= START;
            end if;
    when A => 
                                
                if (psw='1') then
                      State <= B;
                      
                else
                      State <= START; 
                end if;  
                
     when B => 
                
                if (psw='0') then
                      State <= C;
 
                else
                      State <= B; 
                     
                end if; 
                
     when C => 
                                    
                if (psw='1') then
                      State <= D;
 
                else
                      State <= START; 
                     
                end if; 
                
                
     when D => 
                                                        
                if (psw='0') then
                      State <= UNLCK;
 
                else
                      State <= B; 
                     
                end if;      
     
     when UNLCK => 
                 if (psw='0') then
                       State <= UNLCK;
  
                 else
                       State <= START; 
                      
                 end if;      
     when others => 
            State <= START;

 end case;
end if ;                           
end process;
unlock <= '1' when State = UNLCK else '0';
end architecture rtl;
