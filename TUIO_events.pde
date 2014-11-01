// These are all functions, that are automatically called when something happens on the Radar-table.
// "tbri" and "tcur", again, refers to the objects and cursors in question.

// Called when an object (tbri) is added to the table
void addTuioObject(TuioObject tbri) {
  if (!checkTuioId(tbri.getSymbolID())) {
    disketteList.add(new Diskette(tbri));
  } else {
    for (int i = 0; i < disketteList.size (); i++) {
      if (disketteList.get(i).getId() == tbri.getSymbolID()) {
        disketteList.get(i).setOnScreen(true);
      }
    }
    for (int i=0; i<ingredienser.size (); i++) {
      if (ingredienser.get(i).getContainerId() == tbri.getSymbolID()) {
        ingredienser.get(i).setVisibility(true);
      }
    }
  }
}

// Called when an object is removed from the table
void removeTuioObject(TuioObject tbri) {
  for (int i = 0; i<disketteList.size (); i++) {
    if (disketteList.get(i).getId() == tbri.getSymbolID()) {
      disketteList.get(i).setOnScreen(false);
    }
  }
  for (int i=0; i<ingredienser.size (); i++) {
    if (ingredienser.get(i).getContainerId() == tbri.getSymbolID()) {
      ingredienser.get(i).setVisibility(false);
    }
  }
}

// Called repeatedly, while an object is moved around on the table
void updateTuioObject (TuioObject tbri) {
  for (int i=0; i<disketteList.size (); i++) {
    if (tbri.getSymbolID()==disketteList.get(i).getId()) {
      disketteList.get(i).update(tbri);
    }
  }

  for (int i=0; i<ingredienser.size (); i++) {
    if (ingredienser.get(i).getContainerId() == tbri.getSymbolID()) {
      ingredienser.get(i).objectDrag(tbri);
    }
  }
}

// Called when a cursor is added to the table
void addTuioCursor(TuioCursor tcur) {
  int x = tcur.getScreenX(width);
  int y = tcur.getScreenY(height);
  for (int i=0; i<protIngredienser.length; i++) {
    if (protIngredienser[i].pressingOfMouse(x, y)) {
      PImage tempImage = protIngredienser[i].getUsedPicture();
      //    tempImage.resize(,);
      int tempX = protIngredienser[i].getX();
      int tempY = protIngredienser[i].getY();
      ingredienser.add(new Ingredienser(tempX, tempY, tempImage));
    }
  }

  for (int j=0; j<ingredienser.size (); j++) {
    if (ingredienser.get(j).pressingOfMouse(x, y)) {
      ingredienser.get(j).unlock(tcur.getSessionID());
    }
  }

  for (int k=0; k<ingredienser.size (); k++) {
    long disketteId = disketteId(x,y);
    if (!ingredienser.get(k).pressingOfMouse(x, y)&& disketteId!= 0) {
      String pos = str(x) +","+ str(y);
     
        tegningList.add(new Tegning(pos, disketteId));
    }
  }
}

// Called repeatedly, while a cursor is moved around on the table
void updateTuioCursor (TuioCursor tcur) {
  int x = tcur.getScreenX(width);
  int y = tcur.getScreenY(height);
  for (int i=0; i<ingredienser.size (); i++) {
    ingredienser.get(i).mousedrag(x, y); 
    ingredienser.get(i).lockToObject(false);
  }
}

// Called when a cursor is removed from the table
void removeTuioCursor(TuioCursor tcur) {
  for (int j=0; j<ingredienser.size (); j++) {
    ingredienser.get(j).lock(tcur.getSessionID());
  }
}

// Automatically called after each package of data is recieved from TUIO,
// representing the end of an image frame.
void refresh(TuioTime bundleTime) { 
  redraw();
}

