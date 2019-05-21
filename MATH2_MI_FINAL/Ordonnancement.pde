class Pile { //<>//
  int [] tab=new int[100];
  int sommet =0;
}
Pile Empiler(Pile P, int valeur) {
  P.tab[P.sommet]=valeur;
  P.sommet++;
  return P;
}
int Depiler(Pile P) {
  P.sommet--;
  int valeur=P.tab[P.sommet];
  return valeur;
}
boolean elementPile(Pile P, int valeur) {
  for (int i=0; i<=P.sommet; i++) {
    if (P.tab[i]==valeur) {
      return true;
    }
  }
  return false;
}
void recurOrdonnancement(int[][] M, Pile P, int k) {
  if (P.sommet<M.length) {
    Pile P2=new Pile();
    for (int i=0; i<M.length; i++) {
      if (sommeLignes(M, i, P)<2 && elementPile(P, i+1)==false) {
        println("Niveau "+k+":"+(i+1));
        fill(255,0,0,100);
        text("Niveau "+k+" sommet :"+(i+1),100,(i+1)*20+400);
        Empiler(P2, i+1);
      }
    }
    do {
      Empiler(P, Depiler(P2));
    } while (P2.sommet!=0);
    recurOrdonnancement(M, P, k+1);
  }
}
int sommeLignes(int[][] M, int i, Pile P) {
  int somme=0;
  if (P.sommet==0) {
    for (int j=0; j<M.length; j++) {
      somme+=M[i][j];
    }
  } else {
    for (int j=0; j<M.length; j++) {
      if (elementPile(P, i+1)==false && elementPile(P, j+1)==false)
        somme+=M[i][j];
    }
  }
  return somme;
}
