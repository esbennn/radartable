ArrayList <Ingredienser> ingredienser = new ArrayList<Ingredienser>();
private Ingredienser[] protIngredienser;// = new Ingredienser[6];

void setup() {
  
  size(1000, 800);
 // for (int i=0; i<protIngredienser.length; i++) {
 //   protIngredienser[i] = new Ingredienser (str(i), i*(width/6)+100, 100); //size and placement of circles
 // }
 String imgPath = sketchPath + "/pics";
 File[] files = listFiles(imgPath);
 println(files);
 println(files.length);
 protIngredienser = new Ingredienser[files.length];
 
 for (int i = 0; i<files.length; i++){
   //create image
   PImage img = loadImage(files[i].toString());
   //create new ingredient with above image
   Ingredienser newIngredient = new Ingredienser(i*(width/files.length)+100, 100, img);
   //add the ingredient to protIngredienser
   protIngredienser[i] = newIngredient;
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

//returnerer indholdet af den mappe, der gives med som argument
File[] listFiles(String dir) {
 File file = new File(dir);
 if (file.isDirectory()) {
   File[] files = file.listFiles();
   return files;
 } else {
   // .... hvis stien ikke er en mappe
   return null;
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

