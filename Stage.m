%
%  Stage.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

% Function Stage return state of ADDM network
% N is the number of stage
% L is the number of collector for each stage
% image_length is the length of input image
function [net] = Stage(N,L,image_length)
    % net is a struct taht contains all info of ADMM Net
    % 
    % reconstructionLaryer is X
    % multiplierUpdateLayer is M
    % nonlinerTransformLayer is Z
    % convolutionLayer is C
    % q denotes some positions for filter in stage
    % D denotes a transform matrix for a filtering operation.eg.,DWT,DCT
    % H denotes a learnable filter matrix
    % rho denotes a penalty parameter
    % eta denotes a learnable parameter

    
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
    net.image_length = {image_length};
end