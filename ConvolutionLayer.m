%
%  ConvolutionLayer.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function c_n = ConvolutionLayer(x_n,D_n)
% this function is aim to calculate the c in the n th Convolution layer
% input: 
% x_n is the value from the n th reconstuction layer
% D_n is a transform matrix for a filtering operation such as DWT,DCT.
% L is the number of z in column, which has been definited before.
L = size(D_n,2);
c_n = cell(L,1);
for l = 1:L
    c_n{l} = D_n{l}*x_n;
end

%Tips: This function is likely to be rewrite using matrix multiplication
%But I just coded it according to the paper's formula.