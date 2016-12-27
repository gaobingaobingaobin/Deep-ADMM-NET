function output = sft_func_bp_z2q(L,sum)

%  ADMM-NET
%
%  Created by Liao Tinghui.SCU on 27/12/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.

% sum  = c_n+beta_(n-1) //4096*1
% L is the number of x
length = size(sum,1);%4096
output = zeros(length,L);
step = 2/(L-1);
p = zeros(1,L);

for i = 1:L
  p(i) = -1+(i-1)*step; %get the x axis
end
for j = 1:length
for i = 1:L
    if sum(j)<p(1) || sum(j)>p(L)
        output(j,i)=0;
    else
        output(j,i) = 1-(sum(j)-p(i))/(p(2)-p(1));
    end
end
end

end