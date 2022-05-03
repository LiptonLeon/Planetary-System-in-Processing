class Lantern extends Node {

  Lantern() {

  }

  void update(float delta) {
    translate(0, 20, 10);
    PShape lantern = createShape(BOX, 24);
    shape(lantern);
  }

}
