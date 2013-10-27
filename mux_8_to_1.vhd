library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.mux_32;

entity mux_8_to_1 is
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
end mux_8_to_1;

architecture structural of mux_8_to_1 is
    signal level0_0, level0_1, level0_2, level0_3 : std_logic_vector(31 downto 0); -- outputs from level 0 muxes
    signal level1_0, level1_1 : std_logic_vector(31 downto 0); -- outputs from level 1 muxes
begin
    -- level 0 muxes
    mux0_0 : mux_32 port map (sel(0),src0, src1, level0_0);
    mux0_1 : mux_32 port map (sel(0),src2, src3, level0_1);
    mux0_2 : mux_32 port map (sel(0),src4, src5, level0_2);
    mux0_3 : mux_32 port map (sel(0),src6, src7, level0_3);
    
    -- level 1 muxes
    mux1_0 : mux_32 port map (sel(1),level0_0, level0_1,level1_0);
    mux1_1 : mux_32 port map (sel(1),level0_2, level0_3, level1_1);
    
    -- level 2 mux
    mux2 :  mux_32 port map (sel(2),level1_0, level1_1, z);
    
end structural;
