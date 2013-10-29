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
    
    z(0) <= '0';
    z(1) <= x(0);
    z(2) <= x(1);
    z(3) <= x(2);
    z(4) <= x(3);
    z(5) <= x(4);
    z(6) <= x(5);
    z(7) <= x(6);
    z(8) <= x(7);
    z(9) <= x(8);
    z(10) <= x(9);
    z(11) <= x(10);
    z(12) <= x(11);
    z(13) <= x(12);
    z(14) <= x(13);
    z(15) <= x(14);
    z(16) <= x(15);
    z(17) <= x(16);
    z(18) <= x(17);
    z(19) <= x(18);
    z(20) <= x(19);
    z(21) <= x(20);
    z(22) <= x(21);
    z(23) <= x(22);
    z(24) <= x(23);
    z(25) <= x(24);
    z(26) <= x(25);
    z(27) <= x(26);
    z(28) <= x(27);
    z(29) <= x(28);
    z(30) <= x(29);
    z(31) <= x(30);


end structural;