class Diskette {
  float brickX;
  float brickY;
  long id;
  float radius = 50;
  boolean onScreen = true;

  Diskette(TuioObject tbri) {
    this.brickX = tbri.getScreenX(width);
    this.brickY = tbri.getScreenY(height);
    this.id = tbri.getSymbolID();
  }

  void update(TuioObject tbri) {
    if (onScreen) {
      this.brickX = tbri.getScreenX(width);
      this.brickY = tbri.getScreenY(height);
      //      stroke(50, 255, 0);       
      //      noFill();
      //      // Draw an ellipse around the brick
      //      ellipse(brickX, brickY, radius, radius);
      //      fill(255);
      //text("ID || 0"+tbri.getSymbolID(), brickX, brickY-brickSize*0.55);
     // println("brick: " + brickX+" ; "+brickY);
     changeRadius(tbri);
    }
  }

  void drawBrick() {
    if (onScreen) {
      stroke(#EAEAEA);       
      fill(#EAEAEA);
      // Draw an ellipse around the brick
      ellipseMode(RADIUS);
      ellipse(brickX, brickY, radius, radius);
    }
  }

  void changeRadius(TuioObject tbri) {
  
    if (tbri.getSymbolID() == this.id) { 
      float Speed = tbri.getRotationSpeed();
      if (Speed>0 && radius < 250) {
        radius += 3;
      }
      else if (Speed<0 && radius > 50) {
        radius-=3;
      }
     // println(Speed);
    }
  }

  public long getId() {
    return this.id;
  }
  public float getX(){
    return this.brickX;
  }
  public float getY() {
    return this.brickY;
  }
  public float getRadius(){
    return this.radius;
  }
  public void setOnScreen(boolean onScreen) {
    this.onScreen = onScreen;
  }
}

