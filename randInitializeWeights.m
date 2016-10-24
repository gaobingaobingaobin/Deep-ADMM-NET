%
%  ADMMNetCostFunction.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function [net] = randInitializeWeights(net)
    epsilon_init = 0.12; 
    net = rand(L_out, 1 + L_in) * 2 * epsilon_init-epsilon_init; 

end