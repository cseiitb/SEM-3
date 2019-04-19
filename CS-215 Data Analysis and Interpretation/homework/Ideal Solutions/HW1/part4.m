clear;
clc;

x = -10:0.02:10;
y = (5*sin(2*x+pi/3));
n = length(y);

rand_indices = randperm(n);
rand_indices = rand_indices(1:40);
z = y;
z(rand_indices) = z(rand_indices) + 5*rand(1,40)+5;

w = z;
w2 = z;
for i=1:n
    neigh_indices = max([1,i-8]):min([n,i+8]);
    w(i) = median(z(neigh_indices));    
    w2(i) = mean(z(neigh_indices));    
end

plot(x,y,'b',x,z,'r',x,w,'k',x,w2,'g');
legend('original','corrupted','median filtered','mean filtered');
fprintf ('\nMSE with median = %f, with mean = %f',mean((w-y).^2),mean((w2-y).^2));