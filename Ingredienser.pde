class Ingredienser { //the circles class. Here, everything concerning the change of the behavior and appearance of each circle is manipulated
   PImage food;
  boolean clicked;
  boolean dragged;
  int boxSize = 50;
  boolean overBox = false;
  float foodWidth = 80;
  float foodHeight = 80;
  int xOffset = 0; 
  int yOffset = 0; 
  boolean locked = true;
  int bx;
  int by;
  long fingerId; //for keeping track of which finger is over this particular image, so only this image gets locked when that finger is removed. Multitouch-support.

  Ingredienser(String i, int _bx, int _by) {
    clicked = false;
    dragged = false;
    food = loadImage("mad" +i+".png");
    bx = _bx;
    by= _by;
  }

  Ingredienser(int _bx, int _by, PImage _image) {
    clicked = false;
    dragged = false;
    bx = _bx;
    by= _by;
    food = _image;
  }
  
    public void update() {
    imageMode(CENTER);
    image(food, bx, by, foodWidth, foodHeight);
  }

  void mousedrag(int x, int y) { //checks if the specific circle is pressed, and "pushes" a boolean, and changes the x and y variables to whereever the mouse is
  boolean isMousePressed = pressingOfMouse(x,y);
    if (isMousePressed && !locked) {
      bx = x; 
      by = y;
    }
  }

  boolean pressingOfMouse(int x, int y) {
    boolean mouseIsOver = false;
    if (x > bx-boxSize && x < bx+boxSize && 
      y > by-boxSize && y < by+boxSize) { 
    mouseIsOver = true;
    } 
    xOffset = x-bx; 
    yOffset = y-by;
    return mouseIsOver;
  }

  void lock(long fingerId) {
    if(fingerId == this.fingerId){
      locked = true;
      println("object under finger #" + this.fingerId + " is now locked");
      this.fingerId = 0;
    }
  }
  
  void unlock(long fingerId){
    locked = false;
    this.fingerId = fingerId;
    println("object under finger #" + this.fingerId + " is now unlocked");
  }

  PImage getUsedPicture() {
    return food;
  }

  int getX() {
    return bx;
  }

  int getY() {
    return by;
  }
}

