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
    
   component sub_32 is
     port (
       x, y   : in  std_logic_vector(31 downto 0);
       z   : out std_logic_vector(31 downto 0);
       overflow : out std_logic
     );
   end component sub_32;

begin
    -- Logically shift x left by y bits
    
    z <= x;


end structural;