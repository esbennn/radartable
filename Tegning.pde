class Tegning {

  long ownerId;
  float  disketteX;
  float disketteY;
  boolean isVisible = true;


  //ArrayList<float> distance = new ArrayList<float>();
  //ArrayList<String> points = new ArrayList<String>();
  ArrayList<Linje> linjer = new ArrayList<Linje>();

  Tegning(long id) {
    //linjer.add(new Linje (x,y );

    ownerId = id;
  }

  void update() {
    
    if(isVisible){
    for (int i = 1; linjer.size()>2 &&i< linjer.size(); i++) {
      //println("tegningUpdate is run");

      float x1 = linjer.get(i-1).getX();
      float y1 = linjer.get(i-1).getY();
        float x2 = linjer.get(i).getX();
        float y2 = linjer.get(i).getY();

      /*String [] nums = split(points.get(i-1), ",");
       String [] nums2 = split(points.get(i), ",");
       stroke(120);
       //println(nums);
       //println(nums2);
       float x1 = Float.valueOf(nums[0]).floatValue();
       float y1 = Float.valueOf(nums[1]).floatValue();
       float x2 = Float.valueOf(nums2[0]).floatValue();
       float y2 = Float.valueOf(nums2[1]).floatValue();*/
stroke(0);
      line(x1, y1, x2, y2);
    }
    }
  }

  void update(int x, int y) {


    linjer.add(new Linje(x, y));
  }
  
  void sendDisketteList(ArrayList<Diskette> disketteList){
    for (int i = 1; i< linjer.size(); i++) {
      linjer.get(i).setContainer(disketteList);
      
    }
  }

 /* void addPos(x,y) {
    points.add(x,y);
  }*/

  long getOwnerId() {
    return ownerId;
  }

  void objectDrag(TuioObject tbri) {

    float containerX = tbri.getScreenX(width);
    float containerY = tbri.getScreenY(height);

    for (int i = 0; i< linjer.size(); i++) {


      float x1 = linjer.get(i).getX();
      float y1 = linjer.get(i).getY();
      //println("objectdrag halvejs kørt");
      float newX = containerX - linjer.get(i).getContainerDistX();
      float newY = containerY - linjer.get(i).getContainerDistY();
      //println("objectdrag tegning er kørt, new x er " + newX+ "gamle x1 er " + x1 );

      linjer.get(i).setX(newX);
      linjer.get(i).setY(newY);
    }
  }
    void setVisibility(boolean isVisible){
    this.isVisible = isVisible;
  }


 /* void findOwnerPos() {
    for (int i = 0; i< disketteList.size(); i++) {
      if (disketteList.get(i).getId == ownerId) {
        disketteX = disketteList.get(i).getX();
        disketteY = disketteList.get(i).getY();
      }
    }
  }*/
}

