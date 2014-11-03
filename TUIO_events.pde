// These are all functions, that are automatically called when something happens on the Radar-table.
// "tbri" and "tcur", again, refers to the objects and cursors in question.

// Called when an object (tbri) is added to the table
void addTuioObject(TuioObject tbri) {
  if (!checkTuioId(tbri.getSymbolID())) {
    disketteList.add(new Diskette(tbri));
  } 
  else {
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
      for( int i = 0; i<tegningList.size();i++){
    if (tegningList.get(i).getOwnerId() == tbri.getSymbolID()) {
      tegningList.get(i).setVisibility(true);

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
  
  for( int i = 0; i<tegningList.size();i++){
    if (tegningList.get(i).getOwnerId() == tbri.getSymbolID()) {
      tegningList.get(i).setVisibility(false);
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

  for (int i=0; i<tegningList.size (); i++) {
    println(tegningList.size());
    if (tegningList.get(i).getOwnerId() == tbri.getSymbolID()) {
      println("object " +i+ " is dragged");
      tegningList.get(i).objectDrag(tbri);
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
  // drawing objects are created and added to tegningList

  long disketteId = disketteId(x, y);
  if (ingredienser.size()>0) {

    for (int k=0; k<ingredienser.size (); k++) {


      if (!ingredienser.get(k).pressingOfMouse(x, y)&& disketteId(x, y)!= 0) {
        // String pos = str(x) +","+ str(y);

        tegningList.add(new Tegning(disketteId));
      }
    }
  }

  else if (disketteId(x, y)!= 0) {
    tegningList.add(new Tegning(disketteId));
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

  //while drawing with finger, positions are added to the last tegning objects internal array
  //println(tegningList.size());
boolean shouldIDraw = true;
    for (int k=0; k<ingredienser.size (); k++) {
      if (ingredienser.get(k).pressingOfMouse(x, y)) {
        shouldIDraw = false;
      }
    }
    
    if (shouldIDraw && disketteId(x,y)!=0){
      tegningList.get(tegningList.size()-1).update(x, y);
    }
  

//  else if (ingredienser.size()<1 && disketteId(x, y)!= 0) {
//
//    tegningList.get(tegningList.size()-1).update(x, y);
//  }
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

