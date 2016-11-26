%
%  ReconstructionLayer.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function x_n = ReconstructionLayer(F,P,H_n,last_z,y,rho_n,last_beta)
%This function is aim to calculate the x in the Reconstruction Layer

% input : F is a Fourier transform, size N'*N ; P is a under-samping matrix;
% while A = P*F,size N'*N; 
% H is a transform matrix for a filtering operation
% last_z is the collection of auxiliary variables,z={z1,z2,...,zL} 
% and the z in the n-1 th Nonlinear transform layer
% y is the under-sampled k-space data
% last_beta is the beta in the LAST Multiplier update layer
% rho_n are penalty parameters, which should be learned by the net.

L = size(H_n,2);%number of z in column
sum_1 = 0; %first part summed
sum_2 = 0; %second part summed
for l =1:L
    sum_1 = sum_1 + rho_n{l}*F * (H_n{l})' * (H_n{l}) * F';
    sum_2 = sum_2 + rho_n{l}*F*H_n{l}'*(last_z{l}-last_beta{l});
end

x_n = F' * inv( P'*P + sum_1 ) * ( P'*y +sum_2); %get the X in this layer
%Tips:x,y are all vectors, because A is a N'*N matrix.
%So x must be a N*1 vector and y must be a N'*1 vector, then Ax-y can be
%meaningful
end