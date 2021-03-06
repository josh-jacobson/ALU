library ieee;
use ieee.std_logic_1164.all;

use work.eecs361_gates.all;

entity slt_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end slt_32;

architecture structural of slt_32 is

signal result : std_logic_vector(31 downto 0) := x"00000000";
signal difference : std_logic_vector(31 downto 0);

component sub_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component sub_32;

begin
    -- compute x - y. If negative (i.e., top bit set), then x < y.
    sub_map: sub_32 port map (x, y, difference, overflow);
    result(0) <= difference(31); -- set the result based on the sign bit of the difference 
    z <= result;
end structural;