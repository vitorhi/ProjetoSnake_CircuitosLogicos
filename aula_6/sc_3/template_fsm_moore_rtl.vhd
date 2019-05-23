LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY <nome_entidade> IS
	PORT ( 	rst			: IN STD_LOGIC;
			clk 		: IN STD_LOGIC;
			
			entrada0 	: IN <tipo de dado>;
			...
			entradaN 	: IN <tipo de dado>;
			
			saida0 		: OUT <tipo de dado>;
			..
			saidaN 		: OUT <tipo de dado>);
END <nome_entidade>;

ARCHITECTURE <nome_arquitetura> OF <nome_entidade> IS
	TYPE state_type IS (estado0, estado1, estado2,.......,estadoN);  // veja quantos estados hah no seu projeto
	SIGNAL state, next_state : state_type;
	
BEGIN
	------------------------Lógica Sequencial-----------------------
	SEQ: PROCESS (rst, clk)
	BEGIN
		IF (rst='1') THEN
			state <= estado0;
		ELSIF Rising_Edge(clk) THEN
			state <= next_state;
		END IF;
	END PROCESS SEQ;
	-----------------------Lógica Combinacional do estado siguinte--
	COMB: PROCESS (entrada0,..,entradaN, state)  // completar com sinais de entrada + state
	BEGIN
		CASE state IS
	// para cada estado, preencha as condicoes para transicao de estado
			WHEN estado0 =>
				IF ( entrada0 = ………) THEN
					next_state <= estado1;
				ELSE ...
					next_state <= estado0;
				END IF;
			WHEN estado1 =>
				next_state <= estado2;
			...
			...
			WHEN estadoN =>
				IF ( entradaN = ………) THEN
					next_state <= estado0;
				ELSE ...
					next_state <= estadoN;
				END IF;
		END CASE;
	END PROCESS COMB;

	-----------------------Lógica Combinacional saidas---------------------
	SAI: PROCESS (state)
	BEGIN
		CASE state IS
// para cada estado, defina as atribuicoes de saida (*de todos os sinais*)
			WHEN estado0 =>
				saida1 <= <valor>;
				...
				saidaN <= <valor>;
			WHEN estado1 =>
				saida1 <= <valor>;
				...
				saidaN <= <valor>;
			...
			...				
			WHEN estadoN =>
				saida1 <= <valor>;
				...
				saidaN <= <valor>;
			
		END CASE;
	END PROCESS SAL;

END <nome_arquitetura>;