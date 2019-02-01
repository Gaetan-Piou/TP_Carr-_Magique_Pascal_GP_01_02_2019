program cm_sp;

{
	ALGORITHME : Carre_Magique
	//BUT : Afficher un carre magique dont les dimensions sont définies en CONSTANTE
	//ENTREE : Rien
	//SORTIE : Le carré magique
	
	CONST
		DIMENSIONS <- 5: ENTIER

	PROCEDURE: init_tableau(tab: tableau[1..DIMENSIONS,1..DIMENSIONS] de ENTIER)
	//BUT: Initialise le tableau pour le carré magique
	//ENTREE: 	tab: Le tableau à initialiser
	//SORTIE: Aucune

	VAR
		x,y: ENTIER

	DEBUT
		POUR y DE 1 A DIMENSIONS FAIRE
			POUR x DE 1 A DIMENSIONS FAIRE
				tab[x,y] <- 0
			FINPOUR
		FINPOUR
	FIN
	
	
	FONCTION : nb_chi(l: ENTIER)
	//BUT : Déterminer le nombre de chiffre d'un entier positif
	//ENTREE : Un entier positif dont on veut déterminer le nombre de chiffres
	//SORTIE : Le nombre de chiffres de cet entier positif
	
	VAR
		longueur,nb: ENTIER
	
	DEBUT
		longueur <- 1
		nb <- l
		TANTQUE nb => 10 FAIRE
			longueur <- longueur + 1
			nb <- nb DIV 10
		FINTANTQUE
		nb_chi <- longueur
	FIN
	
	
	
	VAR
		T: tableau[1..DIMENSIONS,1..DIMENSIONS] de ENTIER
		x,y,i,longueur_max,longueur: ENTIER
	
	DEBUT
		//Initialisation du tableau
		init_tableau(T)
	
		//Initialisation de la longueur maximale
		longueur_max <- 1
		longueur <- 1
	
		//Initialisation de la position du premier nombre
		x <- DIMENSIONS DIV 2 + 1
		y <- DIMENSIONS DIV 2
	
		//Affectation du tableau
		POUR i DE 1 A (DIMENSIONS * DIMENSIONS) FAIRE
			T[x,y] <- i
			x <- x+1
			SI x > DIMENSIONS ALORS
				x <- 1
			FINSI
			y <- y-1
			SI y < 1 ALORS
				y <- DIMENSIONS
			FINSI
			SI T[x,y] > 0 ALORS
				x <- x-1
				SI x < 1 ALORS
					x <- DIMENSIONS
				FINSI
				y <- y-1
				SI y < 1 ALORS
					y <- DIMENSIONS
				FINSI
			FINSI
		FINPOUR
	
		//Affectation du nombre de chiffres de la plus grande valeur
		longueur_max <- nb_chi(i)
	
		//Ecriture du carré magique
		POUR x DE 1 A DIMENSIONS * (longueur_max+1) + 1 FAIRE
			ECRIRE '_'
		FINPOUR
		POUR y DE 1 A DIMENSIONS FAIRE
			ECRIRE '|'
			POUR x DE 1 A DIMENSIONS FAIRE
				longueur <- nb_chi(T[x,y])
				POUR i DE 1 A longueur_max - longueur FAIRE
					ECRIRE ' '
				FINPOUR
				ECRIRE T[x,y],'|'
			FINPOUR
			ECRIRE
			ECRIRE '|'
			POUR x DE 1 A DIMENSIONS FAIRE
				POUR i DE 1 A longueur_max FAIRE
					ECRIRE '_'
				FINPOUR
				ECRIRE '|'
			FINPOUR
		FINPOUR
	FIN
}

uses crt;



CONST
	DIMENS = 5;

TYPE tableau= array[1..DIMENS,1..DIMENS] of INTEGER;


PROCEDURE init_tableau(tab: tableau);
	//BUT: Initialise le tableau pour le carré magique
	//ENTREE: 	tab: Le tableau à initialiser
	//SORTIE: Aucune

	VAR
		x,y: INTEGER;

	BEGIN
		FOR y := 1 TO DIMENS DO
		BEGIN
			FOR x := 1 TO DIMENS DO
			BEGIN
				tab[x,y] := 0;
			END;
		END;
	END;



FUNCTION nb_chi(VAR l: INTEGER):INTEGER;
//BUT : Déterminer le nombre de chiffre d'un entier positif
//ENTREE : Un entier positif dont on veut déterminer le nombre de chiffres
//SORTIE : Le nombre de chiffres de cet entier positif

VAR
	longueur,nb: INTEGER;

BEGIN
	longueur := 1;
	nb := l;
	WHILE nb > 9 DO
	BEGIN
		longueur := longueur + 1;
		nb := nb DIV 10;
	END;
	nb_chi := longueur;
END;




VAR
	T: array[1..DIMENS,1..DIMENS] of INTEGER;
	x,y,i,l_max,l: INTEGER;

BEGIN
	//Initialisation du tableau
	init_tableau(T);

	//Initialisation des longueurs
	l := 1;
	l_max := 1;

	//Initialisation de la position du premier nombre
	x := DIMENS DIV 2 + 1;
	y := DIMENS DIV 2;

	//Affectation du tableau
	FOR i := 1 TO (DIMENS * DIMENS) DO
	BEGIN
		T[x,y] := i;
		x := x+1;
		IF x > DIMENS THEN
		BEGIN
			x := 1;
		END;
		y := y-1;
		IF y < 1 THEN
		BEGIN
			y := DIMENS;
		END;
		IF T[x,y] > 0 THEN
		BEGIN
			x := x-1;
			IF x < 1 THEN
			BEGIN
				x := DIMENS;
			END;
			y := y-1;
			IF y < 1 THEN
			BEGIN
				y := DIMENS;
			END;
		END;
	END;

	//Affectation du nombre de chiffres de la valeur maximale
	WRITELN(i);
	l_max := nb_chi(i);


	//Ecriture du carre magique
	FOR x := 1 TO (DIMENS * (l_max+1) + 1) DO
	BEGIN
		WRITE('_');
	END;
	WRITELN;
	FOR y := 1 TO DIMENS DO
	BEGIN
		WRITE('|');
		FOR x := 1 TO DIMENS DO
		BEGIN
			l := nb_chi(T[x,y]);
			FOR i := 1 TO (l_max - l) DO
			BEGIN
				WRITE(' ');
			END;
			WRITE(T[x,y],'|');
		END;
		WRITELN;
		WRITE('|');
		FOR x := 1 TO DIMENS DO
		BEGIN
			FOR i := 1 TO l_max DO
			BEGIN
				WRITE('_');
			END;
			WRITE('|');
		END;
		WRITELN;
	END;
	READLN;
END.