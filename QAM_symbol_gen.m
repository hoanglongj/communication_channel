function [yout,SymbolWord] = QAM_symbol_gen(symbols,QAM_AB)
%QAM_SYMBOL_GEN QAM-modulation symbol generator
%   YOUT,SYMBOLWORD = QAM_SYMBOL_GEN(SYMBOLS,QAM_AB) returns a YOUT matrix of SYMBOLS number of 
%   random complex symbols which are given by the QAM alphabet QAM_AB. SYMBOLWORD is the corresponding
%   index matrix of the generated symbols
	ConstPoints = length(QAM_AB);
 	SymbolWord = randi(ConstPoints,1,symbols);
  	yout = QAM_AB(SymbolWord);  
end
