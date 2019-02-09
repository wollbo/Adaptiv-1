function [ryy, rxy] = estimateakf(y, e, N)
%y(n) = x(n) + e(n)
%y is measurements, x is desired signal, e is noise
%N is the length of the estimated autocorrelations
y = y(1:length(e));

ryy = xcorr(y, N-1, 'coeff');
ree = xcorr(e, N-1, 'coeff');

%win = hanning((N-1)*2 + 1);

mid = floor(length(ryy)/2)+1;
%win = win(mid:end);
ryy = ryy(mid:end);
ree = ree(mid:end);

rxy = ryy - ree;

figure()
hold on
plot(ryy)
plot(ree)
legend('ryy', 'ree')
plot(abs(fft(ree)))
end

