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
signal overflows : std_logic_vector (5 downto 0);
signal zeros : std_logic_vector(31 downto 0) := x"00000000";

component add_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component add_32;

component sub_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component sub_32;

component sll_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0)
  );
end component sll_32;

component slt_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component slt_32;

component mux_8_to_1 is
  port (
	sel   : in  std_logic_vector(2 downto 0);
	src0  : in  std_logic;
	src1  : in  std_logic;
	src2  : in  std_logic;
	src3  : in  std_logic;
	src4  : in  std_logic;
	src5  : in  std_logic;
	src6  : in  std_logic;
	src7  : in  std_logic;
	z	    : out std_logic
  );
end component mux_8_to_1;

component mux32_8_to_1 is
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
end component mux32_8_to_1;

begin
   add_32_map : add_32 port map (A, B, addition, overflows(0));
   sub_32_map : sub_32 port map (A, B, subtraction, overflows(1));
   and_gate_32_map : and_gate_32 port map (A, B, and32);
   or_gate_32_map : or_gate_32 port map (A, B, or32);
   sll_map : sll_32 port map (A, B, sll32);
   slt_map : slt_32 port map (A, B, slt32, overflows(5));
   main_mux_map : mux32_8_to_1 port map (control, addition, subtraction, and32, or32, sll32, slt32, zeros, zeros, result);
   overflow_mux_map : mux_8_to_1 port map (control, overflows(0), overflows(1), overflows(2), overflows(3), overflows(4),overflows(5), '0', '0', overflow);
end structural;