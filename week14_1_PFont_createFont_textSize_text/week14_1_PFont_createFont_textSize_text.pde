//week14_1_PFont_createFont_textSize_text
size(300,300);
textSize(50);
text("Hello",10,50);
PFont font = createFont("Time New Roman",50);
textFont(font);
text("Hello",10,100);
//print(PFont.list());
for(String name : PFont.list()) println(name); //Java
