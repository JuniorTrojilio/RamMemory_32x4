LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY SimulateArea IS
END SimulateArea;
ARCHITECTURE Teste OF SimulateArea IS
  COMPONENT ControlBarrage
    PORT(a4, nwe       : IN    STD_LOGIC;
         a3, a2, a1, a0: IN    STD_LOGIC;
         d3, d2, d1, d0: BUFFER STD_LOGIC);
  END COMPONENT;
  SIGNAL sa4, snwe, sa3, sa2, sa1, sa0, sd3, sd2, sd1, sd0: STD_LOGIC;
BEGIN
  t1: ControlBarrage PORT MAP(sa4, snwe, sa3, sa2, sa1, sa0, sd3, sd2, sd1, sd0);
    PROCESS
    BEGIN
      --Inicialização do sistema com out signed Parte 1
      sa4 <= '0'; snwe <= '0'; sa3 <= '0'; sa2 <= '0'; sa1 <= '0'; sa0 <= '0';
      sd3 <= '0'; sd2 <= '0'; sd1 <= '0'; sd0 <= '1';
      wait for 1 ns;
      sa4 <= '0'; snwe <= '1'; sa3 <= '0'; sa2 <= '0'; sa1 <= '0'; sa0 <= '0';
      sd3 <= '0'; sd2 <= '0'; sd1 <= '0'; sd0 <= '1';
      wait for 1 ns;
      sa4 <= '0'; snwe <= '0'; sa3 <= '0'; sa2 <= '0'; sa1 <= '0'; sa0 <= '0';
      sd3 <= '0'; sd2 <= '0'; sd1 <= '0'; sd0 <= '1';
      wait for 1 ns;
      --Inicialização do sistema com out signed Parte 2
      sa4 <= '1'; snwe <= '0'; sa3 <= '0'; sa2 <= '0'; sa1 <= '0'; sa0 <= '0';
      sd3 <= '0'; sd2 <= '0'; sd1 <= '0'; sd0 <= '0';
      wait for 1 ns;
      sa4 <= '1'; snwe <= '1'; sa3 <= '0'; sa2 <= '0'; sa1 <= '0'; sa0 <= '0';
      sd3 <= '0'; sd2 <= '0'; sd1 <= '0'; sd0 <= '0';
      wait for 1 ns;
      sa4 <= '1'; snwe <= '0'; sa3 <= '0'; sa2 <= '0'; sa1 <= '0'; sa0 <= '0';
      sd3 <= '0'; sd2 <= '0'; sd1 <= '0'; sd0 <= '0';
      wait for 1 ns;
    END PROCESS;
END Teste;