library IEEE; 
use IEEE.std_logic_1164.all; 

entity alu is

	port ( 
		 A: in std_logic_vector(31 downto 0),
		 control: in std_logic_vector(2 downto 0),

		 result: out std_logic_vector(31 downto 0); 
		 cout: out std_logic;
		 overflow: out std_logic;
		 zero: out std_logic
	); 
 
end alu;

architecture rtl of alu is 
begin 
	sum <= x xor y xor cin;
end rtl; 