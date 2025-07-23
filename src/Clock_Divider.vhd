----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/12/2025 04:06:33 PM
-- Design Name: 
-- Module Name: Clock_Divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock_Divider is
  Port (
      clk_in  : in STD_LOGIC;
      clk_out : out STD_LOGIC
  );
end Clock_Divider;

architecture Behavioral of Clock_Divider is
    signal q : unsigned(17 downto 0) := (others => '0');  -- 190 hz
    signal temp_clk : STD_LOGIC := '0';
begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            q <= q + 1;
            if q = 0 then
                temp_clk <= not temp_clk;
            end if;
        end if;
    end process;

    clk_out <= temp_clk;

end Behavioral;
