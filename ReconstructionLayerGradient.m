%
%  ReconstructionLayerGradient.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function [x2beta_gradient,x2z_gradient] = ReconstructionLayerGradient(F,H_n,P,L,rho_n)
% This function is aim to calculate the beta in the Reconstruction Layer
% input:
%F is a Fourier transform, size N'*N ; 
%P is a under-samping matrix;
% while A = P*F,size N'*N; 
% H_n is a transform matrix for a filtering operation
% rho_n is the learnable parameter
% L is the number of z in column, which has been definited before.

I_n = eye(size(beta_n,1)); %I_n is an identity matrix sized N x N
temp_sum = 0;% sum in the formula
for l  =1:L
    temp_sum=temp_sum+rho_n{l}*F*H_n{l}'*F';
end

Q = (P'*P+temp_sum)^(-1);
for l = 1:L
    x2beta_gradient(l) = -rho_n{l}*F'*Q*H_n(l)'*I_n;
    x2z_gradient(l) = rho_n(l)*F'*Q*H_n(l)'*I_n;
end