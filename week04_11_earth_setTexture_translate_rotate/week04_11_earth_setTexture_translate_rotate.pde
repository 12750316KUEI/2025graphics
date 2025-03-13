//week04_11_earth_setTexture_translate_rotate
//google:earth map texture 下載一張地球的地圖earth.jpg
//把圖檔拉到程式裏面
PShape earth;
void setup() {
  size(400, 400, P3D);
  earth = createShape(SPHERE, 100);
  PImage img = loadImage("earth.jpg");
  earth.setTexture(img);
}
void draw() {
  background(0);
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  shape(earth);
}
