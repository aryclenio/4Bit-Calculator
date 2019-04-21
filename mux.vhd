entity mux is
	port (soma, subtracao, invertido : in bit_vector(3 downto 0);
			carrySoma, carrySub, maiorque, menorque, ld : in bit;
			key: in bit_vector(2 downto 0);
			resultadoDisplay: out bit_vector(3 downto 0);
			ctrl: out bit_vector(1 downto 0);			
			cout: out bit);
end mux;

--CÓDIGOS DA CHAVE :
	--000 : somador
	--001: subtrador
	--010: maior
	--100: menor
	--111: inversor

architecture mult of mux is
begin 
	--resultado do display, na ordem: soma, subtracao, inversao
	resultadoDisplay(0) <= (ld and (not key(0) and not key(1) and not key(2)) and (soma(0))) or (ld and (key(0) and not key(1) and not key(2)) and (subtracao(0))) or (ld and (key(0) and key(1) and key(2)) and (invertido(0)));
	resultadoDisplay(1) <= (ld and (not key(0) and not key(1) and not key(2)) and (soma(1))) or (ld and (key(0) and not key(1) and not key(2)) and (subtracao(1))) or (ld and (key(0) and key(1) and key(2)) and (invertido(1)));
	resultadoDisplay(2) <= (ld and (not key(0) and not key(1) and not key(2)) and (soma(2))) or (ld and (key(0) and not key(1) and not key(2)) and (subtracao(2))) or (ld and (key(0) and key(1) and key(2)) and (invertido(2)));
	resultadoDisplay(3) <= (ld and (not key(0) and not key(1) and not key(2)) and (soma(3))) or (ld and (key(0) and not key(1) and not key(2)) and (subtracao(3))) or (ld and (key(0) and key(1) and key(2)) and (invertido(3)));
	-- resultado para led cout, na ordem: soma, subtracao, inversao, maior, menor
	cout <= (ld and (not key(0) and not key(1) and not key(2)) and carrySoma) or (ld and (key(0) and not key(1) and not key(2)) and carrySub) or (ld and (not key(0) and key(1) and not key(2)) and maiorque) or (ld and (not key(0) and not key(1) and key(2)) and menorque);

	
	ctrl(0) <=(carrySub and (key(0) and not key(1) and not key(2)))or  
	          (key(0) and ((key(1)and not key(2))or (not key(1)and key(2)))) or 
				 (not key(0)and key(1)and key(2));   
				 
	ctrl(1) <= not ld or (not key(0) and key(1) and not key(2)) or (not key(0) and not key(1) and key(2));
	
	
end mult;
