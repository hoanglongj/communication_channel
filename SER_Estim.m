function [SER,Num_of_Errors,ind_2]=SER_Estim(Signal,QAM_AB,NumSymbol,SymbolWord)
%%
%%
%% Calculation of Symbol Error Rate
%%
P_sig=mean(abs(Signal).^2);
P_qamAB=mean(abs(QAM_AB).^2);
Signal_qam=Signal./sqrt(P_sig);
QAM_AB=QAM_AB./sqrt(P_qamAB);

ConstSize=length(QAM_AB);
sn_block=repmat(Signal_qam,ConstSize,1);
konst_block=repmat(QAM_AB,NumSymbol,1).';
distance = abs(sn_block-konst_block);  	%% matrix, whose every column contains the received symbol distances to all possible symbol constellation points
[y,ind_2] = min(distance,[],1); 		%% returns the minimum distance y and the corresponding constellation index ind_2.
qam_det = QAM_AB(ind_2);  			    %% using vector ind_2, we can determine the detected symbol vector

Num_of_Errors=sum(ind_2~=SymbolWord);
SER=Num_of_Errors./NumSymbol;

end