function [ryy, ree, rxx] = estimateakf(y, e, N)
%y(n) = x(n) + e(n)
%y is measurements, x is desired signal, e is noise
%N is the length of the estimated autocorrelations

ryy = xcorr(y, y, N-1, 'biased');
ree = xcorr(e, e, N-1, 'biased');

ryy = ryy(floor(length(ryy)/2)+1:end);
ree = ree(floor(length(ree)/2)+1:end);
rxx = ryy - ree;
end

