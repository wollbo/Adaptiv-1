function [phiyynum, phiyyden, phieenum, phieeden, ryy, ree] = estimateSpectra(y, e, Nar, Nr)

%ary = ar(y, N);
%are = ar(e, N);

ryy = xcorr(y, 'biased', Nar-1);
ree = xcorr(e, 'biased', Nar-1);
%mid = floor(length(ryy)/2)+1;
ryy = ryy(floor(length(ryy)/2)+1:end);
ree = ree(floor(length(ree)/2)+1:end);

[ary,Ey] = levinson(ryy, Nar-1);
[are,Ee] = levinson(ree, Nar-1);
sigy = ryy(1) - ary(2:end)*ryy(2:Nar);
sige = ree(1) - are(2:end)*ree(2:Nar);
ryy = ar2cov(ary, Ey, Nr);
ree = ar2cov(are, 4*Ee, Nr);

[phiyynum, phiyyden] = filtspec(ary,1, Ey);
[phieenum, phieeden] = filtspec(are,1, Ee);


end

