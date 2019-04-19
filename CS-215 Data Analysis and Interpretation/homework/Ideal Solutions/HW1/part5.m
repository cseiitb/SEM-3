clear;
clc;

A = dlmread('LifeExpectancy.txt');

mu = mean(A);
stdval = std(A);
n = length(A);

for k=1:5
    bound_empirical(k) = length(find(abs(A-mu) <= k*stdval))/n;  
    bound_chebyshev(k) = 1-1/k^2;
end

plot([1:5],bound_empirical,'k',[1:5],bound_chebyshev,'r');