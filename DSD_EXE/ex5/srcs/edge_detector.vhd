library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity edge_detector is

  port (
    rst    : in  std_logic;
    clk    : in  std_logic;
    strobe : in  std_logic;
    p1     : out std_logic;
    p2     : out std_logic;
    p3     : out std_logic);

end entity edge_detector;

architecture rtl of edge_detector is
TYPE State_type IS (ZERO, ONE, EDGE, DELAY);
signal state : State_type;
begin  -- architecture rtl

--process(clk,rst) is
--begin
--If (rst = '1') then            -- Upon reset, set the state to ZERO
--	State <= ZERO;
--elsif (clk'event and clk = '1') then   -- rising clock edge
--    case State is
--        when ZERO =>
                 
--                if (strobe='1') then
--                    State <= EDGE;
--                else
--                    State <= ZERO;
--                end if;
--         when EDGE =>
                      
--                      if (strobe='1') then
--                           State <= ONE;
--                      else
--                           State <= ZERO;
--                      end if;
--         when ONE => 
                   
--                    if (strobe='1') then
--                          State <= ONE;
--                    else
--                          State <= ZERO;   
--                    end if;   
--         when others => 
--            State <= ZERO;
--     end case;
-- end if ;                           
--end process;
--p1<='1' when state = EDGE else '0';


--process(clk,rst) is
--begin
--If (rst = '1') then            -- Upon reset, set the state to ZERO
--	State <= ZERO;
--elsif (clk'event and clk = '1') then   -- rising clock edge
--    case State is
--        when ZERO =>
--                if (strobe='1') then
--                    State <= ONE;
--                    p2 <='1';
--                else
--                    State <= ZERO;
--                    p2 <='0';
--                end if;
        
--         when ONE => 
                    
--                    if (strobe='1') then
--                          State <= ONE;
--                           p2 <='0';
--                    else
--                          State <= ZERO; 
--                          p2<='0' ; 
--                    end if;   
--         when others => 
--            State <= ZERO;
--             p2 <='0';
--     end case;
-- end if ;                           
--end process;

process(clk,rst) is
begin
If (rst = '1') then            -- Upon reset, set the state to ZERO
	State <= ZERO;
elsif (clk'event and clk = '1') then   -- rising clock edge
    case State is
        when ZERO =>
                if (strobe='1') then
                    State <= DELAY;
                    p3 <='1';
                else
                    State <= ZERO;
                    p3 <='0';
                end if;
        when DELAY => 
                                    
                    if (strobe='1') then
                          State <= ONE;
                          p3 <='1';
                    else
                          State <= ZERO; 
                          p3<='1' ; 
                    end if;  
                    
         when ONE => 
                    
                    if (strobe='1') then
                          State <= ONE;
                          p3<='0' ; 
                    else
                          State <= ZERO; 
                          p3<='0' ; 
                    end if;   
         when others => 
            State <= ZERO;
            p3<='0' ;
     end case;
 end if ;                           
end process;

end architecture rtl;
