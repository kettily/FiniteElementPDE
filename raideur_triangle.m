function [M,alpha] = raideur_triangle(e3, coord)
    
   x = zeros(1, 3);
   y = x;
   for i=1:3
       x(i) = coord(e3(i), 1);
       y(i) = coord(e3(i), 2);
   end
   M = zeros(3);
   alpha = det([x(2)-x(1),x(3)-x(1);y(2)-y(1),y(3)-y(1)]);
   for i = 1:3
       for j = 1:3
           M(i,j) = gradNabla(alpha, x, y, i)'*gradNabla(alpha, x, y, j);
       end
   end
   aireTriang = alpha/2;
   M = aireTriang*M;
end
       