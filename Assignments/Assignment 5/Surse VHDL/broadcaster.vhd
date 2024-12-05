----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2024 01:23:13 PM
-- Design Name: 
-- Module Name: broadcaster - Behavioral
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

entity broadcaster is
    PORT (
    aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis1_tvalid : OUT STD_LOGIC;
    m_axis1_tready : IN STD_LOGIC;
    m_axis1_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); 
    m_axis2_tvalid : OUT STD_LOGIC;
    m_axis2_tready : IN STD_LOGIC;
    m_axis2_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
end broadcaster;

architecture Behavioral of broadcaster is

type state_type is (S_READ, S_WRITE);
signal state : state_type := S_READ;

signal res_valid : STD_LOGIC := '0';
signal result : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

signal a_ready, b_ready : STD_LOGIC := '0';
signal internal_ready, external_ready, external_valid, inputs_valid : STD_LOGIC := '0';

begin

    s_axis_tready <= external_ready;
    
    internal_ready <= '1' when state = S_READ else '0';
    inputs_valid <= s_axis_tvalid;
    external_ready <= internal_ready and inputs_valid;

    external_valid <= '1' when state = S_WRITE else '0';
    m_axis1_tvalid <= external_valid;
    m_axis2_tvalid <= external_valid;
    m_axis1_tdata <= result;
    m_axis2_tdata <= result;
    
    process(aclk)
    begin
        if rising_edge(aclk) then
            case state is
                when S_READ =>
                    if external_ready = '1' and inputs_valid = '1' then
                        result <= s_axis_tdata;
                        state <= S_WRITE;
                    end if; 
                when S_WRITE =>  
                    if m_axis1_tready = '1' and m_axis2_tready = '1' then
                        state <= S_READ;
                    end if;
            end case;      
        end if;
    end process;

end Behavioral;
