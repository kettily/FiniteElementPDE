function [ M,alpha ] = raideur_quadrangle(e4,coord)


    x = zeros(1,4);
    y = x;
    for i=1:4
        x(i) = coord(e4(i), 1);
        y(i) = coord(e4(i), 2); 
    end

    Dphi = [x(2)-x(1), x(4)-x(1); y(2)-y(1), y(4)-y(1)];
        
    det_Dphi = det(Dphi);
    mat = inv(Dphi'*Dphi);
    a = mat(1,1);
    b = mat(1,2);
    c = mat(2,2);
    
    
    M = zeros(4,4);       
    for i =1:4
        M(i,i) = ((-1)^(i-1))*3*b + 2*(a+c); 
    end
    % M est symétrique
    M(1,2) = -2*a + c;
    M(2,1) = M(1,2);
    M(1,3) = -3*b - (a+c);
    M(3,1) = M(1,3);
    M(1,4) = a - 2*c;
    M(4,1) = M(1,4);
    M(2,3) = M(1,4);
    M(3,2) = M(2,3);
    M(2,4) = 3*b - (a+c);
    M(4,2) = M(2,4);
    M(3,4) = M(1,2);
    M(4,3) = M(3,4);
       
        
    alpha = det([x(2)-x(1),x(3)-x(1);y(2)-y(1),y(3)-y(1)]);
    M = (det_Dphi/6)*M;     
end