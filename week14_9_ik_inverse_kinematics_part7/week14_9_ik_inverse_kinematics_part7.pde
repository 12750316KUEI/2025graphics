//week14_9_ik_inverse_kinematics_part7
void setup(){
  size(400,400);
  for(int i=0; i<6; i++){
    p[i] = new PVector(200, 350-50*i);
  }
}
PVector [] p = new PVector[6];
void draw(){
  background(255);
  for(int i=0;i<6;i++){
    if(i>0) line(p[i-1].x, p[i-1].y, p[i].x, p[i].y);
    fill(255,0,0);
    ellipse(p[i].x,p[i].y,8,8);
    fill(0);
    text("p:"+i, p[i].x+10, p[i].y);
  }
  PVector now = new PVector(mouseX, mouseY);
  p[5].x=now.x;
  p[5].y=now.y;
  for(int i=4;i>0;i--){
    PVector v = PVector.sub(p[i+1],p[i]).normalize().mult(50);
    p[i].x = p[i+1].x - v.x;
    p[i].y = p[i+1].y - v.y;
  }
  for(int i=1;i<=5;i++){
    PVector v = PVector.sub(p[i],p[i-1]).normalize().mult(50);
    p[i].x = p[i-1].x + v.x;
    p[i].y = p[i-1].y + v.y;
  }
  ellipse(mouseX,mouseY,6,6);
}
