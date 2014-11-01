class Tegning {
  boolean isVisible = true;
  long ownerId;

  ArrayList<String> points = new ArrayList<String>();

  Tegning(String pos, long Id) {
    points.add(pos);
    ownerId = Id;
  }

  void update() {
    for (int i = 0; i < points.size(); i++) {
      String [] nums = split(points.get(i), ",");
      String [] nums2 = split(points.get(i+1), ",");
      line(Float.valueOf(nums[0]).floatValue(), Float.valueOf(nums[1]).floatValue(), Float.valueOf(nums2[0]).floatValue(), Float.valueOf(nums2[1]).floatValue());
    }
  }

  void addPos(String pos) {
    points.add(pos);
  }

  long getOwnerId() {
    return ownerId;
  }
}

