%% Adaptiv-1



%% main
% run soundsc(z) for reference


[z, fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);

delay = 20;

[ryy, ree] = estimateakf(y, e, delay);


%% FIR

[xhatfir, thetaopt] = firwiener(z, ryy, ryy-ree);
soundsc(xhatfir)

%% Non-causal

xhatncw = ncwiener(z, ryy, rxy);
soundsc(xhatncw)

%% Causal

[xhatcw, H] = cwiener(z, ryy, rxy);
soundsc(xhatcw)




