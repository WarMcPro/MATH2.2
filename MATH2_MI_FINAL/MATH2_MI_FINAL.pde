boolean oriente=true;
class arete {
  int initial;
  int finale;
  float cout;
}
class graphe {
  int n;
  int nbaretes;
  arete[] lesaretes;
  graphe(int nbs, int nba, arete[] aretes) {
    n=nbs;
    nbaretes=nba;
    lesaretes=new arete[nba];
    for (int i=0; i<nba; i++)
      lesaretes[i]=aretes[i];
  }
  graphe(graphe g) {
    n=g.n;
    nbaretes=g.nbaretes;
    lesaretes=new arete[nbaretes];
    for (int i=0; i<nbaretes; i++)
      lesaretes[i]=g.lesaretes[i];
  }
}
graphe saisie_graphe() {
  int nba=askInteger("nb aretes");
  int nbs=askInteger("nb sommet");
  arete[] A=new arete[nba];
  for (int i=0; i<nba; i++) {
    A[i] = new arete();
    A[i].initial=askInteger("sommet initial");
    A[i].finale=askInteger("sommet finale");
    A[i].cout=askFloat("cout de l'arete");
  }
  return new graphe(nbs, nba, A);
}
int[][] adjacence(graphe g) {
  int[][] T=new int[g.n][g.n];
  for (int i=0; i<g.n; i++) {
    for (int j=0; j<g.n; j++) {
      for (int h=0; h<g.nbaretes; h++) {
        if (g.lesaretes[h].initial==i+1 && g.lesaretes[h].finale==j+1) {
          T[i][j]++;
          if (oriente) {
            T[j][i]++;
          }
        }
      }
    }
  }
  M_gen=T;
  return T;
}
void affichermatrice(int[][] matrice) {
  for (int i=0; i<matrice.length; i++) {
    for (int j=0; j<matrice.length; j++) {
      print(matrice[i][j]+" ");
    }
    println();
  }
}
int[][] produit(int[][] M1, int[][] M2) {
  int[][]M=new int[M1.length][M1.length];
  int somme=0;
  for (int i=0; i<M1.length; i++) {
    for (int j=0; j<M1.length; j++) {
      for (int k=0; k<M1.length; k++) {
        somme+=M1[i][k]*M2[k][j];
      }
      M[i][j]=somme;
      somme=0;
    }
  }
  return M;
}
int[][] puissance(int[][] M, int n) {
  int[][] M1=new int[M.length][M.length];
  M1=M;
  while (n>=2) {
    M=produit(M, M1);
    n--;
  }
  //affichermatrice(M);
  return M;
}
int nbchemins(int[][]M, int n, int i, int j) {
  M=puissance(M, n);
  return M[i][j];
}
int[][] somme(int[][] M1, int[][] M2) {
  int[][]M=new int[M1.length][M1.length];
  for (int i=0; i<M1.length; i++) {
    for (int j=0; j<M1.length; j++) {
      if (M1[i][j]==0&&M2[i][j]==0)
        M[i][j]=0;
      else M[i][j]=1;
    }
  }
  return M;
}
boolean egal(int[][] M1, int[][] M2) {
  for (int i=0; i<M1.length; i++) {
    for (int j=0; j<M1.length; j++) {
      if (M1[i][j]!=M2[i][j])
        return false;
    }
  }
  return true;
}
int[][] creeMatNull(int n) {
  int[][] M=new int[n][n];
  for (int i=0; i<M.length; i++) {
    for (int j=0; j<M.length; j++) {
      if (i==j)
        M[i][j]=0;
      else M[i][j]=0;
    }
  }
  return M;
}
int[][] matricetransitive(graphe g) {
  int[][] M=adjacence(g);
  int[][] Id=creeMatNull(M.length);
  int[][] Mtemp=new int[M.length][M.length];
  affichermatrice(Id);
  affichermatrice(M);
  Mtemp=Id;
  int i=1;
  while (egal(Mtemp, somme(Mtemp, puissance(M, i)))==false) {
    Mtemp=somme(Mtemp, puissance(M, i));
    i++;
    affichermatrice(Mtemp);
  }
  return Mtemp;
}
void setup() {
  fill(250);
  size(1600, 800);
  if (askChar("Tapez O pour oriente N sinon;")=='O') {
    oriente=false;
  } else {
    oriente=true;
  }
  graphe g = saisie_graphe();
  affichageMatrice(adjacence(g), matricetransitive(g));
  matricetransitive(g);
  Sommet[] S_gen=recurCouleurAppel(M_gen);
  if (askChar("Tapez O pour ordonnancer N sinon;")=='O') {
    fill(255,0,0);
    text("Ordonnancement:",100,400);
    Pile P=new Pile();
    recurOrdonnancement(adjacence(g), P, 0);
  }
}
