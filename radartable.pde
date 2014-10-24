import TUIO.*;
import java.util.*;
// Declaring a "TuioProcessing"-object
TuioProcessing tuioClient;
float cursorSize = 20;
float brickSize = 90;
float fontSize = 8;
PFont font;
ArrayList <Ingredienser> ingredienser = new ArrayList<Ingredienser>();
private Ingredienser[] protIngredienser = new Ingredienser[6];

void setup() {

  size(1000, 800);
  for (int i=0; i<protIngredienser.length; i++) {
    protIngredienser[i] = new Ingredienser (str(i), i*(width/6)+100, 100); //size and placement of circles
  }
  tuioClient  = new TuioProcessing(this);
}

void draw() {
  background (0, 0, 51);
  for (int i=0; i<protIngredienser.length; i++) {

    protIngredienser[i].update();
  }
  for (int i=0; i<ingredienser.size(); i++) {

    ingredienser.get(i).update();
  }

  // Import all TUIO-objects on the table (as a "Vector"-object),
  // and store them in "TuioObjectList". A "Vector" is NOT like a vector in
  // mathematics - in this case, it is a sort of list of several "raw" TUIO-objects.
  //DISKETTERELATERET KODE
  Vector TuioObjectList = tuioClient.getTuioObjects();

  for (int i=0;i<TuioObjectList.size();i++) {
    TuioObject tbri = (TuioObject)TuioObjectList.elementAt(i);

    float brickX = tbri.getScreenX(width);
    float brickY = tbri.getScreenY(height);


    stroke(50, 255, 0);       
    noFill();
    // Draw an ellipse around the brick
    ellipse(brickX, brickY, brickSize, brickSize);
    fill(255);
    text("ID || 0"+tbri.getSymbolID(), brickX, brickY-brickSize*0.55);
  }

  //FINGERRELATERET KODE
  Vector tuioCursorList = tuioClient.getTuioCursors();
  
  for (int i=0;i<tuioCursorList.size();i++) {
    TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);

    // Then, code for the individual TuioCursor (tcur) may be executed.
    // "tcur" now refers to the current cursor being handled.

    // -> -> -> ---NEW CODE--- <- <- <- //

    float curX = tcur.getScreenX(width);
    float curY = tcur.getScreenY(height);

    //Set the stroke to cyan, using a fixed alpha-value
    stroke(50, 255, 255, 100);
    noFill();

    // Draw an ellipse around the cursor
    ellipse(curX, curY, cursorSize, cursorSize);
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

