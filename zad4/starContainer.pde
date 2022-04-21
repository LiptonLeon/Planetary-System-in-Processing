class StarContainer {

  float x = width;
  float y = height;
  List<Star> stars;
  
  StarContainer () {
    stars = new ArrayList<Star>();
  }
  
  void update () {
    if (stars.size() < 600) {
      stars.add(new Star());
    }
    print(stars.size(), "\n");
    for (Star star : stars) {
      star.update();
    }
  }

}
