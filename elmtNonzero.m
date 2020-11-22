function trace = elmtNonzero(max)
    
    trace = zeros(2, max-4);
    for i=5:max
        [coord, ~] = maillage_carre(i);
        [~,Ai] = elliptic(0,i);
        % Il y a des valeurs propres qui sont égales à "-0" et donc
        % considérées comme négatives (la matrice Ai n'est pas consideree
        % comme def positive et donc on peut pas utiliser la fonction
        % "chol")
        [vec,val]=eig(Ai);
        val(val<0)=0;
        Ai=vec*val*vec';
        R = chol(abs(Ai));
        len = length(coord(:,1));
        nnz = length(find(R~=0));
        trace(:,i-4) = [len^2 ; nnz];
    end
    
    plot(trace(1,:), trace(2,:));
end