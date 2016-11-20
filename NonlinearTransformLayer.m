%
%  NonlinearTransformLayer.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.


function z_n = NonlinearTransformLayer(c_n,last_beta,q)
% This function is aim to calculate the z in the NonlinearTransform Layer
% input: c_n is the return value of n th Convolution Layer
% last_beta is the value of n-1 th Multiplier update Layer
% q is a Nc*L matrix deciding the values in y axis of PLF
% L is the number of z in column, which has been definited before.
L = size(q,2);
z_n = cell(L,1);    
for l =1:L
        z_n{l} = PLF(c_n{l}+last_beta{l},q{l});
end
end
