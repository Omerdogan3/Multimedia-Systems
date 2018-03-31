%function [gaussian]= Gaussian1D(sigma)
clc;
clear;

sigma=5;
X=ceil(-100*sigma):floor(100*sigma); %ceil only makes the rounding operaiton.
gaussian=exp(-1*(((X.^2))/(2*sigma.^2)));
gaussian=gaussian/sum(gaussian);
x = -100:1:100;
y = exp(-x.^2/sigma^2);

%shortcut version for gaussian function implementation.
p = -100:1:100;
q = gaussmf(p,[sigma 0]);

subplot(121);plot(x,y)
xlabel('x-axis (m)')
title('myGaussian')
subplot(122);plot(p,q);
xlabel('x-axis (m)')
title('built-in gaussian')