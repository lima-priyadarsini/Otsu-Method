% histogram equalisation
clear;
clc;
close all;
%a=input('enter the image matrix');
% no. of pixels in the image
a=imread('pout.tif');
y=uint8(zeros(size(a,1), size(a,2)));
n=size(a,1)*size(a,2);
% find the number of beans
beans=256;
freq=zeros(beans,1);
pdf=zeros(beans,1);
cdf=zeros(beans,1);
% find the frequency of each beans
for i=1:size(a,1)
    for j=1:size(a,2)
       
       freq(a(i,j)+1)=freq(a(i,j)+1)+1;
    end
end
% find the probability distributed function value for each bean
% array of pdf values
pdf=freq/n;
% array cdf values
cdf=cumsum(pdf);
% final beans value
cdf1=round(cdf*(beans-1));

% histogram image
for i=1:size(a,1)
    for j=1:size(a,2)
        y(i,j)=cdf1(a(i,j));
    end
end

subplot(2,2,1),imshow(a);
subplot(2,2,2),imhist(a);
subplot(2,2,3),imshow(y);
subplot(2,2,4),imhist(y);