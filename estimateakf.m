function [ryy, rxy] = estimateakf(y, e, N)
%y(n) = x(n) + e(n)
%y is measurements, x is desired signal, e is noise
%N is the length of the estimated autocorrelations

ryy = autocorr(y, 'NumLags', N-1);
ree = autocorr(e, 'NumLags', N-1);
rxy = ryy - ree;
end

