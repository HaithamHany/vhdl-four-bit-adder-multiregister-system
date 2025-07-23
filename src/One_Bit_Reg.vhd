----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2025 09:17:02 AM
-- Design Name: 
-- Module Name: One_Bit_Reg - Behavioral
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

entity One_Bit_Reg is
  Port (
    load, data, clk : in STD_LOGIC;
    clr  : in STD_LOGIC;
    Q: out STD_LOGIC
   );
end One_Bit_Reg;

architecture Behavioral of One_Bit_Reg is
begin
   process(clk)
    begin
      if rising_edge(clk) then
        if clr = '1' then
          Q <= '0';
        elsif load = '1' then
          Q <= data;
        end if;
      end if;
end process;
end Behavioral;
