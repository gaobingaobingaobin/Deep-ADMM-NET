%
%  ConvolutionLayerGradient.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function [c2w_gradient,c2x_gradient] = ConvolutionLayerGradient(x_n,D_n,L)
    % This function is aimed to compute the gradient of convolution layer
    % output:
    % c2w_gradient is the gradient between c(n) and w(n)
    % c2x_gradient is the gradinet between c(n) and x(n)
    % input:
    % x_n is the value of n th reconstuction layer
    % D_n is a transform matrix for a filtering operation such as DWT,DCT.
    % L is the number of z in column, which has been definited before.
    length = size(x_n,1);
    c2w_gradient = zeros(length,1);
    c2x_gradient = zeros(length,1);
    B_m = zeros(size(c_n)); %B_m is a DCT basis,but I am not sure 
    I_n = eye(size(c_n)); % I_n is an identify matrix
    for l = 1:L
        c2w_gradient(l) = B_m * x_n; 
        c2x_gradient(l) = D_n(l) * I_n;
    end
    % tips: I am not sure whether I should use for loop
end
