%
%  FourierMatrix.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 15/11/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.
%
function [A] = FourierMatrix(row,col)
    A = ones(row,col);
    for m = 2:row
        for n=2:col
            A(m,n) = exp(-1j.*2.*pi./(row*col).*(m-1).*(n-1));
        end
    end
end