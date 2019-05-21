int conteur=0;
void mouseClicked() {
  if (conteur<S_gen.length) {
    S_gen[conteur].x=mouseX;
    S_gen[conteur].y=mouseY;
    switch(S_gen[conteur].couleur) {
    case 1:
      fill(255, 0, 0);
      break;
    case 2:
      fill(0, 255, 0);
      break;
    case 3:
      fill(0, 0,255);
      break;
    default:
      fill(50*S_gen[conteur].couleur);
    }
    ellipse(mouseX, mouseY, 40, 40);
    fill(0);
    textSize(24);
    text(S_gen[conteur].num+1, mouseX, mouseY);
    conteur++;
  } else {
    for (int i=0; i<S_gen.length; i++) {
      for (int j=0; j<S_gen.length; j++) {
        if (M_gen[S_gen[i].num][S_gen[j].num]!= 0)
          line(S_gen[i].x, S_gen[i].y, S_gen[j].x, S_gen[j].y);
      }
    }
  }
}
void draw() {
}
