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
  Long containerId; //for keeping track of which container this ingredient is in
  Float containerDistX = 0f;
  Float containerDistY = 0f;
  boolean lockedToObject = false;
  boolean isVisible = true;

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
    if (isVisible){
      imageMode(CENTER);
      image(food, bx, by, foodWidth, foodHeight);
    }
  }

  /*  public void update(TuioObject tbri) {
   imageMode(CENTER);
   image(food, bx, by, 80, 80);
   }*/

  void mousedrag(int x, int y) { //checks if the specific circle is pressed, and "pushes" a boolean, and changes the x and y variables to whereever the mouse is
    boolean isMousePressed = pressingOfMouse(x, y);
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
    if (fingerId == this.fingerId) {
      locked = true;
      //  println("object under finger #" + this.fingerId + " is now locked");
      this.fingerId = 0;
    }
  }

  void unlock(long fingerId) {
    locked = false;
    this.fingerId = fingerId;
    //  println("object under finger #" + this.fingerId + " is now unlocked");
  }
  
  void lockToObject(boolean lock){
    lockedToObject = lock;
  }


  void setContainer(ArrayList<Diskette> disketter) {
    lockToObject(false);
    for (int i=0; i<disketter.size (); i++) {
      float distance = dist(bx, by, disketter.get(i).getX(), disketter.get(i).getY());
      if (distance < disketter.get(i).getRadius()-20) {
        //println("i'm now owned by container #" + disketter.get(i).getId());
        if(!lockedToObject){
          containerId = disketter.get(i).getId();
          //println(getUsedPicture() + " i'm now owned by container #" + disketter.get(i).getId());
          containerDistX = disketter.get(i).getX() -bx;
          containerDistY = disketter.get(i).getY() - by;
          
          lockToObject(true);
        //  println("Am i locked? " + lockedToObject);
        }
      } else {
        //lockToObject(false);
      }
    }
  }

  void objectDrag(TuioObject tbri) {
    if (lockedToObject){
      float containerX = tbri.getScreenX(width);
      float containerY = tbri.getScreenY(height);
      float newX = containerX - containerDistX;
      float newY = containerY - containerDistY;
      bx = (int) newX;
      by = (int) newY;
    }
  }

  PImage getUsedPicture() {
    return food;
  }
  
  void setVisibility(boolean isVisible){
    this.isVisible = isVisible;
  }

  int getX() {
    return bx;
  }

  int getY() {
    return by;
  }

  Long getContainerId() {
    return containerId;
  }
}

