 
clear all
close all
 
elliptic(0,20);
title('Test sur le 1er type de maillage')
 
figure(2)
elliptic(1,0);
title('Test sur le 2ème type de maillage')

figure(3)
e = tracer_Log(20);
title('Evolution de l ecart entre les solution en fonction de la taille du maillage')

figure(4)
t = elmtNonzero(20);
title('Evolution du nombre des éléments non zero en fonction de la taille')
