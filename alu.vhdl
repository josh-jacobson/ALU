library IEEE; 
use IEEE.std_logic_1164.all; 

use work.eecs361_gates.all;

entity alu is

	port ( 
		 A, B: in std_logic_vector(31 downto 0);
		 control: in std_logic_vector(2 downto 0);

		 result: out std_logic_vector(31 downto 0); 
		 cout, overflow, zero: out std_logic
	); 
 
end alu;

architecture structural of alu is 
signal addition, subtraction, and32, or32, sll32, slt32 : std_logic_vector(31 downto 0);
signal zeros : std_logic_vector(31 downto 0) := x"00000000";

component add_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component add_32;

component mux_8_to_1 is
  port (
	sel   : in  std_logic_vector(2 downto 0);
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	src2  : in  std_logic_vector(31 downto 0);
	src3  : in  std_logic_vector(31 downto 0);
	src4  : in  std_logic_vector(31 downto 0);
	src5  : in  std_logic_vector(31 downto 0);
	src6  : in  std_logic_vector(31 downto 0);
	src7  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end component mux_8_to_1;

begin
   mux_map : mux_8_to_1 port map (control, addition, subtraction, and32, or32, sll32, slt32, zeros, zeros, result);
   add_32_map : add_32 port map (A, B, result, overflow);

   and_gate_32_map : and_gate_32 port map (A, B, result);
   or_gate_32_map : or_gate_32 port map (A, B, result);
	
end structural;