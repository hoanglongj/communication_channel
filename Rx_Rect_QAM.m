function Signal_Vector = Rx_Rect_QAM(Esig,symbols,TransferFunction,BaudRate,SampleRate)      

%% Matched filtering of the incoming signal
Esig_Filtered = Filter(Esig,TransferFunction,SampleRate);

%% Downsampling the filtered signals by taking the centered sample of each symbol
n=1:symbols;
k = int32(n*SampleRate/BaudRate-SampleRate/BaudRate/2);               % center of the symbol
Signal_Vector(n) = Esig_Filtered(k);                                  % sampling the filtered signal

end
