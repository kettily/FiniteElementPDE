c = load('coordinates.dat');
x =c(:,1);
y = c(:,2);
scatter(x,y);

e3 = load('elements3.dat');

hold on;
for i = 1:size(e3,1)
    ligne = e3(i,:);
    x1 = c(ligne(1),1);
    y1 = c(ligne(1),2);
    x2 = c(ligne(2),1);
    y2 = c(ligne(2),2);
    x3 = c(ligne(3),1);
    y3 = c(ligne(3),2);
    plot([x1 x2],[y1 y2]);
    plot([x1 x3],[y1 y3]);
    plot([x3 x2],[y3 y2]);
   
end
hold off;
% 
% 
% e4 = load('elements4.dat');
% hold on;
% for i = 1:size(e4,1)
%     ligne = e4(i,:);
%     x1 = c(ligne(1),1);
%     y1 = c(ligne(1),2);
%     x2 = c(ligne(2),1);
%     y2 = c(ligne(2),2);
%     x3 = c(ligne(3),1);
%     y3 = c(ligne(3),2);
%     x4 = c(ligne(4),1);
%     y4 = c(ligne(4),2);
%     plot([x1 x2],[y1 y2]);
%     plot([x1 x4],[y1 y4]);
%     plot([x3 x2],[y3 y2]);
%     plot([x3 x4],[y3 y4]);
% end
% hold off;
% 
% d = load('dirichlet.dat');
% hold on;
% for i = 1:length(d)
%     l = d(i);
%     plot(c(l,1),c(l,2),'*');
% end
% hold off;
% 
n = load('neumann.dat');
%n = n(:);
% hold on;
% for i = 1:length(n)
%     l = n(i);
%     plot(c(l,:),'*');
% end
% % hold off;
