class Linje {
  float x;
  float y;
  float distanceX;
  float distanceY;
    float containerDistX = 0;
  float containerDistY = 0;

  Linje(int x, int y) {
    this.x = x;
    this.y = y;
 
  }

  void setContainer(ArrayList<Diskette> disketter) {

    for (int i=0; i<disketter.size (); i++) {
      float distance = dist(x, y, disketter.get(i).getX(), disketter.get(i).getY());
      if (distance < disketter.get(i).getRadius()-20) {
        //println("i'm now owned by container #" + disketter.get(i).getId());

        
        //println(getUsedPicture() + " i'm now owned by container #" + disketter.get(i).getId());
        containerDistX = disketter.get(i).getX() -x;
        containerDistY = disketter.get(i).getY() - y;
      }
    }
  }
  
  float getContainerDistX(){
    return containerDistX;
    
  }
  
    float getContainerDistY(){
    return containerDistY;
    
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
  
  void setX(float x){
    this.x = x;
  }
  
 void  setY(float y){
    this.y = y;
  }
}

