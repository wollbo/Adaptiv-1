function [xhat, H] = cwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))

ryyplus = specfac(ryy');
ryyminus = polystar(ryyplus);

% causal part
[causnum, causden] = pos(rxy, ryyminus);

B = causnum
A = causden .*ryyplus


xhat = filter(B, A, y);

fftlen = 2^nextpow2(length(y) + length(ryy) - 1);
H = fft(B, fftlen)./fft(A, fftlen);
end
