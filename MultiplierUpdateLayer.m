%
%  MultiplierUpdateLayer.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function beta_n = MultiplierUpdateLayer(last_beta,nung_n,c_n,z_n,L)
% This function is aim to calculate the beta in the NonlinearTransform Layer
% input: c_n is the return value of n th Convolution Layer
% last_beta is the value of n-1 th Multiplier update Layer
% nung_n is the learnable parameter
% z_n is the return value of n th Nonlinear Transform Layer
% L is the number of z in column, which has been definited before.
for l = 1:L
  beta_n(l) = last_beta(l) + nung_n(l)*(c_n(l)-z_n(l));
end
% Tips: Almost every layer has to use the varible L, 
% so I wonder if it can be optimized. However, the meaning of this L is unclear.