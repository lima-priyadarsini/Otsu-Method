clc;
clear all;
close all;
y=imread('onion.png');
k=brighten(y);
subplot(211);
imshow(y);
title('image')
subplot(212);
imshow(k);	

