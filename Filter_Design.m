%filter order
N = 100;        
%sample frequency
Fs = 40;
%passband-edge frequency 
Fp = 1.5;
%passband ripple 
Ap = 0.01; 
%stopband attenuation
Ast = 96;

%Obtaining the maximum deviation for the passband and stopband ripples in linear units
Rp = (10^(Ap/20) - 1)/(10^(Ap/20) + 1); 
Rst = 10^(-Ast/20);

%Designing the filter and viewing the magnitude frequency response
NUM = firceqrip(N,Fp/(Fs/2),[Rp Rst],'passedge');
fvtool(NUM,'Fs',Fs)

