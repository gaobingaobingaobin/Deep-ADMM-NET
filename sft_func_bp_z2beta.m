function output = sft_func_bp_z2beta(L,sum,q)

%  ADMM-NET
%
%  Created by Liao Tinghui.SCU on 27/12/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

% sum  = c_n+beta_(n-1)
% L is the number of x
output = zeros(1,L);
step = 2/(L-1);
p = zeros(1,L);
for i = 1:L
  p(i) = -1+(i-1)*step; %get the x axis
end
for i = 1:L
    if sum<=p(1) || sum>=p(L)
        output(i)=1;
    else
        output(i) = 1-(q(i+1)-q(i))/(p(2)-p(1));
    end
end
end