%
%  ADMMNetCostFunction.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function W = randInitializeWeights(L_in, L_out)

    epsilon_init = 0.12; 
    W = rand(L_out, 1 + L_in) * 2 * epsilon_init-epsilon_init; 

end