library ieee;
use ieee.std_logic_1164.all;

use work.eecs361_gates.all;

entity sub_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end sub_32;



architecture structural of sub_32 is

component add_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component add_32;

signal not_y, negative_y : std_logic_vector(31 downto 0);


begin
    not_map : not_gate_32 port map (x, not_y);
    add_one_map : add_32 port map(not_y, x"00000001", negative_y, overflow);
    add_32_map : add_32 port map (x, negative_y,z, overflow);
    
end structural;