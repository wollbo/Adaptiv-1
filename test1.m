%% picks out e(n) %%

[z, fs] = audioread('EQ2401project1data2019.wav');
z_act = z(42000:51000);
% soundsc(z_act)
%%

vs = [0:1/length(z_act):1];

z_spec = abs(fft(z_act))

plot(z)
plot(vs(1:round(end/2)), z_spec(1:round(end/2)))


%% most noise seems to be confined at frequencies lower than 120 Hz