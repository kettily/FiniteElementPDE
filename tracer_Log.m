function ecart = tracer_Log(max)
    
    ecart = zeros(2,max-4);
    for i=5:max
        [coord, ~] = maillage_carre(i);
        Uh = elliptic(0,i);
        h = 1/length(Uh);
        ecart(1,i-4) = h*norm(Uexact(coord)-Uh,2);
        ecart(2,i-4) = h;
    end 
    
    plot(log10(ecart(2,:)), log10(ecart(1,:)));   
    
    function u = Uexact(x)
        u = sin(pi*x(1))*sin(pi*x(2));
    end
end