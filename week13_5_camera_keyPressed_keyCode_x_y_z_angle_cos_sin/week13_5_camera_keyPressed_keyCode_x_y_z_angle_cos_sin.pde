//week13_5_camera_keyPressed-keyCode_x_y_z_angle_cos_sin
PImage img;
void setup(){
  size(400,400,P3D);
  img = loadImage("chessboard.png");
  textureMode(NORMAL);
}
float x=200,y=200,z=200,angle=180;
void keyPressed(){
  if(keyCode==LEFT) angle--;
  if(keyCode==RIGHT) angle++;
  if(keyCode==UP){
    x +=cos(radians(angle));
    z +=sin(radians(angle));
  }
  if(keyCode==DOWN){
    x -=cos(radians(angle));
    z -=sin(radians(angle));
  }
}
void draw(){
  //camera(mouseX,200,mouseY,mouseX,200,mouseY-10,0,1,0);
  if(keyPressed) keyPressed();
  camera(x,y,z, x+cos(radians(angle)),y, z-sin(radians(angle)),0,1,0);
  background(128);
  beginShape();
  texture(img);
  vertex(0,0,0,0,0);
  vertex(400,0,0,1,0);
  vertex(400,400,0,1,1);
  vertex(0,400,0,0,1);
  endShape();
  
  beginShape();
  texture(img);
  vertex(0,0,0,0,0);
  vertex(0,400,0,1,0);
  vertex(0,400,400,1,1);
  vertex(0,0,400,0,1);
  endShape();
}
