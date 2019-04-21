entity display is
	port(y: in bit_vector(3 downto 0); 
		ctrl: in bit_vector(1 downto 0);
		dsp: out bit_vector (6 downto 0));
end display;

architecture mostrar of display is
begin  
	dsp(0)<= ((not ctrl(1) and not ctrl(0)) and (((not y(3) and not y(1)) and (y(2) xor y(0))) or ((y(3) and y(0)) and (y(2) xor y(1))))) or (ctrl(0) or ctrl(1));    
	dsp(1)<= ((not ctrl(1) and not ctrl(0)) and (((not y(3) and y(2)) and (y(1) xor y(0))) or (y(3) and not y(2) and y(1) and y(0)) or (y(3) and y(2) and not y(1) and not y(0)) or (y(3) and y(2) and y(1)))) or ctrl(1);
	dsp(2)<= ((not ctrl(1) and not ctrl(0)) and ((not y(3) and not y(2) and y(1) and not y(0)) or (y(3) and y(2) and not y(1) and not y(0)) or (y(3) and y(2) and y(1)))) or (ctrl(0) or ctrl(1));
	dsp(3)<= ((not ctrl(1) and not ctrl(0)) and ((not y(3) and not y(2) and not y(1) and y(0)) or (not y(3) and y(2) and not y(1) and not y(0)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and not y(2) and y(1) and not y(0)) or (y(3) and y(2) and y(1) and y(0)))) or (ctrl(0) or ctrl(1));
	dsp(4)<= ((not ctrl(1) and not ctrl(0)) and ((not y(3) and not y(2) and y(0)) or (not y(3) and y(2) and not y(1)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and not y(2) and not y(1) and y(0)))) or (ctrl(0) or ctrl(1));
	dsp(5)<= ((not ctrl(1) and not ctrl(0)) and ((not y(3) and not y(2) and not y(1) and y(0)) or (not y(3) and not y(2) and y(1)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and y(2) and not y(1) and y(0)))) or ctrl(1);
	dsp(6)<= ((not ctrl(1) and not ctrl(0)) and ((not y(3) and not y(2) and not y(1)) or (not y(3) and y(2) and y(1) and y(0)) or (y(3) and y(2) and not y(1) and not y(0)))) or ctrl(1);
end mostrar;
