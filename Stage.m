%
%  Stage.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

% Function Stage return state of ADDM network
%	stageNum  the number of stage

function [net] = Stage(stageNum)
    % net is a struct taht contains all info of ADMM Net
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
    
    net = struct;
    
	reconstructionLaryer = cell(stageNum+1,1); %X
    multiplierUpdateLayer = cell(stageNum,1); %M
    nonlinerTransformLayer = cell(stageNum,1); %Z
    convolutionLayer = cell(stageNum,1); %C
    m2x_weight = cell(stageNum-1,1);  
    m2c_weight = cell(stageNum-1,1); 
    m2m_weight = cell(stageNum-1,1); 
    c2m_weight = cell(stageNum,1);
    z2z_weight = cell(stageNum,1);
    x2c_weight = cell(stageNum,1); 
    c2z_weight = cell(stageNum,1);
    z2x_weight = cell(stageNum,1); 
    
    net.reconstructionLaryer = reconstructionLaryer;
    net.multiplierUpdateLayer = multiplierUpdateLayer;
    net.nonlinerTransformLayer = nonlinerTransformLayer;
    net.convolutionLayer = convolutionLayer;
    net.m2x_weight = m2x_weight;
    net.m2c_weight = m2c_weight;
    net.m2m_weight = m2m_weight;
    net.c2m_weight = c2m_weight;
    net.z2z_weight = z2z_weight;
    net.x2c_weight = x2c_weight;
    net.c2z_weight = c2z_weight;
    net.z2x_weight = z2x_weight;
 
end