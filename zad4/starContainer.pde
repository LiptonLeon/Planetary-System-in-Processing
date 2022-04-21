class StarContainer implements Dynamic {

  float x = width;
  float y = height;
  List<Star> stars;
  
  StarContainer() {
    stars = new ArrayList<Star>();
  }
  
  // Call every frame
  void update(float delta) {
    if (stars.size() < 1200) {
      stars.add(new Star());
      stars.add(new Star());
    }
    for (Star star : stars) {
      star.update(delta);
    }
  }
}
