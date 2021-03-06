library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;

entity mux_8_to_1 is
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
end mux_8_to_1;

architecture structural of mux_8_to_1 is
    signal level0_0, level0_1, level0_2, level0_3 : std_logic; -- outputs from level 0 muxes
    signal level1_0, level1_1 : std_logic; -- outputs from level 1 muxes
begin
    -- level 0 muxes
    mux0_0 : mux port map (sel(0),src0, src1, level0_0);
    mux0_1 : mux port map (sel(0),src2, src3, level0_1);
    mux0_2 : mux port map (sel(0),src4, src5, level0_2);
    mux0_3 : mux port map (sel(0),src6, src7, level0_3);
    
    -- level 1 muxes
    mux1_0 : mux port map (sel(1),level0_0, level0_1,level1_0);
    mux1_1 : mux port map (sel(1),level0_2, level0_3, level1_1);
    
    -- level 2 mux
    mux2 :  mux port map (sel(2),level1_0, level1_1, z);
    
end structural;
