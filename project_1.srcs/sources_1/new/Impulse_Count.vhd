----------------------------------------------------------------------------------
-- Company: UPMC
-- Engineer: Julien Denoulet
-- 
-- Create Date:   	Septembre 2016 
-- Module Name:    	Impulse_Count - Behavioral 
-- Project Name: 		TP1 - FPGA1
-- Target Devices: 	Nexys4 / Artix7

-- XDC File:			Impulse_Count.xdc					

-- Description: Compteur d'Impulsions - Version KO
--
--		Compteur d'Impulsions sur 4 bits
--			- Le Compteur s'Incrémente si on Appuie sur le Bouton Left
--			- Le Compteur se'Décrémente si on Appuie sur le Bouton Center
--			- Sup Passe à 1 si le Compteur Dépasse 9
--
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Description: Testbench du Compteur d'Impulsions - Version CORRIGÉE
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity IMPULSE_COUNT is
    Port ( Clk : in  STD_LOGIC;                             -- Horloge Système
           Reset : in  STD_LOGIC;                           -- Reset Asynchrone
           Button_L : in  STD_LOGIC;                        -- Bouton Left
           Button_C : in  STD_LOGIC;                        -- Bouton Center
           Count : out  STD_LOGIC_VECTOR (3 downto 0);      -- Compteur d'Impulsions
           Sup : out  STD_LOGIC);                           -- Indicateur Valeur Seuil
end IMPULSE_COUNT;

architecture Behavioral of IMPULSE_COUNT is

    signal cpt : std_logic_vector(3 downto 0);    -- Compteur d'Impulsions
    signal Button_L_prev : std_logic;             -- État précédent Button_L
    signal Button_C_prev : std_logic;             -- État précédent Button_C

begin

    Count <= cpt;   -- Affichage en Sortie du Compteur

    -------------------------
    -- Gestion du Compteur --
    -------------------------
    process(Clk, Reset)
    begin
        -- Reset Asynchrone
        if Reset = '1' then 
            cpt <= "0000";
            Button_L_prev <= '0';
            Button_C_prev <= '0';
            
        -- Front montant de l'horloge
        elsif rising_edge(Clk) then
        
            -- Mémorisation des états précédents
            Button_L_prev <= Button_L;
            Button_C_prev <= Button_C;
            
            -- Incrémentation sur front montant de Button_L
            if Button_L = '1' and Button_L_prev = '0' then
                cpt <= cpt + 1;
            end if;
            
            -- Décrémentation sur front montant de Button_C
            if Button_C = '1' and Button_C_prev = '0' then
                cpt <= cpt - 1;
            end if;
            
        end if;
    end process;

    -------------------------
    -- Gestion du Flag Sup --
    -------------------------
    Sup <= '1' when (cpt > 9) else '0';

end Behavioral;