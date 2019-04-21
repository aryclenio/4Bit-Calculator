entity Projeto is
	port (a,b: in bit_vector (3 downto 0);   --bits pra operar
			ld : in bit;                       --liga desliga
			key: in bit_vector(2 downto 0);    --chave pra mudar operação
			rsoma, rsub, rinv: out bit_vector(3 downto 0);--saidas auxiliares para testar respostas
			dsp: out bit_vector(6 downto 0);  --saidas do display
			cout, coutmai, coutmen: out bit);                    -- saida do led (cout) e saidas auxiliares para testar respostas
end Projeto;

architecture main of projeto is --Bloco do projeto

	--CÓDIGOS DA CHAVE :
	--000 : somador
	--001: subtrador
	--010: maior
	--100: menor
	--111: inversor

	component mux is 
	-- Multiplexador que recebe como entrada a operacao, a chave de operacao (s) e o bit lig/desl (ld)
	-- As saídas do multiplexador sao o resultado da operacao, o controle do display e o cout para o LED
		port(soma, subtracao, invertido : in bit_vector(3 downto 0);
			carrySoma, carrySub, maiorque, menorque, ld : in bit;
			key: in bit_vector(2 downto 0);
			resultadoDisplay: out bit_vector(3 downto 0);
			ctrl: out bit_vector(1 downto 0);			
			cout: out bit);
	end component;

	component somador is
	-- Somador completo de 4 bits, com cout significando carry out na soma
		port (a,b: in bit_vector(3 downto 0);
			s: out bit_vector(3 downto 0);
			cout:out bit);
	end component;

	component subtrador is
	-- Subtrador completo de 4 bits, com cout significando erro na subtracao
		port (a,b: in bit_vector(3 downto 0);
			s: out bit_vector(3 downto 0);
			cout:out bit);
	end component;

	component maior is
	-- Comparador completo de 4 bits, sendo cout o bit que serah verdadeiro quando for maior
		port (a,b: in bit_vector(3 downto 0);
				cout: out bit);
	end component;

	component menor is
	-- Comparador completo de 4 bits, sendo cout o bit que serah verdadeiro quando for menor
		port (a,b: in bit_vector(3 downto 0);
				cout: out bit);
	end component;

	component inversor is
	-- Inversor completo de 4 bits
		 port(a: in bit_vector(3 downto 0);
			s: out bit_vector(3 downto 0));
	end component;

	component display is  
	-- recebe o resultado da operação escolhida e codifica para o display de 7 segmentos
			port(y: in bit_vector(3 downto 0); 
				  ctrl: in bit_vector(1 downto 0);
					dsp: out bit_vector (6 downto 0));
	end component;
	
	signal resultadoSoma, resultadoSub, resultadoInvert, resultadoDisp :bit_vector (3 downto 0); --auxiliar para resultado
	signal coutSoma, coutSub, coutMaior, coutMenor: bit;
	signal controle: bit_vector(1 downto 0);
	
	begin
		som: somador port map(a => a, b => b, s => resultadoSoma, cout=> coutSoma);
		sub: subtrador port map(a => a, b => b, s => resultadoSub, cout=> coutSub);
		mais: maior port map(a => b,b => a, cout => coutMaior);
		menos: menor port map(a => a,b => b, cout => coutMenor);
		inverte: inversor port map(a => a, s => resultadoInvert);
		multiplexador: mux port map(soma => resultadoSoma, subtracao => resultadoSub, invertido => resultadoInvert, carrySoma => coutSoma, carrySub => coutSub, maiorque => coutMaior, menorque => coutMenor, ld => ld, key => key, resultadoDisplay => resultadoDisp, cout => cout, ctrl => controle);
		mostrar: display port map(y => resultadoDisp, ctrl => controle, dsp => dsp);
		--Atribuicao das variaveis auxiliares para fins de teste
		rsoma <= resultadoSoma;
		rsub <= resultadoSub;
		rinv <= resultadoInvert;
		coutmai <= coutMaior;
		coutmen <= coutMenor;
	end main;
		
		