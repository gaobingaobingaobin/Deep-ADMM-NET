%
%  MultiplierUpdateLayerGradient.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function [beta2eta_gradient,beta2beta_gradient,...
    beta2c_gradient,beta2z_gradient] = MultiplierUpdateLayerGradient(...
        eta_n,beta_n,c_n,z_n,L)

    % This function is aimed to compute gradient in multiplier update layer
    % output:
    % beta2eta_gradient is the gradient between beta(n) and eta(n)
    % beta2beta_gradient is the gradient between beta(n) and beta(n-1)
    % beta2c_gradient is the gradient between beta(n) and c(n)
    % beta2z_gradient is the gradient between beat(n) and z(n)
    % input:
    % eta_n is the learnable parameter
    % beta_n is the value of n th Multiplier update Layer
    % c_n is the return value of n th Convolution Layer
    % z_n is the return value of n th Nonlinear Transform Layer
    % L is the number of z in column, which has been definited before
    I_n = eye(size(beta_n,1)) %I_n is an identity matrix sized N x N
    for l = 1:L
        beta2eta_gradient(l) = c_n(l) - z_n(l);
        beta2beta_gradient(l) = I_n;
        beta2c_gradient(l) = eta_n(l) * I_n;
        beta2z_gradient(l) = -eta_n(l) * I_n;
    end
end
