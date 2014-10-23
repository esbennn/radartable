//----------------------------------------------------------------

// Everything out in this root-part of the program (outside the "setup", "draw", etc.)
// Everything is executed once - declarations are made,
// and libraries imported, but functions cannot be called.
// ...that is what the "setup"-function below is reserved for.

//----------------------------------------------------------------

// Importing TUIO library + basic java stuff
import TUIO.*;
import java.util.*;
// Declaring a "TuioProcessing"-object
TuioProcessing tuioClient;

// General variables, so we can quickly nudge the size of things into place
float cursorSize = 20;
float brickSize = 90;
float fontSize = 8;

float[] brickCharge = new float[999];
// Declaring the default font-object for writing stuff
PFont font;

// This is the "setup"-function.
// It is executed automatically when the sketch starts,
// *after* everything in the root-part of the program (see above).
// Everything inside the brackets below, is thus executed only once.
void setup()
{
  // Size of the window
  size(1024, 768);
  // Remove contours
  noStroke();
  // Set the default fill-color to black (0)
  fill(0);
  // Set the default orientation to centered
  textAlign(CENTER);
  
  // Set the frame rate to 30 or less instead of 60 (the default) - may become neccisary (?)
  //frameRate(30);
  
  // Create a font for labeling etc.
  font = createFont("Arial", fontSize);
  // Set the scale factor based on the relationship between table and sketch size.
  //scaleFactor = height/tableSize;
  
  // Create the "TuioProcessing"-object that we declared earlier
  tuioClient  = new TuioProcessing(this);
}

// This is the "draw"-function.
// Be default, it is executed repeatedly, 60 times per second.

void draw()
{
  // Set the background to dark gray (25)
  background(25);
  // Set the default font to the previously created font-object,
  // using the default font-size.
  textFont(font,fontSize);
  
  // Import all TUIO-objects on the table (as a "Vector"-object),
  // and store them in "TuioObjectList". A "Vector" is NOT like a vector in
  // mathematics - in this case, it is a sort of list of several "raw" TUIO-objects.
  Vector TuioObjectList = tuioClient.getTuioObjects();
  
  // Using a for-loop; run through each element in "TuioObjectList".
  // The code inside the brackets is thus executed for *each* TUIO-brick
  // in "TuioObjectList".
  for (int i=0;i<TuioObjectList.size();i++) {
     // Declaring an actual usable "TuioObject" named "tbri",
     // and using the raw data extraced from the list, which is
     // converted into a "TuioObject".
     TuioObject tbri = (TuioObject)TuioObjectList.elementAt(i);
     
     // Then, code for the individual TuioObject (tbri) may be executed.
     // "tbri" now refers to the current brick being handled.
     
     // ---EXAMPLE CODE---
     
     float brickX = tbri.getScreenX(width);
     float brickY = tbri.getScreenY(height);
     
     // Set stroke to lime green, and no fill
     stroke(50,255,0);       
     noFill();
     
     // Draw an ellipse around the brick
     ellipse(brickX, brickY, brickSize, brickSize);
     
     // Draw artifacts around the brick
     float angle = tbri.getAngle()+0.25*PI;
     for (int n=0; n<=4; n++)
     {
       ellipse(brickX+cos(angle+n*1.5708)*brickSize/3, brickY+sin(angle+n*1.5708)*brickSize/3, brickSize/20, brickSize/20);
     }
     
     // Updates the "charge", connected to the brick's ID, increasing it with the rotation
     brickCharge[int(tbri.getSessionID())] = min( 1, max( 0, brickCharge[int(tbri.getSessionID())]+tbri.getRotationSpeed()/20 ) );
     
     // Set the fill (required for text) to white and label the brick
     fill(255);
     text("ID || 0"+tbri.getSymbolID(), brickX, brickY-brickSize*0.55);

     // Draw connecting lines: run through all *other* bricks
     for (int j=0;j<TuioObjectList.size();j++)
     {
       // Make sure, the brick isn't trying to draw a line to itself
       if (i != j)
       {
         // Declare "tbri2" and extract the new brick from the list
         TuioObject tbri2 = (TuioObject)TuioObjectList.elementAt(j);
         
         float subBrickX = tbri2.getScreenX(width);
         float subBrickY = tbri2.getScreenY(height);
         
         // Calculate and store an alpha-value, based on "brickCharge"
         float a = brickCharge[int(tbri.getSessionID())]*255;
         //Set the stroke to (a subtle version of) lime green, using this alpha-value
         stroke(50,255,0, a/3);
         
         // Draw a line between the original brick, and the new "tbri2"
         line(brickX, brickY, subBrickX, subBrickY);
         
         // Calculate the distance from "tbri" to "tbri2"
         float distance = round(dist(brickX, brickY, subBrickX, subBrickY));
         
         // Set the alpha and draw a label, stating this distance at the average X and Y between the two points
         fill (255, a);
         text(str(distance), (brickX+subBrickX)/2, (brickY+subBrickY)/2);
       }
     }

     // ---EXAMPLE CODE END---
   }

  // Then the exact same things happen to the cursors (fingers) on the table.

   Vector tuioCursorList = tuioClient.getTuioCursors();
   for (int i=0;i<tuioCursorList.size();i++) {
     TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
     
     // Then, code for the individual TuioCursor (tcur) may be executed.
     // "tcur" now refers to the current cursor being handled.
    
     // -> -> -> ---NEW CODE--- <- <- <- //
     
     float curX = tcur.getScreenX(width);
     float curY = tcur.getScreenY(height);
     
     //Set the stroke to cyan, using a fixed alpha-value
     stroke(50,255,255, 100);
     noFill();
     
     // Draw an ellipse around the cursor
     ellipse(curX, curY, cursorSize, cursorSize);
     
     // Draw connecting (cyan) lines: run through all bricks
     for (int j=0;j<TuioObjectList.size();j++)
     {
       // Declare "tbri2" and extract the new brick from the list
       TuioObject tbri2 = (TuioObject)TuioObjectList.elementAt(j);
       
       float subBrickX = tbri2.getScreenX(width);
       float subBrickY = tbri2.getScreenY(height);
       
       // Draw a line between the original brick, and the new "tbri2"
       line(curX, curY, subBrickX, subBrickY);
       
       // Calculate the distance from "tbri" to "tbri2"
       float distance = round(dist(curX, curY, subBrickX, subBrickY));
       
       // Set the color and draw a label, stating this distance at the average X and Y between the two points
       fill(255);
       text(str(distance), (curX+subBrickX)/2, (curY+subBrickY)/2);
     }
     
   }
   
}
