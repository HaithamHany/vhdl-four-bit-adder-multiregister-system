library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seven_Segment_Decoder is
    Port (
        x   : in  STD_LOGIC_VECTOR(3 downto 0);
        seg : out STD_LOGIC_VECTOR(6 downto 0)  -- a to g
    );
end Seven_Segment_Decoder;

architecture Behavioral of Seven_Segment_Decoder is
begin
  process(x)
  begin
    case x is
      when "0000" => seg <= NOT "0111111"; -- 0
      when "0001" => seg <= NOT "0000110"; -- 1
      when "0010" => seg <= NOT "1011011"; -- 2
      when "0011" => seg <= NOT "1001111"; -- 3
      when "0100" => seg <= NOT "1100110"; -- 4
      when "0101" => seg <= NOT "1101101"; -- 5
      when "0110" => seg <= NOT "1111101"; -- 6
      when "0111" => seg <= NOT "0000111"; -- 7
      when "1000" => seg <= NOT "1111111"; -- 8
      when "1001" => seg <= NOT "1101111"; -- 9
      when "1010" => seg <= NOT "1110111"; -- A
      when "1011" => seg <= NOT "1111100"; -- b
      when "1100" => seg <= NOT "0111001"; -- C
      when "1101" => seg <= NOT "1011110"; -- d
      when "1110" => seg <= NOT "1111001"; -- E
      when "1111" => seg <= NOT "1110001"; -- F
      when others => seg <= NOT "0000000"; -- blank or error
    end case;
  end process;
end Behavioral;
