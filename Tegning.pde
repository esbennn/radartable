class Tegning{
  boolean isVisible = true;
  long ownerId;
  
  ArrayList<String> points = new ArrayList<String>;
  
  Tegning(String pos){
    points.add(pos);
    
  }
  
  update(){
    for (int i = 0; i < points.size(); i++){
      int nums[] = split(points.get(i), ",");
      int nums2[] = split(points.get(i+1), ",");
      line(nums.[0], nums[1], num2[0], nums2[1])
  
    }
    
    addPos(String pos){
      points.add(pos);
    }
    
    
    
  }
  
  long getOwnerId(){
    return ownerId;
    
  }
  
  
}
