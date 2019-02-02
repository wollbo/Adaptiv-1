function [xhat] = cwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))
% fftlen = length(y) + length(ryy) - 1;
% 
% phiyy = fft(ryy, fftlen);
% phixy = fft(rxy, fftlen);

ryyplus = specfac(ryy');
ryyminus = polystar(ryyplus);

% causal part
[causnum, causden] = pos(rxy, ryyplus);

B = causnum;
A = causden .* ryyminus;

xhat = filter(B,A, y)
end
