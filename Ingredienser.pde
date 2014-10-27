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
//  public void update() {
//    if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
//      mouseY > by-boxSize && mouseY < by+boxSize) {
//      overBox = true;  
//      if (!locked) { 
//        stroke(255);
//      }
//    } 
//    else {
//
//      overBox = false;
//    }
//    imageMode(CENTER);
//    image(food, bx, by, foodWidth, foodHeight);
//  }
    public void update(float x, float y) {
      float tempX = x;
      float tempY = y;
      
    if (tempX > bx-boxSize && tempX < bx+boxSize && 
      tempY > by-boxSize && tempY < by+boxSize) {
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
  boolean isMousePressed = pressingOfMouse(x,y);
  println(isMousePressed);
    if (isMousePressed) {
      bx = x-xOffset; 
      by = y-yOffset; 
     
    }
  }

  boolean pressingOfMouse(int x, int y) {
    boolean mouseIsOver = false;
    if (x > bx-boxSize && x < bx+boxSize && 
      y > by-boxSize && y < by+boxSize) { 
    //  locked = true; 
    //  fill(255, 255, 255);
    mouseIsOver = true;
    } 
//    else {
//      locked = false;
//    }
    xOffset = x-bx; 
    yOffset = y-by;
    //return locked;
    return mouseIsOver;
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

