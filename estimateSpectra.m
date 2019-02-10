function [phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden, ryy, ree] = estimateSpectra(y, e, Nar, Nr)

%ary = ar(y, N);
%are = ar(e, N);

ryy = xcorr(y, 'biased', Nar-1);
ree = xcorr(e, 'biased', Nar-1);
%mid = floor(length(ryy)/2)+1;
ryy = ryy(floor(length(ryy)/2)+1:end);
ree = ree(floor(length(ree)/2)+1:end);
rxx = ryy - ree;

[ary,Ey] = levinson(ryy, Nar-1);
[are,Ee] = levinson(ree, Nar-1);
[arx,Ex] = levinson(rxx, Nar-1);
sigy = ryy(1) - ary(2:end)*ryy(2:Nar);
sige = ree(1) - are(2:end)*ree(2:Nar);
sigx = rxx(1) - arx(2:end)*rxx(2:Nar);
% ryy = ar2cov(ary, sigy, Nr);
% ree = ar2cov(are, sige, Nr);
% rxx = ar2cov(arx, sigx, Nr);

[phiyynum, phiyyden] = filtspec(1,ary, sigy);
[phieenum, phieeden] = filtspec(1,are, sige);
[phixxnum, phixxden] = filtspec(1,arx, sigx);
end

