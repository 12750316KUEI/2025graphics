//week08
ArrayList<Integer> x,y;//先有2個「還沒準備好」的(小的)資料結構，等mousePressed再新增準備
ArrayList<ArrayList<Integer>> xx = new ArrayList<ArrayList<Integer>>();//大的資料結構
ArrayList<ArrayList<Integer>> yy = new ArrayList<ArrayList<Integer>>();
PImage img;
void setup(){
  size(400,400);
  img = loadImage("cute.png");//每次新的檔案，要再把圖「拉進來」
}//記得把圖檔，(像上週一樣)拉到程式碼裡
void draw(){
  background(img);
  fill(255,200);//半透明的色彩 白色，alpha值是128
  rect(0,0,400,400);//畫超大的四邊形，全部蓋住
  //上面是week02-4，下面用迴圈，從資料結構取出來
  for(int I=0;I<xx.size();I++){//大寫I對應大的資料結構
    ArrayList<Integer> x=xx.get(I);//取出裡面小的資料結構
    ArrayList<Integer> y=yy.get(I);
    for(int i=1;i<x.size();i++){//小的，再照舊畫
      line(x.get(i),y.get(i),x.get(i-1),y.get(i-1));
    }
  }
  noFill();
  strokeWeight(3);
  draw1();
  draw2();
}

void keyPressed(){//小心，注音輸入法，會卡住按鍵，要換英文輸入
  if(key=='s'||key=='S'){//如果按下英文小寫or大寫S想save存檔的話
    for(int I=0;I<xx.size();I++){//大寫I對應大的資料結構
      ArrayList<Integer> x=xx.get(I);//取出裡面小的資料結構
      ArrayList<Integer> y=yy.get(I);
      println("beginShape();");
      for(int i=1;i<x.size();i++){//小的，再照舊畫
        println("vertex("+x.get(i)+","+y.get(i)+");)");
      }//改再keyPressed()按下s或S時，再全部印!
      println("endShape();");
    }
  }
}
void mouseDragged(){
  //println("vertex("+mouseX+","+mouseY+");");
  x.add(mouseX);
  y.add(mouseY);
}
void mousePressed(){//滑鼠按下去時，建「新的」資料結構
  x=new ArrayList<Integer>(); xx.add(x);
  y=new ArrayList<Integer>(); yy.add(y);
}
void draw1(){
  beginShape();
  vertex(165,159);
  vertex(164,159);
  vertex(164,158);
  vertex(162,158);
  vertex(160,158);
  vertex(159,158);
  vertex(157,160);
  vertex(156,160);
  vertex(155,160);
  vertex(155,161);
  vertex(153,162);
  vertex(152,162);
  vertex(151,162);
  vertex(150,163);
  vertex(148,163);
  vertex(147,163);
  vertex(145,164);
  vertex(144,165);
  vertex(142,168);
  endShape();

  beginShape();
  vertex(256,150);
  vertex(257,150);
  vertex(259,150);
  vertex(260,150);
  vertex(261,150);
  vertex(263,150);
  vertex(264,150);
  vertex(265,150);
  vertex(266,150);
  vertex(267,150);
  vertex(269,150);
  vertex(269,151);
  vertex(270,151);
  vertex(271,151);
  vertex(273,152);
  vertex(274,153);
  vertex(275,153);
  vertex(276,153);
  vertex(276,154);
  vertex(277,154);
  vertex(279,154);
  vertex(281,155);
  vertex(283,156);
  vertex(284,156);
  vertex(285,156);
  vertex(287,158);
  endShape();
}
