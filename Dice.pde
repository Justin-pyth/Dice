Die die;
int sum = 0;
float[] x = new float[8];
float[] y = new float[7];
float dx = (float)Math.random();
float dy = (float)Math.random();
int random = 0;
void setup(){
  size(500,500);
  for(int i = 0; i < x.length; i++){
    x[i] = i * 60.0 + 15;
  }
  for(int i = 0; i < y.length; i++){
    y[i] = i * 60.0;
  }
  noLoop();
}
void draw(){
  background(0,0,0,0.5);
  for (int j = 0; j < 7; j++){
    for (int i = 0; i < 8; i++){
      die = new Die(x[i]+dx,y[j]+dy);
      die.roll();
      die.show();
      sum +=die.roll;
      if (x[i]>500){
        dx=-dx;
      }
      else if (x[i]<0){
        dx=-dx;
      }
      if (y[j]>500){
        dy=-dy;
      }
      else if (y[j]<0){
        dy=-dy;
      }
    }
  }
  fill(255,255,255);
  textSize(50);
  text(sum,200,475);
}
void mousePressed(){
  redraw();
  sum = 0;
  
}
class Die{
  float myX;
  float myY;
  public int roll;
  
  Die(float x, float y){
    myX = x;
    myY = y;
  }
  void roll(){
    roll = (int)(Math.random()*6+1);
  }
 
  void show(){
    fill(255,255,255);
    rect(myX,myY,50,50,5);
    fill(0,0,0);
    if (roll == 1 || roll == 3 || roll == 5){
      ellipse(myX+25,myY+25,10,10);
        if (roll == 3 || roll == 5){
          ellipse(myX+10,myY+10,10,10);
          ellipse(myX+40,myY+40,10,10);
          if (roll == 5){
            ellipse(myX+40,myY+10,10,10);
            ellipse(myX+10,myY+40,10,10);
          }
        }
    }
    if (roll == 2 || roll == 4 || roll == 6){
      ellipse(myX+15,myY+25,10,10);
      ellipse(myX+35,myY+25,10,10);
      if (roll == 4 || roll == 6){
        ellipse(myX+15,myY+10,10,10);
        ellipse(myX+35,myY+10,10,10);
        if (roll == 6){
          ellipse(myX+15,myY+40,10,10);
          ellipse(myX+35,myY+40,10,10);
        }
      }
    }
  }
}
