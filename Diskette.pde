Class Diskette{
  
  
   float brickX = tbri.getScreenX(width);
    float brickY = tbri.getScreenY(height);
    
    

    stroke(50, 255, 0);       
    noFill();
    // Draw an ellipse around the brick
    ellipse(brickX, brickY, brickSize, brickSize);
    fill(255);
    text("ID || 0"+tbri.getSymbolID(), brickX, brickY-brickSize*0.55);
}
