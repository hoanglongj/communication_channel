%% Digital transmission of rectangular pulses
% This file simulates the digital transmission of rectangular pulses
% Note: Noiseless transmission

%% Parameters declaration 
clear all; close all; clc;
M = 16;                                             	% Modulation order
symbols = 16;                                     	% Total no. of symbols
BaudRate = 28e9;                                    	% Baud rate
SimulWind = symbols/BaudRate;                       	% Simulation time
SampleRate = 1024*BaudRate;                         	% Sampling freq            
ws = 2*pi*SampleRate;                               	% Sampling freq (rad/s)
sps = round(SampleRate/BaudRate);                   	% No. samples/symbol
NSamples = SimulWind*SampleRate;                    	% Total no. of samples
time = linspace(0,SimulWind-1/SampleRate,NSamples); 	% Time axis
w = ws*(-NSamples/2:(NSamples/2-1))/NSamples;       	% Freq axis (rad/s)       
f = w/(2*pi);                                   	% Freq axis
T = 1/BaudRate;                                     	% Symbol time
Pref_dBm = 10;                                      	% Input power in dBm
Pref = 10^(Pref_dBm/10)*1e-3;                       	% Input power in W    

%% Filter
% Frequency response of the filter
% Note: Consider ideal filter, sinc shaped, in this case
TF = sinc(f*T);

%% Alphabet generation 
QAM_AB = QAM_mod(M);                           

%% Complex symbol stream generation
[QAM,SymbolWord_QAM] = QAM_symbol_gen(symbols,QAM_AB); 

%% Rectangular pulse generation
RiseTime = 1/(1024*BaudRate);                     	% Short rise time
E_qam_rect = Tx_Rect_QAM(QAM,RiseTime,SampleRate,BaudRate,w);

%% Power normalization
Psig_avg = mean(abs(E_qam_rect).^2);
E_qam_ref = E_qam_rect * sqrt(Pref/Psig_avg); 

%% Transmitter
E_qam_Tx = E_qam_ref;

%% Receiver
E_qam_Rx = E_qam_Tx;    
Signal_Vector_qam = Rx_Rect_QAM(E_qam_Rx,E_qam_ref,symbols,TF_out,BaudRate,SampleRate);
[SER,Num_of_Errors] = SER_Estim(Signal_Vector_qam,QAM_AB,symbols,SymbolWord_QAM);
