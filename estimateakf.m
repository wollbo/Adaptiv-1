function [ryy, rxy] = estimateakf(y, e, N)
%y(n) = x(n) + e(n)
%y is measurements, x is desired signal, e is noise
%N is the length of the estimated autocorrelations

%ryy_old = autocorr(y, 'NumLags', N-1);
ryy = xcorr(y, N-1, 'coeff');
ryy = ryy(floor(length(ryy)/2)+1:end);
%assert(isequal(ryy, ryy_old));

%ree_old = autocorr(e, 'NumLags', N-1);
ree = xcorr(e, N-1, 'coeff');
ree = ree(floor(length(ree)/2)+1:end);

rxy = ryy - ree;
end

