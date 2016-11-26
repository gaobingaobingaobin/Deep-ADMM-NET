%
%  ADMMNetCostFunction.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function [net] = RandInitWeights(net)

    % initialize M layer to X layer weights
    for i = 1:size(net.q,1)
        for j = 1:size(net.q,2)
            net.q(i,j) = {sft_threshold_func(10,0.01,0.0001)}; 
        end
    end

    % initalize M layer to C layer weights
    for i = 1:size(net.D,1) 
        for j = 1:size(net.D,2)
            net.D(i,j) = {dctmtx(net.image_row * net.image_col)};
        end
    end
    
    for i = 1:size(net.H,1)
        for j = 1:size(net.H,2)
            net.H(i,j) = {dctmtx(net.image_row * net.image_col)};
        end
    end
    
    for i = 1:size(net.rho,1)
        for j =1:size(net.rho,2)
            net.rho(i,j) = {0.00001};
        end
    end
    
    for i = 1:size(net.eta,1)
        for j = 1:size(net.eta,2)
            net.eta(i,j) = {0.01};
        end
    end
end