%% picks out e(n) %%

[z, fs] = audioread('EQ2401project1data2019.wav');
p = 20;

[y,e] = separate(z);

[ryy, rxy] = estimateakf(y, e, p);
[a_noise,E_noise] = levinson(rxy);
[a_signal,E_signal] = levinson(ryy);
% are = ar(e, 30);
% ary = ar(y, 30);

[PhixyNum, PhixyDen, PhiyyNum, PhiyyDen] = spec_add(a_signal, E_signal, a_noise, E_noise);

Hnum = conv(PhixyNum, PhiyyDen);
Hden = conv(PhixyDen, PhiyyNum);

z_filt = ncfilt(Hnum,Hden,z);
soundsc(z_filt)

H = 1
plotFilterResults(z, e, z_filt, H, fs)

%soundsc(z_act)



%% Observation: most noise seems to be confined at frequencies lower than 120 Hz