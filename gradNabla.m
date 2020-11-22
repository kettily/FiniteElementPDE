function gradnj = gradNabla(alpha, x, y, j)

    j1 = mod(j+1,3);
    j2 = mod(j+2,3);
    if j1 == 0 
        j1 = 3;
    end
    if j2==0
        j2 = 3;
    end
    gradnj = (1/alpha)*[y(j1)-y(j2); x(j2)-x(j1)];
end

