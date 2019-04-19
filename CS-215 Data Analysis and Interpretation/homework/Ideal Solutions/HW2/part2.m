clear;
close all;
clc;

im = double(imread('parrots.png'));
[H,W] = size(im);

X1 = im(1:H,1:W-1); X1 = X1(:);
X2 = im(1:H,2:W); X2 = X2(:);

cc = dot(X1-mean(X1),X2-mean(X2))/(norm(X1-mean(X1))*norm(X2-mean(X2)));
fprintf ('\nCorrelation coefficient (natural image) = %f',cc);

p12 = joint_hist(X1,X2,10);
p1 = sum(p12,1);
p2 = sum(p12,2);
QMI = sum(sum( (p12-p1*p2).^2));
AMI = sum(sum(abs(p12-p2*p1)));
fprintf('\nQMI = %f, AMI = %f',QMI,AMI);

%%%%%%%%%

im = im(randperm(H*W));
im = reshape(im,H,W);
X1 = im(1:H,1:W-1); X1 = X1(:);
X2 = im(1:H,2:W); X2 = X2(:);

cc = dot(X1-mean(X1),X2-mean(X2))/(norm(X1-mean(X1))*norm(X2-mean(X2)));
fprintf ('\nCorrelation coefficient (scrambled image) = %f',cc);

p12 = joint_hist(X1,X2,10);
p1 = sum(p12,1);
p2 = sum(p12,2);
QMI = sum(sum( (p12-p1*p2).^2));
AMI = sum(sum(abs(p12-p2*p1)));
fprintf('\nQMI = %f, AMI = %f',QMI,AMI);

%%%%%%%%%%

im = 255*rand(H,W);
X1 = im(1:H,1:W-1); X1 = X1(:);
X2 = im(1:H,2:W); X2 = X2(:);

cc = dot(X1-mean(X1),X2-mean(X2))/(norm(X1-mean(X1))*norm(X2-mean(X2)));
fprintf ('\nCorrelation coefficient (noise image) = %f',cc);

p12 = joint_hist(X1,X2,10);
p1 = sum(p12,1);
p2 = sum(p12,2);
QMI = sum(sum( (p12-p1*p2).^2));
AMI = sum(sum(abs(p12-p2*p1)));
fprintf('\nQMI = %f, AMI = %f',QMI,AMI);
