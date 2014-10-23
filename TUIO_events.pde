// These are all functions, that are automatically called when something happens on the Radar-table.
// "tbri" and "tcur", again, refers to the objects and cursors in question.

// Called when an object (tbri) is added to the table
void addTuioObject(TuioObject tbri) {
  // ---PLACE CODE HERE---
}

// Called when an object is removed from the table
void removeTuioObject(TuioObject tbri) {
  // ---PLACE CODE HERE---
}

// Called repeatedly, while an object is moved around on the table
void updateTuioObject (TuioObject tbri) {
  // ---PLACE CODE HERE---
}

// Called when a cursor is added to the table
void addTuioCursor(TuioCursor tcur) {
  // ---PLACE CODE HERE---
}

// Called repeatedly, while a cursor is moved around on the table
void updateTuioCursor (TuioCursor tcur) {
  // ---PLACE CODE HERE---
}

// Called when a cursor is removed from the table
void removeTuioCursor(TuioCursor tcur) {
  // ---PLACE CODE HERE---
}

// Automatically called after each package of data is recieved from TUIO,
// representing the end of an image frame.
void refresh(TuioTime bundleTime) { 
  redraw();
}
