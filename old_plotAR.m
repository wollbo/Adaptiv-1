function plotAR(ryy, ree, rxx, Nar, Fs)
[ary,~] = levinson(ryy, Nar-1);
[are,~] = levinson(ree, Nar-1);
[arx,~] = levinson(rxx, Nar-1);
sigy = ryy(1) - ary(2:end)*ryy(2:Nar);
sige = ree(1) - are(2:end)*ree(2:Nar);
sigx = rxx(1) - arx(2:end)*rxx(2:Nar);

fftlen = 1024;
[Hy,~] = freqz(sigy,ary,fftlen);
[He,~] = freqz(sige,are,fftlen);
[Hx,~] = freqz(sigx,arx,fftlen);
nu = linspace(0, 0.5*Fs, fftlen);

figure()
hold on
plot(nu, 20*log10(abs(Hy)));
plot(nu, 20*log10(abs(He)));
plot(nu, 20*log10(abs(Hx)));

xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')
legend('AR process from y', 'AR process from e', 'AR process from x')
grid on
box off
hold off
end