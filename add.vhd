library ieee;
use ieee.std_logic_1164.all;

use work.eecs361_gates.all;

entity add is
   port (
      a, b, c_in : in std_logic;
      z, c_out : out std_logic
    );
end add;

architecture structural of add is
signal cin_xor_a: std_logic;
signal cin_and_a, cin_and_b, a_and_b : std_logic;
signal or_level1: std_logic;
begin 
    xor_level1_map : xor_gate port map (x => c_in, y => a, z => cin_xor_a);
    xor_level2_map : xor_gate port map (x => cin_xor_a, y => b, z => z);
    and_1_map : and_gate port map (x => c_in, y => a, z => cin_and_a);
    and_2_map : and_gate port map (x => c_in, y => b, z => cin_and_b);
    and_3_map : and_gate port map (x => a, y => b, z => a_and_b);
    or_1_map  : or_gate port map (x => cin_and_a, y => cin_and_b, z => or_level1);
    or_2_map  : or_gate port map (x => or_level1, y => a_and_b, z => c_out);
end architecture structural;