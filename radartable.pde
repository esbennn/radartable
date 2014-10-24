ArrayList <Ingredienser> ingredienser = new ArrayList<Ingredienser>();
private Ingredienser[] protIngredienser = new Ingredienser[6];

void setup() {
  
  size(1000, 800);
  for (int i=0; i<protIngredienser.length; i++) {
    protIngredienser[i] = new Ingredienser (str(i), i*(width/6)+100, 100); //size and placement of circles
  }
}

void draw() {
  background (0, 0, 51);
  for (int i=0; i<protIngredienser.length; i++) {

    protIngredienser[i].update();
  }
  for (int i=0; i<ingredienser.size(); i++) {

    ingredienser.get(i).update();
  }
}

void mousePressed() {
  for (int i=0; i<protIngredienser.length; i++) {
    boolean imagePressed = protIngredienser[i].pressingOfMouse();

    if (imagePressed) {
      PImage tempImage = protIngredienser[i].getUsedPicture();
      float tempX = protIngredienser[i].getX();
      float tempY = protIngredienser[i].getY();
      ingredienser.add(new Ingredienser(tempX, tempY, tempImage));
    }
  }
  for (int j=0; j<ingredienser.size(); j++) {
    boolean imagePressed2 = ingredienser.get(j).pressingOfMouse();
  }
}

void mouseDragged() {

  for (int i=0; i<ingredienser.size(); i++) {

    ingredienser.get(i).mousedrag(); //check if mouse is dragging each circle
  }
}

void mouseReleased() {

/*  for (int i=0; i<protIngredienser.length; i++) {
    protIngredienser[i].setMouseReleased(false);
  }*/

  for (int j=0; j<ingredienser.size(); j++) {
    ingredienser.get(j).setMouseReleased(false);
  }
}

