class Ingredienser { //the circles class. Here, everything concerning the change of the behavior and appearance of each circle is manipulated
   PImage food;
  boolean clicked;
  boolean dragged;
  int boxSize = 50;
  boolean overBox = false;
  float foodWidth = 80;
  float foodHeight = 80;
  float xOffset = 0.0; 
  float yOffset = 0.0; 
  boolean locked = false;
  float bx;
  float by;

  Ingredienser(String i, float _bx, float _by) {
    clicked = false;
    dragged = false;
    food = loadImage("mad" +i+".png");
    bx = _bx;
    by= _by;
  }

  Ingredienser(float _bx, float _by, PImage _image) {
    clicked = false;
    dragged = false;
    bx = _bx;
    by= _by;
    food = _image;
  }
  public void update() {
    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
      overBox = true;  
      if (!locked) { 
        stroke(255);
      }
    } 
    else {

      overBox = false;
    }
    imageMode(CENTER);
    image(food, bx, by, foodWidth, foodHeight);
  }

  void mousedrag(int x, int y) { //checks if the specific circle is pressed, and "pushes" a boolean, and changes the x and y variables to whereever the mouse is
    println("mousedrag");
    if (locked) {
      bx = x-xOffset; 
      by = y-yOffset; 
      println("yesss");
    }
  }

  boolean pressingOfMouse(int x, int y) {
    println("jeps");
    if (overBox) { 
      locked = true; 
      fill(255, 255, 255);
    } 
    else {
      locked = false;
    }
    xOffset = x-bx; 
    yOffset = y-by;
    return locked;
  }

  void setMouseReleased(boolean released) {
    locked = released;
  }

  PImage getUsedPicture() {
    return food;
  }

  float getX() {
    return bx;
  }

  float getY() {
    return by;
  }
}

