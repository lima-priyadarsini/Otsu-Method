clc;
clear all;
a=input('read array');
max1=0;
n=length(a);
for i=1:n
    if a(i)>max1
        max1=a(i);
        pos=i;
    end
end
fprintf('the highest no is%d at pos %d',max1,pos);
max2=0;
for i=1:n
    if(i==pos)
        continue
    end;
    if a(i)>max2
        max2=a(i);
        pos1=i;
    end
end
fprintf('the second highest no is%d at pos %d',max2,pos1);