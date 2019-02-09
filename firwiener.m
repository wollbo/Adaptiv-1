function [xhat, H, thetaopt] = firwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))

sigmaYY = toeplitz(ryy);
sigmaYx = rxy;

thetaopt = sigmaYY \ sigmaYx;

xhat = filter(thetaopt, 1, y);

%Get filter frequency response
fftlen = 1024;
H = fft(firparams, fftlen);
end

