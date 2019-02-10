function [ryy, ree, rxx] = estimateakf(y, e, N)
%y(n) = x(n) + e(n)
%y is measurements, x is desired signal, e is noise
%N is the length of the estimated autocorrelations
%y = y(1:length(e));

ryy = xcorr(y, y, N-1, 'biased');
ree = xcorr(e, e, N-1, 'biased');

% py = abs(fft(y)).^2;
%win = hanning((N-1)*2 + 1);

%mid = floor(length(ryy)/2)+1;
%win = win(mid:end);
ryy = ryy(floor(length(ryy)/2)+1:end);
ree = ree(floor(length(ree)/2)+1:end);
rxx = ryy - ree;

% figure()
% hold on
% plot(ryy)
% plot(ree)
% legend('ryy', 'ree')
% plot(abs(fft(ree)))
end

