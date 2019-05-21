void affichageMatrice(int[][] M1, int[][] M2) {
  fill(255, 0, 0, 125);
  text("Matrice D'adjacence", 100, 50);
  text("Matrice Transitive", 900, 50);
  fill(0);
  int x=100;
  textMatrice(M1, x);
  x=900;
  textMatrice(M2, x);
}
void textMatrice(int[][] matrice, int x) {
  int y=100;
  int x_save=x;
  for (int i=0; i<matrice.length; i++) {
    for (int j=0; j<matrice.length; j++) {
      text(matrice[i][j], x, y);
      x+=50;
    }
    y+=50;
    x=x_save;
  }
}
void tracerGraphe(){

}
