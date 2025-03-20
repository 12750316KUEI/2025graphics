//week05_5_rotate_radians_frameCount_translate_mouseX_mouseY
void setup() {
  size(400, 400);
}
void draw() {
  background(204);
  rotate(radians(frameCount)*10);
  translate(mouseX,mouseY);
  rect(-50,-5,100,10);
}
