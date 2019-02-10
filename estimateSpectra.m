function [phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden] = estimateSpectra(ryy, ree, rxx, Nar)

% ryy = xcorr(y, 'biased', Nar-1);
% ree = xcorr(e, 'biased', Nar-1);
% 
% ryy = ryy(floor(length(ryy)/2)+1:end);
% ree = ree(floor(length(ree)/2)+1:end);
% rxx = ryy - ree;

[ary,~] = levinson(ryy, Nar-1);
[are,~] = levinson(ree, Nar-1);
[arx,~] = levinson(rxx, Nar-1);
sigy = ryy(1) - ary(2:end)*ryy(2:Nar);
sige = ree(1) - are(2:end)*ree(2:Nar);
sigx = rxx(1) - arx(2:end)*rxx(2:Nar);
% ryy = ar2cov(ary, sigy, Nr);
% ree = ar2cov(are, sige, Nr);
% rxx = ar2cov(arx, sigx, Nr);

[phiyynum, phiyyden] = filtspec(1,ary, sigy);
[phieenum, phieeden] = filtspec(1,are, sige);
[phixxnum, phixxden] = filtspec(1,arx, sigx);

% [phiyynum, phiyyden] = filtspec(ryy,1, 1);
% [phieenum, phieeden] = filtspec(ree,1, 1);
% [phixxnum, phixxden] = filtspec(rxx,1, 1);
end

