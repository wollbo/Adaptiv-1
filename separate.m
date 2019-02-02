function [y_sep, e_sep] = separate(y)

noise_indexes = [1:4500 19000:26000 42000:51000];
signal_indexes = [4501:18999 26001:41999 51001:length(y)];

e_sep = y(noise_indexes);
y_sep = y(signal_indexes);

end
