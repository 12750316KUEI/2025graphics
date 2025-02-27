//week02_3_void_setup_void_draw
void setup(){ //一開始設定一次(貼上剛剛week02-2程式)
  size(400,400);
  background(255);
  fill(238);
  noStroke();
  float s=400/14; //每個格子的大小
  for(int i=0;i<14;i++){ //左手i對應y座標
    for(int j=0;j<14;j++){ //右手j對應x座標
      //rect(0,i*s*2,s,s); //先試位置
      if((i+j)%2==0) rect(j*s,i*s,s,s);
    } //下面才是真程式碼.完成畫格子
  }
}
void draw(){ //每秒畫60次)
  stroke(255,0,0); //紅色的線
  if(mousePressed) line(mouseX,mouseY,pmouseX,pmouseY);
}//如果mouse按下去，就畫線，給兩個座標: 現在mouse和之前的mouse
