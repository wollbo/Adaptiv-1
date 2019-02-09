%% Adaptiv-1
%% main

[z, fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);

delay = 20;

[ryy, rxy] = estimateakf(y, e, delay);


%% FIR
[xhatfir, thetaopt] = firwiener(z, ryy, rxy);
soundsc(xhatfir)

%% Non-causal

xhatncw = ncwiener(z, ryy, rxy);
soundsc(xhatncw)

%% Causal

xhatcw = cwiener(z, ryy, rxy);
soundsc(xhatcw)




