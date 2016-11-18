function output = sft_threshold_func(L,lambda,rho)
%
%  ConvolutionLayer.m
%  ADMM-NET
%
%  Created by Liao Tinghui.SCU on 18/11/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.
output = zeros(1,L);
step = 2/(L-1);
p = zeros(1,L);
for i = 1:L
  p(i) = -1+(i-1)*step; %get the x axis
end

for i = 1:L
    if (abs(p(i))-lambda/rho)>0
        output(i) = p(i)/abs(p(i)) * abs(p(i))-lambda/rho;
    else 
        output(i)=0;
    end
end
end