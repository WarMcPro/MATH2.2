Sommet[] S_gen;
int[][] M_gen;

class Sommet {
  int num; 
  int valeur;
  int couleur;
  float x;
  float y;
}
Sommet[] recurCouleurAppel(int[][] M_gen) {
  S_gen= somme(M_gen);
  int couleur=1;
  int sommetComparer=0;
  S_gen=tri(S_gen);
  return recurCouleur(S_gen, couleur, sommetComparer, M_gen);
}
Sommet[] recurCouleur(Sommet[] S_gen, int couleur, int j, int[][] M_gen) {
  S_gen[j].couleur=couleur;
  for (int i=0; i<M_gen.length; i++) {
    if (S_gen[i].couleur==0 && couleurDiff(i, S_gen, M_gen, couleur)==true) {
      S_gen[i].couleur=couleur;
    }
  }
  for (int k=j+1; k<S_gen.length; k++) {
    if (S_gen[k].couleur==0) {
      recurCouleur(S_gen, couleur+1, k, M_gen);
    }
  }
  return S_gen;
}
Sommet[] somme(int[][] M_gen) {
  int somme;
  Sommet[] T_somme=new Sommet[M_gen.length];
  for (int i=0; i<M_gen.length; i++) {
    somme=0;
    T_somme[i]=new Sommet();
    for (int j=0; j<M_gen.length; j++) {
      somme+=M_gen[i][j];
    }
    T_somme[i].valeur=somme;
    T_somme[i].num=i;
  }
  return T_somme;
}
Sommet[] tri(Sommet[] T) {
  boolean permut=true;
  int temp;
  int temp2;
  while (permut) {
    permut=false;
    for (int i=0; i<T.length-1; i++) {
      if (T[i].valeur<T[i+1].valeur) {
        temp=T[i].valeur;
        temp2=T[i].num;
        T[i].valeur=T[i+1].valeur;
        T[i].num=T[i+1].num;
        T[i+1].valeur=temp;
        T[i+1].num=temp2;
        permut=true;
      }
    }
  }
  return T;
}
boolean couleurDiff(int i, Sommet[] S_gen, int[][] M_gen, int couleur) {
  for (int j=0; j<S_gen.length; j++) {
    if (M_gen[S_gen[i].num][j]!=0) {
      int k=0;
      while(j!=S_gen[k].num)
      k++;
      if (S_gen[k].couleur==couleur)
        return false;
    }
  }
  return true;
}
