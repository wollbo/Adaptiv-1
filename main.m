%% Adaptiv-1
%% main

[z, fs] = audioread('EQ2401project1data2019.wav');
e = [z(1:4500)' z(19000:26000)' z(42000:51000)']';


%% FIR

[rzz, ree] = estimateakf(z, e, 100);
[xhat, thetaopt] = firwiener(z, rzz, rzz-ree);

%% IIR





%% Causal




