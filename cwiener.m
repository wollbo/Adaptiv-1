function [xhat, H] = cwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))

ryyplus = specfac(ryy');
ryyminus = polystar(ryyplus);

% causal part
[causnum, causden] = pos(rxy, ryyminus);

B = causnum;
A = causden .*ryyplus;


xhat = ncfilt(B, A, y);

fftlen = 1024;
H = fft(B, fftlen)./fft(A, fftlen);
end
