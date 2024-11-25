library IEEE;
use IEEE.std_logic_1164.all;

entity orbit is
    port (
        d: in STD_LOGIC_VECTOR (3 downto 0);
        s: out STD_LOGIC_VECTOR (6 downto 0)
    );
end orbit;

architecture orbit_arch of orbit is
begin
  with d select
  s<="1110111" when "0000",
     "0010010" when "0001",
     "1011101" when "0010",
     "1011011" when "0011",
     "0111010" when "0100",
     "1101011" when "0101",
     "1101111" when "0110",
     "1010010" when "0111",
     "1111111" when "1000",
     "1111011" when "1001",
     "1111110" when "1010",
     "0101111" when "1011",
     "1100101" when "1100",
     "0011111" when "1101",
     "1101101" when "1110",
     "1101100" when others;

end orbit_arch;
