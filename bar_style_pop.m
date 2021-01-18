Y = round(rand(5,3)*10);

figure;
subplot(2,2,1);
bar(Y,'grouped');
title('Group')

subplot(2,2,2);
bar(Y,'stacked');
title('Stack')

subplot(2,2,3);
bar(Y,'histc');
title('Histc')

subplot(2,2,4);
bar(Y,'hist');
title('Hist')
