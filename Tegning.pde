class Tegning {
  boolean isVisible = true;
  long ownerId;

  ArrayList<String> points = new ArrayList<String>();

  Tegning(String pos, long Id) {
    points.add(pos);
    ownerId = Id;
  }

  void update() {
    for (int i = 1; points.size()>2 &&i< points.size(); i++) {
      println("tegningUpdate is run");
      String [] nums = split(points.get(i-1), ",");
      String [] nums2 = split(points.get(i), ",");
      stroke(120);
      println(nums);
      println(nums2);
      
      line(Float.valueOf(nums[0]).floatValue(), Float.valueOf(nums[1]).floatValue(), Float.valueOf(nums2[0]).floatValue(), Float.valueOf(nums2[1]).floatValue());
    }
  }
  void update(String pos){
    points.add(pos);
    
  }

  void addPos(String pos) {
    points.add(pos);
  }

  long getOwnerId() {
    return ownerId;
  }
}

