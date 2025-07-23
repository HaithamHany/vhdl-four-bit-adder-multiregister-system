----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2025 07:19:25 AM
-- Design Name: 
-- Module Name: Debounce - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Debounce is
    Port (
        sq_in, clk : in STD_LOGIC; -- button signal and clock input
        sq_out : out STD_LOGIC  -- filtered output
     );
end Debounce;

architecture Behavioral of Debounce is
signal d1, d2, d3 : STD_LOGIC :='0'; -- delay signals initialized to 0
begin
    process (clk)
    begin
        if rising_edge(clk) then
            d1 <= sq_in;
            d2 <= d1;
            d3 <= d2;
        end if;
    end process;
    sq_out <= d1 and d2 and d3;
end Behavioral;

