//week06_7_push_RRT_box_many_TRT_inside_pop
void setup(){
  size(500,800,P3D);
}
void draw(){
  background(255);
  translate(width/2,height/2);
  sphere(10);
  
  fill(252,131,77);
  pushMatrix();
    if(mousePressed&&mouseButton==RIGHT) rotateY(radians(frameCount));
    if(mousePressed&&mouseButton==RIGHT) rotateZ(radians(frameCount));
    translate(0,-100);
    box(50,200,25);
    pushMatrix();
      translate(0,-100);
      //if(mousePressed) 
      rotateZ(radians(frameCount));
      translate(100,0);
      box(200,50,25);
      
      pushMatrix();
        translate(100,0);
        rotateZ(radians(frameCount));
        translate(25,0,0);
        box(50,25,50);
      popMatrix();
    popMatrix();
  popMatrix();
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
  println("x:"+x+"y:"+y);
}
