import TUIO.*;
import java.util.*;
// Declaring a "TuioProcessing"-object
TuioProcessing tuioClient;
float cursorSize = 20;
float brickSize = 90;
float fontSize = 8;
PFont font;
ArrayList<Diskette> disketteList = new ArrayList<Diskette>();

ArrayList <Ingredienser> ingredienser = new ArrayList<Ingredienser>();
private Ingredienser[] protIngredienser;// = new Ingredienser[6];

float curX;
float curY;
void setup() {

  size(1000, 800);

  tuioClient  = new TuioProcessing(this);

  String imgPath = sketchPath + "/pics";
  File[] files = listFiles(imgPath);
  println(files);
  println(files.length);
  protIngredienser = new Ingredienser[files.length];

  for (int i = 0; i<files.length; i++) {
    //create image
    PImage img = loadImage(files[i].toString());
    //create new ingredient with above image
    Ingredienser newIngredient = new Ingredienser(i*(width/files.length)+100, 50, img);
    //add the ingredient to protIngredienser
    protIngredienser[i] = newIngredient;
  }
}

void draw() {
  background (0, 0, 51);
  for (int i=0; i<disketteList.size (); i++) {
    disketteList.get(i).drawBrick();
  }
  for (int i=0; i<protIngredienser.length; i++) {

    protIngredienser[i].update();
  }
  
  //draw a line under protingredients
  
  stroke(#3C3C71);
  line(0,100,width,100);
  
  for (int i=0; i<ingredienser.size (); i++) {
    //println(curX + curY);
    ingredienser.get(i).update();
  }

  // Import all TUIO-objects on the table (as a "Vector"-object),
  // and store them in "TuioObjectList". A "Vector" is NOT like a vector in
  // mathematics - in this case, it is a sort of list of several "raw" TUIO-objects.

  //DISKETTERELATERET KODE
  //  Vector TuioObjectList = tuioClient.getTuioObjects();



  //FINGERRELATERET KODE
  Vector tuioCursorList = tuioClient.getTuioCursors();

  for (int i=0; i<tuioCursorList.size (); i++) {
    TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);

    // Then, code for the individual TuioCursor (tcur) may be executed.
    // "tcur" now refers to the current cursor being handled.

    // -> -> -> ---NEW CODE--- <- <- <- //

    curX = tcur.getScreenX(width);
    curY = tcur.getScreenY(height);

    //Set the stroke to cyan, using a fixed alpha-value
    stroke(50, 255, 255, 100);
    noFill();

    // Draw an ellipse around the cursor
    ellipse(curX, curY, cursorSize, cursorSize);
  }
  
  //loop gennem alle ingredienser og check om de er oven i en diskette
  for (int i=0; i<ingredienser.size(); i++){
    ingredienser.get(i).setContainer(disketteList);
  }
}

boolean checkTuioId(long id) {
  boolean idIsMatched = false;

  for (int i=0; i<disketteList.size (); i++) {
    if (id == disketteList.get(i).getId()) {

      idIsMatched = true;
    }
  }
  return idIsMatched;
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


/*
void mousePressed() {
 for (int i=0; i<protIngredienser.length; i++) {
 boolean imagePressed = protIngredienser[i].pressingOfMouse(mouseX, mouseY);
 
 if (imagePressed) {
 PImage tempImage = protIngredienser[i].getUsedPicture();
 float tempX = protIngredienser[i].getX();
 float tempY = protIngredienser[i].getY();
 ingredienser.add(new Ingredienser(tempX, tempY, tempImage));
 }
 }
 
 for (int j=0; j<ingredienser.size(); j++) {
 boolean imagePressed2 = ingredienser.get(j).pressingOfMouse(mouseX, mouseY);
 }
 }
 
 void mouseDragged() {
 
 for (int i=0; i<ingredienser.size(); i++) {
 
 ingredienser.get(i).mousedrag(mouseX, mouseY); //check if mouse is dragging each circle
 }
 }
 
 void mouseReleased() {
 
 for (int i=0; i<protIngredienser.length; i++) {
 protIngredienser[i].setMouseReleased(false);
 }
 
 for (int j=0; j<ingredienser.size(); j++) {
 ingredienser.get(j).setMouseReleased(false);
 }
 }
 */
