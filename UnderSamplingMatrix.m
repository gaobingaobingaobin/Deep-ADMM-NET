%
%  UnderSamplingMatrix.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 15/11/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.
%
function [A] = UnderSamplingMatrix(s,m,n)
    % output: 
    % A: nder-sampling matrix
    % input:
    % s: the sampling rate 
    % m: the size of row
    % n: the size of col
    
    As = (1/s^2).*ones(1,s);
    BA = DiagonalCat(m/s, As);
    CA = repmat(BA,1,s);
    A = DiagonalCat(n/s,CA);
end

function [out] = DiagonalCat(s,A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   produce block diagonal matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % A =  
% %      1     1
% % s =
% %      3
% % out =
% %      1     1     0     0     0     0
% %      0     0     1     1     0     0
% %      0     0     0     0     1     1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [m,n] = size(A);% A is basic block
    out = zeros(s*m,s*n);
    for i = 1:s
        out((i-1)*m+1:i*m , (i-1)*n+1:i*n) = A;
    end
end