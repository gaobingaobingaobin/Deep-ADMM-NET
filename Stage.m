%
%  Stage.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

% Function Stage return state of ADDM network
%   stageNum  the number of stage

function [net] = Stage(N,L,image_length)
    % net is a struct taht contains all info of ADMM Net
    % 
    % N is the number of stage
    % L is the number of collector for each stage
    % image_length is the length of input image
    % 
    % reconstructionLaryer is X
    % multiplierUpdateLayer is M
    % nonlinerTransformLayer is Z
    % convolutionLayer is C
    % m2x_weight is the weight between M(i) layer to X(i+1) layer
    % m2c_weight is the weight between M(i) layer to X(i+1) layer
    % m2m_weight is the weight between M(i) layer to M(i+1) layer
    % c2m_weight is the weight between C(i) layer to M(i) layer
    % z2z_weight is the weight between Z(i) layer to Z(i+1) layer
    % x2c_weight is the weight between X(i) layer to C(i) layer
    % c2z_weight is the weight between C(i) layer to Z(i) layer
    % z2x_weight is the weight between Z(i) layer to Z(i+1) layer
    
    % four layers
    reconstructionLaryer = cell(N+1,1); %X
    multiplierUpdateLayer = cell(N,1); %M
    nonlinerTransformLayer = cell(N,1); %Z
    convolutionLayer = cell(N,1); %C
    
    % seven parameters
    q = cell(N,L);  
    D = cell(N,L); 
    H = cell(N+1,L); 
    rho = cell(N+1,L);
    eta = cell(N,L); 
    
    % init net
    net = struct;
    net.reconstructionLaryer = reconstructionLaryer;
    net.multiplierUpdateLayer = multiplierUpdateLayer;
    net.nonlinerTransformLayer = nonlinerTransformLayer;
    net.convolutionLayer = convolutionLayer;
    net.q = q;
    net.D = D;
    net.H = H;
    net.rho = rho;
    net.eta = eta;
    net.image_length = image_length;
end