library ieee;
use ieee.std_logic_1164.all;

use work.eecs361_gates.all;

entity sll_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0)
  );
end sll_32;

architecture structural of sll_32 is

begin
    -- Logically shift x left by y bits:
    
    for i in 0 to y-1 loop
      z(i) = '0';
    end loop;
    
    for i in y to 31 loop
      z(i) = x(i + y)
    end loop;
    
    result(0) <= difference(31); -- set the result based on the sign bit of the difference 
    
end structural;