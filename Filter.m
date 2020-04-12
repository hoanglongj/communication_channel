function yout=Opt_Filter(Ein,TransferFunction,SampleRate)

%% 
%% H sygkekrimenh synarthsh lamvanei dothen transfer function kai to xrhshmopoiei prokeimenou na filtrarei ena input signal
%%

PF=fft(Ein);                                                    % compute the fft of the amplitude envelope
PFc=fftshift(PF)/SampleRate;                                     % shift and scale
PFout=ifftshift(PFc.*TransferFunction)*SampleRate;
yout=ifft(PFout);
end