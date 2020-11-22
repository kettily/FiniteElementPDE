function [u,A] = elliptic(traitementQ1, n)

if (traitementQ1)
    coord = load('coordinates.dat');
    e3 = load('elements3.dat');
    e4 = load('elements4.dat');
    neumann = load('neumann.dat');
    dirichlet = load('dirichlet.dat');
else
    [coord, e3, e4, dirichlet, neumann] = maillage_carre(n);
end
% Nombre de points du maillage
nbPts = length(coord(:,1));
% le nombre de triangles constituant le maillage
nbTriang = size(e3,1);
% le nombre de quadrangles constituant le maillages. 
nbQuad = size(e4,1);

% Assemblage de la matrice A et du second membre b
A = zeros(nbPts);
b = zeros(nbPts,1);
% 
% %% Traitement des éléments de type P1 

for ind=1:nbTriang
% On calcule la matrice de raideur du triangle t
    t = e3(ind,:);
    [Mt,alpha] = raideur_triangle(t,coord);
    for i=1:3
        for j=1:3
             A(t(i),t(j))=A(t(i),t(j))+Mt(i,j);
        end
     end
     % Calcul du second membre
     centreG = (coord(t(1),:)+coord(t(2),:)+coord(t(3),:))/3; 
     b(t) = b(t)+(alpha/6)*f(centreG);
end
% Assemblage du second membre : Contribution des conditions de Dirichlet
for i=1:nbPts
       b(i) = b(i) - A(i,dirichlet)*u_d(coord(dirichlet,:));
end


%% Traitement des éléments de type Q1 
if (traitementQ1)
    for ind=1:nbQuad
        q = e4(ind,:);
        % On calcule la matrice de raideur du quadrangle q
        [Mq,alpha] = raideur_quadrangle(q,coord);
        for i=1:4
            for j=1:4
                A(q(i),q(j))=A(q(i),q(j))+Mq(i,j);
            end
        end
         % Calcul du second membre
        centreG = (coord(q(1),:)+coord(q(2),:)+coord(q(3),:)+coord(q(4),:))/4;
        b(q) = b(q)+(alpha/4)*f(centreG);

    end

    % % Assemblage du second membre : Contribution des conditions de Neumann
    for i=1:size(neumann,1)
       ptsN = neumann(i,:); 
       x1 = coord(ptsN(1),1);
       x2 = coord(ptsN(2),1);
       y1 = coord(ptsN(1),2);
       y2 = coord(ptsN(2),2);
       p1 = [x1 y1];
       p2 = [x2 y2];
       b(neumann(i,:)) = b(neumann(i,:)) + norm(p2-p1)*g(0.5*(p1+p2)); 
    end
end
%% Resolution du probleme
% Initialisation 
u = zeros(nbPts,1); 
% Imposition de la solution liée aux conditions de Dirichlet
u(dirichlet) = u_d(coord(dirichlet));
% Determination de l'ensemble des degres de liberte (ddl)=noeud de calcul
FreeNodes = setdiff(1:nbPts,dirichlet);
% Resolution : 
u(FreeNodes) = A(FreeNodes,FreeNodes)\b(FreeNodes);

%% Afficher la solution obtenue : 
show(e3,e4,coord,u);
end