library ieee;
use ieee.std_logic_1164.all;
entity alu_demo is
  port (
    result : out std_logic_vector(31 downto 0);
    cout, overflow, zero : out std_logic
  );
end entity alu_demo;

architecture structural of alu_demo is
   component alu is
	   port ( 
		A, B: in std_logic_vector(31 downto 0);
		control: in std_logic_vector(2 downto 0);

	   result: out std_logic_vector(31 downto 0); 
		cout, overflow, zero: out std_logic
	); 
   end component alu;

   signal control : std_logic_vector(2 downto 0);
   signal A, B : std_logic_vector(31 downto 0);
   
   begin
      alu_map : alu port map (A => A, B => B, control => control, result => result, cout => cout, overflow => overflow, zero => zero);

   test_proc : process
   begin
      A <= x"00000001";
      B <= x"00000001";
      control <= "000";
      wait for 5 ns;
      wait;
      
      -- test subtract (NOT WORKING)
      A <= x"00000001";
      B <= x"00000001";
      control <= "001";
      wait for 5 ns;
      wait;
      
      
      -- test and
      A <= x"00000001";
      B <= x"00000001";
      control <= "010";
      wait for 5 ns;
      wait;
      
      
      -- test or
      A <= x"00000001";
      B <= x"00000001";
      control <= "011";
      wait for 5 ns;
      
      -- test sll
      A <= x"00000001";
      B <= x"00000001";
      control <= "100";
      wait for 5 ns;
      wait;
      
      -- test slt
      A <= x"00000001";
      B <= x"00000001";
      control <= "101";
      wait for 5 ns;
      
      wait;
   end process;
end architecture structural;
