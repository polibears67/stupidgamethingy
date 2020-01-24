class Gates {
  float x;
  float y;
  
  float red, green, blue;
  public Gates(){
    x = width * random ( -2,4);
    y = height * random (-2,2);
    //z = random(-300, 300);
    
    red = 255;
    green = 255;
    blue = 255;
  }
  
  public void show(){
    fill(255);
    if(true){
      //ellipse(x, y, doubleradius, doubleradius);
      rect(x + cenx,y + ceny, 50,50,25);
    }
  }
  
  public void update(){
    x += xVel + xShift;
    y += yVel + yShift;   
    //dist= sqrt( (xdist)*(xdist)+(ydist)*(ydist) )   ;

  }
  
  public boolean inGate(){
    if (x < 50 && -50 < x && y < 50 && -50 < y) {
      println("you won");
      return false;
    } else { return true;}
  }
}
