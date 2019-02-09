function [ryy, rxx] = estimateakf(y, e, N)
%y(n) = x(n) + e(n)
%y is measurements, x is desired signal, e is noise
%N is the length of the estimated autocorrelations

ryy = xcorr(y, N-1, 'biased');
ree = xcorr(e, N-1, 'biased');
rye = xcorr(y, e, N-1);
rey = xcorr(e, y, N-1);

mid = floor(length(ryy)/2)+1;
ryy = ryy(mid:end);
ree = ree(mid:end);
rey = rey(mid:end)/(N-1);
rye = rye(mid:end)/(N-1);

rxx = ryy + ree - rey - rye;
end

