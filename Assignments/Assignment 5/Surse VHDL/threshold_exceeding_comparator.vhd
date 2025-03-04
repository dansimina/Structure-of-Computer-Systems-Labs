----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2024 12:53:27 PM
-- Design Name: 
-- Module Name: threshold_exceeding_comparator - Behavioral
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
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity threshold_exceeding_comparator is
    Port (
         aclk : IN STD_LOGIC;
         s_axis_gtp_tvalid : IN STD_LOGIC;
         s_axis_gtp_tready : OUT STD_LOGIC;
         s_axis_gtp_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_gtm_tvalid : IN STD_LOGIC;
         s_axis_gtm_tready : OUT STD_LOGIC;
         s_axis_gtm_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         s_axis_threshold_tvalid : IN STD_LOGIC;
         s_axis_threshold_tready : OUT STD_LOGIC;
         s_axis_threshold_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_gtpOut_tvalid : OUT STD_LOGIC;
         m_axis_gtpOut_tready : IN STD_LOGIC;
         m_axis_gtpOut_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_gtmOut_tvalid : OUT STD_LOGIC;
         m_axis_gtmOut_tready : IN STD_LOGIC;
         m_axis_gtmOut_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         m_axis_result_tvalid : OUT STD_LOGIC;
         m_axis_result_tready : IN STD_LOGIC;
         m_axis_result_tdata : OUT STD_LOGIC     
    );
end threshold_exceeding_comparator;

architecture Behavioral of threshold_exceeding_comparator is

type state_type is (S_READ, S_WRITE);
signal state : state_type := S_WRITE;

signal res_valid : STD_LOGIC := '0';
signal result : STD_LOGIC := '0';
signal resultGTP, resultGTM : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

signal a_ready, b_ready : STD_LOGIC := '0';
signal internal_ready, external_ready, inputs_valid, external_valid : STD_LOGIC := '0';

begin
    --de continuat
    s_axis_gtp_tready <= external_ready;
    s_axis_gtm_tready <= external_ready;
    s_axis_threshold_tready <= external_ready;
    
    internal_ready <= '1' when state = S_READ else '0';
    inputs_valid <= s_axis_gtp_tvalid and s_axis_gtm_tvalid and s_axis_threshold_tvalid;
    external_ready <= internal_ready and inputs_valid;
    
    external_valid <= '1' when state = S_WRITE else '0';
    
    m_axis_gtpOut_tvalid <= external_valid;
    m_axis_gtmOut_tvalid <= external_valid;
    m_axis_result_tvalid <= external_valid;
    m_axis_gtpOut_tdata <= resultGTP;
    m_axis_gtmOut_tdata <= resultGTM;
    m_axis_result_tdata <= result;
    
    process(aclk)
    begin
        if rising_edge(aclk) then
            case state is
                when S_READ =>
                    if external_ready = '1' and inputs_valid = '1' then
                        if (s_axis_gtp_tdata > s_axis_threshold_tdata) or (s_axis_gtm_tdata > s_axis_threshold_tdata) then
                            result <= '1';
                            resultGTP <= (others => '0');
                            resultGTM <= (others => '0');
                        else
                            result <= '0';
                            resultGTP <= s_axis_gtp_tdata;
                            resultGTM <= s_axis_gtm_tdata;
                            
                        end if;
                        state <= S_WRITE;
                    end if; 
                when S_WRITE =>  
                    if m_axis_result_tready = '1' and m_axis_gtpOut_tready = '1' and m_axis_gtmOut_tready = '1' then
                        state <= S_READ;
                    end if;
            end case;      
        end if;
    end process;


end Behavioral;
