%
%  LoadImage.m
%  ADMM-NET
%
%  Created by Wang Han.SCU on 15/11/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.
%
clear,clc;
img = imread('image2/IM-0001-0001.jpg');
img = rgb2gray(img);
img_k_space = real(fft2(img));


