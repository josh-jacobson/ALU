library IEEE; 
use IEEE.std_logic_1164.all; 

use work.eecs361_gates.all;

entity alu is

	port ( 
		 A, B: in std_logic_vector(31 downto 0),
		 control: in std_logic_vector(2 downto 0),

		 result: out std_logic_vector(31 downto 0); 
		 cout, overflow, zero: out std_logic;
	); 
 
end alu;

architecture structural of alu is 
signal addition, subtraction, and32, or32, sll32, slt32 : std_logic_vector(31 downto 0);

component and_32 is
  port (
    x, y   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0);
    overflow : out std_logic
  );
end component and_32;

begin 
	
end structural; 