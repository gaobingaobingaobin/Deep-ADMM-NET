%
%  NonlinearTransformLayerGradient.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function [z2q_weight,z2beta_weight,z2c_weight] = NonlinearTransformLayerGradient(c_n,last_beta,z_n,p,q,L)
    % This function is aimed to compute the gradient of nonlinera thansform layer
    % output:
    % z2q_weight is the weight between z(n) and q(n)
    % z2beta_weight is the weight between z(n) and beta(n)
    % z2c_weight is the weight between z(n) and c(n)
    % input:
    % c_n is the value of n th convolution layer
    % last_beta is the value of n-1 th Multiplier update Layer
    % p is the number of interval that belongs to [-1,1]
    % q is a Nc*L matrix deciding the values in y axis of PLF
    % L is the number of z in column, which has been definited before.
    
    % init the params
    z2q_weight = zeros(L,size(p));
    z2beta_weight = zeros(L,size(p));
    z2c_weight = zeros(L,size(p));

    % tips: maybe have some problems
    for l = 1:L
        for index = 1:size(c_n,1)
            i = fix((c_n(l,index)+last_beta(l,index)-p(i))./(p(2)-p(1)));
            if (c_n(l,index)+last_beta(l,index) < p(1))
                z2q_weight(l,i) = 0;
                z2beta_weight(l,i) = 1;
            elseif(c_n(l,index)+last_beta(l,index) > p(end))
                z2q_weight(l,i) = 0;
                z2beta_weight(l,i) = 1;    
            else
                z2q_weight(l,i) = 1 - (c_n(l,index)+last_beta(l,index)-p(i))./(p(2)-p(1));
                z2q_weight(l,i) = (q(i+1)-q(i))./(p(2)-p(1));
            end
        end

        z2c_weight(l) = z2beta_weight(l);
    end

end