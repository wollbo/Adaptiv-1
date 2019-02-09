function [xhat, H] = cwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))

ryyplus = specfac(ryy');
ryyminus = polystar(ryyplus);

% causal part
[causnum, causden] = pos(rxy, ryyminus);

B = causnum;
A = causden .*ryyplus;

H = B ./ A;
xhat = filter(B, A, y);
end
