%% picks out e(n) %%

[z, fs] = audioread('EQ2401project1data2019.wav');
p = 20;

[y,e] = separate(z);

[ryy, ree] = estimateakf(y, e, p);
a_noise = levinson(ree);
a_signal = levinson(ryy);
% are = ar(e, 30);
% ary = ar(y, 30);

e_noise = ree(1)-a_noise(2:end)*ree(2:end);
e_signal = ryy(1)-a_signal(2:end)*ryy(2:end);

[PhixyNum, PhixyDen, PhiyyNum, PhiyyDen] = spec_add(a_signal, e_signal, a_noise, e_noise);

Hnum = conv(PhixyNum, PhiyyDen);
Hden = conv(PhixyDen, PhiyyNum);

z_filt = ncfilt(Hnum,Hden,z);
soundsc(z_filt)

plotFilterResults(z, e, z_filt, H, fs)

%soundsc(z_act)



%% Observation: most noise seems to be confined at frequencies lower than 120 Hz