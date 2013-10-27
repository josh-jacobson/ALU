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
--signal keepShifting : std_logic_vector(31 downto 0);
--signal remainingShifts : std_logic_vector(31 downto 0) := y;
signal currentResult : std_logic_vector(31 downto 0);
signal overflow : std_logic;

component slt_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component slt_32;
begin
    -- Logically shift x left by y bits
    --for i in 0 to 31 loop
       --exit when keepShifting(0) = '0' ;
    
   process (currentResult)
       begin
       for i in 1 to 31 loop
          currentResult(i) <= x(i-1);
       end loop;
   end process;
   z <= currentResult;
    --sub_32_map : sub_32 port map(y,x"00000001",remainingShifts,overflow); -- decrement the number of remaining shifts
    --slt_map: slt_32 port map (x"00000000",remainingShifts, keepShifting); -- test if there are still shifts left by comparing to 0
    --end loop;
end structural;