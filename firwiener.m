function [xhat, thetaopt] = firwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))

sigmaYY = toeplitz(ryy);
sigmaYx = rxy;

thetaopt = sigmaYY \ sigmaYx;

xhat = filter(thetaopt, 1, y);
end

