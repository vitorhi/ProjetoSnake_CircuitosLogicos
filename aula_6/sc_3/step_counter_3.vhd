LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY step_counter_3 IS
	PORT ( 	rst			: IN STD_LOGIC;
			clk 		: IN STD_LOGIC;
			go		: in STD_LOGIC;
			cnt_rdy	: out STD_LOGIC;
			cnt_value	: out UNSIGNED(7 downto 0));
			
END step_counter_3;

ARCHITECTURE test_state OF step_counter_3 IS
	TYPE state_type IS (INIT_ACTIVATION, FOOD_ACTIVATION, IDLE,STEP_ACTIVATION,GAME_OVER);  --// veja quantos estados hah no seu projeto
	SIGNAL state, next_state : state_type;
	
BEGIN
	------------------------Lógica Sequencial-----------------------
	SEQ: PROCESS (rst, clk)
	BEGIN
		IF (rst='1') THEN
			state <= INIT_ACTIVATION;
		ELSIF Rising_Edge(clk) THEN
			state <= next_state;
		END IF;
	END PROCESS SEQ;
	-----------------------Lógica Combinacional do estado siguinte--
	COMB: PROCESS (fsm_i_done,fsm_f_done,fsm_i_start,fsm_f_start,fsm_s_start,con_sel,cnt_rdy,fsm_s_game_over,cmp_food_flag,fsm_s_done, state)  // completar com sinais de entrada + state
	BEGIN
		CASE state IS
	--// para cada estado, preencha as condicoes para transicao de estado
			WHEN INIT_ACTIVATION =>
				IF ( fsm_i_done = '0') THEN
					next_state <= INIT_ACTIVATION;
				ELSE IF(fsm_i_done = '1')
					next_state <= FOOD_ACTIVATION;
				END IF;
				
			WHEN FOOD_ACTIVATION =>
				IF ( fsm_f_done = '0') THEN
					next_state <= FOOD_ACTIVATION;
				ELSE IF(fsm_i_done = '1')
					next_state <= IDLE;
				
				END IF;
				
			WHEN IDLE =>
				IF ( cnt_rdy = '0') THEN
					next_state <= IDLE;
				ELSE IF(cnt_rdy = '1')
					next_state <= STEP_ACTIVATION;
				END IF;	
			
			WHEN STEP_ACTIVATION =>
				IF ( fsm_s_game_over = '0' and cmp_food_flag='0' and fsm_s_done='0' ) THEN
					next_state <= STEP_ACTIVATION;
				ELSE IF(fsm_s_game_over = '0' and cmp_food_flag='0' and fsm_s_done='1')
					next_state <= IDLE;
				ELSE IF (fsm_s_game_over='0' and cmp_food_flag='1')	
					next_state<= FOOD_ACTIVATION;
				ELSE IF (fsm_s_game_over='1')	
					next_state<= GAME_OVER;	
				
				END IF;
				
		END CASE;
	END PROCESS COMB;

	-----------------------Lógica Combinacional saidas---------------------
	SAI: PROCESS (state)
	BEGIN
		CASE state IS
--// para cada estado, defina as atribuicoes de saida (*de todos os sinais*)
			WHEN INIT_ACTIVATION =>
				fsm_i_start <= '1';
				fsm_f_start <='0';
				fsm_s_start <='0';
				con_sel<= INIT_CON;
		
			WHEN FOOD_ACTIVATION =>
				fsm_i_start <= '0';
				fsm_f_start <='1';
				fsm_s_start <='0';
				con_sel<= FOOD_CON;
				
			WHEN IDLE =>
				fsm_i_start <= '0';
				fsm_f_start <='0';
				fsm_s_start <='0';
				con_sel<= STEP_CON;
				
			WHEN STEP_ACTIVATION =>
				fsm_i_start <= '0';
				fsm_f_start <='0';
				fsm_s_start <='1';
				con_sel<= STEP_CON;	
				
			WHEN GAME_OVER =>
				fsm_i_start <= '0';
				fsm_f_start <='0';
				fsm_s_start <='0';
				con_sel<= STEP_CON;
		END CASE;
	END PROCESS SAI;

END test_state;