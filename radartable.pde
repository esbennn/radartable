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
float cursorSize = 15;
float brickSize = 90;
float fontSize = 8;

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
// By default, it is executed repeatedly, 60 times per second.

void draw()
{
  // Set the background to white (255)
  background(255);
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
     
     // ---PLACE CODE HERE---
     
   }

  // Then the exact same things happen to the cursors (fingers) on the table.

   Vector tuioCursorList = tuioClient.getTuioCursors();
   for (int i=0;i<tuioCursorList.size();i++) {
     TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
     
     // Then, code for the individual TuioCursor (tcur) may be executed.
     // "tcur" now refers to the current cursor being handled.
    
     // ---PLACE CODE HERE---
     
   }
   
}
