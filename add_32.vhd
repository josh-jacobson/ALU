library ieee;
use ieee.std_logic_1164.all;

entity add_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    carry_in : in std_logic;
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end add_32;



architecture structural of add_32 is

component add is
   port (
      a, b, c_in : in std_logic;
      z, c_out : out std_logic
    );
end component add;

signal carry_out : std_logic_vector(31 downto 0);

begin
    add_0_map: add port map (a => x(0), b => y(0), c_in => carry_in, z => z(0), c_out => carry_out(0));
    
    map_bits: for i in 1 to 31 generate
      sum1to31: add port map ( x(i), y(i), carry_out(i-1), z(i), carry_out(i) );
    end generate;
    
    overflow <= carry_out(31); -- set the overflow flag to the carry-out on the highest order bit
    
end structural;