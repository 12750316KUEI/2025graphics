//week10_6_postman_many_angle_ID_saveStrings_loadStrings
PImage postman,head,body,uparm1,hand1,uparm2,hand2;
float[]angle = new float[20];
int ID = 0;
void mouseDragged(){
  angle[ID]+=mouseX-pmouseX;
}
void keyPressed(){
  if(key=='1') ID=1;//左手臂
  if(key=='2') ID=2;//左手
  if(key=='3') ID=3;//右手臂
  if(key=='4') ID=4;//右手
  if(key=='5') ID=5;//待
  if(key=='6') ID=6;//待
  if(key=='0') ID=0;//頭
  
  if(key=='s'){
    String now = "";
    for(int i=0;i<20;i++){
      now += angle[i]+" ";
    }
    lines.add(now);
    String[]arr=new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt", arr);
  }
  if(key=='r'){ //replay
    if(R<lines.size()){
      float [] now = float(split(lines.get(R), ' '));
      for(int i=0;i<20;i++)angle[i]=now[i];
      R=(R+1)%lines.size();
    }
  }
}
int R = 0;
ArrayList<String> lines = new ArrayList<String>();

void setup(){
  size(560,560);
  postman=loadImage("postman.png");
  head=loadImage("head.png");
  body=loadImage("body.png");
  uparm1=loadImage("uparm1.png");
  hand1=loadImage("hand1.png");
  uparm2=loadImage("uparm2.png");
  hand2=loadImage("hand2.png");
}
void draw(){
  background(#FFFFF2);
  image(postman,0,0);
  fill(255,0,255,128);
  rect(0,0,560,560);
  pushMatrix();
    translate(185,261);
    rotate(radians(angle[1]));
    translate(-185,-261);
    image(uparm1,0,0);
    pushMatrix();
      translate(116,265);
      rotate(radians(angle[2]));
      translate(-116,-265);
      image(hand1,0,0);
    popMatrix();
  popMatrix();
  
  pushMatrix();
    translate(290,262);
    rotate(radians(angle[3]));
    translate(-290,-262);
    image(uparm2,0,0);
    pushMatrix();
      translate(357,259);
      rotate(radians(angle[4]));
      translate(-357,-259);
      image(hand2,0,0);
    popMatrix();
  popMatrix();
  
  
  pushMatrix();
    translate(232,200);
    rotate(radians(angle[0]));
    translate(-232,-200);
    image(head,0,0);
  popMatrix();
  image(body,0,0);
}
