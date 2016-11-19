%
%  ConvolutionLayer.m
%  ADMM-NET
%
%  Created by Liao Tinghui.SCU on 22/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

function output = PLF (x,q_l)
% This function is aim to implement the Piecewise Linear Function in the paper.
% The PLF function can approximate any function.
% input: x is the origin input matrix, which specifically refers to the (c_n+last_beta)
% q is a Nc*1 vector deciding the value in y axis of PLF
% the x axis of PLF is a Nc*1 vector deviding (-1,1) by the average distance
L = size(q_l,2);%length of q_l
x_length = size(x,1);%length of x
step = 2/(L-1);
p = zeros(1,L);
output = zeros(L,1);
for i = 1:L
  p(i) = -1+(i-1)*step; %get the x axis
end
for i = 1:x_length
  if x(i)<-1
         output(i) = q_l(1)+(1+x(i)*(q_l(2)-q_l(1)))/step;
  elseif x(i)>1
         output(i) = (q_l(L)-q_l(L-1))*(x(i)-1)/step+q_l(L);
  else
    for j = 1:L-1
         if x(i)>=p(j) && x(i)<p(j+1)
         output(i) = (x(i)-p(j))/step * (q_l(j+1) + q_l(j));%compute each output
         end
    end
  end
end

end
%Tips: This PLF is simply implmented in for-loop.
