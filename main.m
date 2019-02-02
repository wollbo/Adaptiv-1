%% Adaptiv-1
%% main

[y, fs] = audioread('EQ2401project1data2019.wav');
e = [y(1:4500)' y(19000:26000)' y(42000:51000)']';

delay = 50;

[ryy, ree] = estimateakf(y, e, delay);

%% FIR
[xhatfir, thetaopt] = firwiener(y, ryy, ryy-ree);

%% Non-causal

xhatncw = ncwiener(y, ryy, ryy-ree);


%% Causal






