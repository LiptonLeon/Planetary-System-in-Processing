// Why do I have to make it myself???
static class Input {
  static boolean mouseup = false;
  static boolean mousedown = false;

  static void update() {
    Input.mouseup = false;
    Input.mousedown = false;
  }
}

// Why you must be so useless???
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e > 0)
    Input.mouseup = true;

  if (e < 0)
    Input.mousedown = true;
}
