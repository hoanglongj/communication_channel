function yout = RectShaping(Esig,RiseTime,w,SampleRate)
%RECTSHAPING Rectangular pulse shaping with risetime
%   YOUT = RECTSHAPING(ESIG,RISETIME,W,SAMPLERATE) 
                                  
    T = 4/3*RiseTime;

    PF = fft(Esig);                
    PFc = fftshift(PF)/SampleRate;
    Hfilter = exp(-(w*T/4).^2);
    PFout = ifftshift(PFc.*Hfilter);
    yout = ifft(PFout)*SampleRate;

end
