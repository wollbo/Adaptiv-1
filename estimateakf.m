function [ryy, rxy] = estimateakf(y, e, N)
%y(n) = x(n) + e(n)
%y is measurements, x is desired signal, e is noise
%N is the length of the estimated autocorrelations
y = y(1:length(e));

ryy = xcorr(y, N-1);
ree = xcorr(e, N-1);
rye = xcorr(y, e, N-1);
rey = xcorr(e, y, N-1);

mid = floor(length(ryy)/2)+1;
ryy = ryy(mid:end);
ree = ree(mid:end);
rey = rey(mid:end);
rye = rye(mid:end);

rxy = ryy - rey;
figure()
hold on
plot(ryy)
plot(ree)
plot(rey)
plot(rye)
legend('ryy', 'ree', 'rey', 'rye')
end

