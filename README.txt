Contenu de l'archive :

- "raideur_triangle.m" et "raideur_quadrangle.m" : fonctions qui retourne la matrice de raideur pour
 un élèment de typr triangle et quadrangle.
 - "gradNabla.m" : le gradient de la fonction de base nabla pour un indice donné i
- "elliptic.m" : Une fonction qui retourne la solution du problème U et la matrice d'assemblage A
- "tracer_Log.m" : fonction qui trace l'evolution de l'ecart entre la solution exacte et la solution approchée.
 - "elmtNonzero.m" : fonction qui trace l'evolution du nombre d'el ́ements non nuls de la matrice R (R = chol(A))
 en fonction de la taille de A 
 - "testElliptic.m" : script de test qui resoud le problème sur les deux types de maillage donnés,
 et trace les evolutions de l'ecart entre solutions et des élèments non nuls demandées.
