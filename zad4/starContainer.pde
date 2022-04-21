class StarContainer {

  float x = width;
  float y = height;
  List<Star> stars;
  
  StarContainer () {
    stars = new ArrayList<Star>();
  }
  
  void update () {
    if (stars.size() < 1200) {
      stars.add(new Star());
    }
    for (Star star : stars) {
      star.update();
    }
  }
}
