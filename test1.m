%% picks out e(n) %%

[y, fs] = audioread('EQ2401project1data2019.wav');


e_act = [y(1:4500)' y(19000:26000)' y(42000:51000)']';
%soundsc(z_act)

[ryy, rxy] = estimateakf(y, z_act, 10);
a = filter(rxy, ryy, y); % ncwiener

%%
figure(1)
spectralplot(b)
title('noise')

%% Observation: most noise seems to be confined at frequencies lower than 120 Hz