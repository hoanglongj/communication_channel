function [yout] = Tx_Rect_QAM(QAM,RiseTime,SampleRate,BaudRate,w)
%TX_RECT_QAM Transmitter of QAM rectangular pulses
%   YOUT = TX_RECT_QAM(QAM,RISETIME,SAMPLERATE,BAUDRATE,W) does upsampling and pulse shaping for
%   the input signal QAM whose parameters are RISETIME, SAMPLERATE, BAUDRATE. W is the frequency
%   axis
  % Upsampling by the factor of SampleRate/BaudRate
  RectBitWord = (QAM'*ones(1,SampleRate/BaudRate))';
  RectBitWord = RectBitWord(:);
  % Rectangular pulse shaping with RiseTime to make it more practical  
  E_Filtered = RectShaping(RectBitWord,RiseTime,w,SampleRate);
  yout = E_Filtered;    
end
