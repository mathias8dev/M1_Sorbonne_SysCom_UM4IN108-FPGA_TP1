----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2026 02:40:13 PM
-- Design Name: 
-- Module Name: Test - Behavioral
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

entity Test is
    Port ( 
        SW0 : in  STD_LOGIC;
        SW1 : in  STD_LOGIC;
        SW2 : in  STD_LOGIC;
        LED : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Test;

architecture Behavioral of Test is
begin
    -- LED(0) prend la valeur de SW0
    LED(0) <= SW0;
    
    -- LED(1) prend la valeur de SW1
    LED(1) <= SW1;
    
    -- LED(2) prend la sortie d'un ET logique entre les 3 interrupteurs
    LED(2) <= SW0 and SW1 and SW2;

end Behavioral;
