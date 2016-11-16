%
%  ADMMNetCostFunction.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function [net] = randInitializeWeights(net)
    epsilon_init = 0.12; 

    % initialize M layer to X layer weights
    for i = 1:size(net.m2x_weight,1)
        net.m2x_weight(i) = {}; 
    end

    % initalize M layer to C layer weights
    for i = 1:size(net.m2c_weight,1) 
        net.m2c_weight(i) = {};
    end
    
    for i = 1:size(net.m2m_weight,1)
        net.m2m_weight(i) = {};
    end
    
    for i = 1:size(net.c2m_weight,1)
        net.c2m_weight(i) = {};
    end
    
    for i = 1:size(net.z2z_weight,1)
        net.z2z_weight(i) = {};
    end
    
    for i = 1:size(net.x2c_weight,1)
        net.x2c_weight(i) = {};
    end
    
    for i = 1:size(net.c2z_weight,1)
        net.c2z_weight(i) = {};
    end
    
    for i = 1:size(net.z2x_weight,1)
        net.z2x_weight(i) = {};
    end

end