%% picks out e(n) %%

[z, fs] = audioread('EQ2401project1data2019.wav');
p = 20;

[y,e] = separate(z);

[a_noise,E_noise] = aryule(e,p);
[a_signal,E_signal] = aryule(y,p);

[PhixyNum, PhixyDen, PhiyyNum, PhiyyDen] = spec_add(a_signal, E_signal, a_noise, E_noise);

Hnum = conv(PhixyNum, PhiyyDen)
Hden = conv(PhixyDen, PhiyyNum)

z_filt = ncfilt(Hnum,Hden,z)
soundsc(z_filt)

%soundsc(z_act)



%% Observation: most noise seems to be confined at frequencies lower than 120 Hz