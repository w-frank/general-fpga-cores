--------------------------------------------------------------------------------
-- (c) Will Frank Designs
-- Name: N-bit Register
-- URL:     
-- Author: Will Frank 
-- Date:   23/12/2020 
--------------------------------------------------------------------------------
--! File: n_bit_register.vhd 
-- Revision:  
--     001 : First version
--
--! @brief N-bit register comprised of multi-port D-type flip-flop with 
--! synchronous reset (acrtive-high). DATA_WIDTH controls the width of the 
--! register.
--------------------------------------------------------------------------------
-- Targeted device: Generic
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
 
--! @brief N-bit register comprised of multi-port D-type flip-flop with 
--! synchronous reset (acrtive-high). DATA_WIDTH controls the width of the 
--! register.
entity n_bit_register is
    generic (
        G_DATA_WIDTH : integer := 4
    );
    port (
        i_clock : in std_logic; --! Clock input
        i_reset : in std_logic; --! Active-high reset
        i_data  : in std_logic_vector(G_DATA_WIDTH-1 downto 0); --! N-bit data input
        o_data  : out std_logic_vector(G_DATA_WIDTH-1 downto 0) --! N-bit data output
    );
end entity;
 
--! @brief Architecture definition of the N-bit register
architecture behaviour of n_bit_register is

begin
    
    --! @brief Multi-port D-type flip-flop with synchronous reset (active-high)
    process(i_clock)
    begin
        if rising_edge(i_clock) then
            if (i_reset = '1') then
                o_data <= (others => '0');
            else
                o_data <= i_data;
            end if;
        end if;
    end process;

end architecture;