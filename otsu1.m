% Otsu method of image segmentation
clc;
clear all;
close all;
I=imread('fingerprint.jpg');
A=rgb2gray(I);
[x,y]=size(A);
L=256;
p=zeros(1,L);
% compute ni frequence of each pixel levels
for i=1:x
    for j=1:y
        for level=1:L
            if(A(i,j)==level)
                p(level)=p(level)+1;
            end
        end
    end
end
%normalised 1-D array ni
p=p/(x*y);
% global mean 
mG=0;
for i=1:L
mG=mG+i*p(i);
end
%global variance
sigmaG=0;
 for i=1:L% modify
        sigmaG=sigmaG+((i-mG)^2)*p(i);
        
 end
P1=zeros(1,L);
P2=zeros(1,L);
m1=zeros(1,L);
m2=zeros(1,L);
sigmaB=zeros(1,L);
for K=1:L
temp1=0;
temp2 =0;
temp3=0;
temp4=0;




    %cumulative sum P1
    for T1=1:K
        temp1=temp1+p(T1);
    end
    
    P1(K)=temp1;
    % cumulative sum P2
    for T2=K+1:L
        temp2=temp2+p(T2);
    end
    P2(K)=temp2;
    % mean intesity values of the pixels p(1:K)
    for i=1:K
        temp3=temp3+i*p(i);
    end
    m1(K)=temp3/P1(K);
    %mean intensity values of the pixels p(k+1:L)
    for i=K+1:L
        temp4=temp4+i*p(i);
    end
    m2(K)=temp4/P2(K);%modify
% the between class variance    
sigmaB(K)= P1(K)*(m1(K)-mG)^2 + P2(K)*(m2(K)-mG)^2 ;    
end
%find Kstar
[sigmaB1 Kstar]=max(sigmaB);
P11=P1(Kstar);
P22=P2(Kstar);
m11=m1(Kstar);
m22=m2(Kstar);
disp('The separable threshold value Kstar :');
disp(Kstar);
%average intensity of the entire image
 disp('Computed Avg Intensity P11*m11+P22*m22is correct');
 disp(P11*m11+P22*m22);
      
 disp('Global ntensity mG computed');
 disp(mG); 
  
    
% the separable measure eta(Kstar)
eta=sigmaB1/sigmaG;
disp('the separable measure eta(Kstar)  :');
disp(eta);
    
    
    
%image segmentation using thresholding technique
a=A;
for i=1:x
    for j=1:y
        if(A(i,j)>Kstar)% modify
            a(i,j)=255;%modify
           
        else
            a(i,j)=0;
            
        end
    end
end
figure;
subplot(311);
imshow(A);
subplot(312);
stem(p);
subplot(313);
imshow(a);

