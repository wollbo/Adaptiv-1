function plotSpec(ynum, yden, enum, eden, xnum, xden, Fs)

fftlen = 1024;
[Hy,~] = freqz(ynum,yden,fftlen);
[He,~] = freqz(enum,eden,fftlen);
[Hx,~] = freqz(xnum,xden,fftlen);
nu = linspace(0, 0.5*Fs, fftlen);

figure()
hold on
plot(nu, 20*log10(abs(Hy)));
plot(nu, 20*log10(abs(He)));
plot(nu, 20*log10(abs(Hx)));

xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')
legend({'\(\Phi_{yy}(f)\)', '\(\Phi_{ee}(f)\)', '\(\Phi_{xx}(f)\)'}, 'FontSize', 16)
grid on
box off
hold off
end