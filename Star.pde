public class Star {
  float x;
  float y;
  float radius;
  float z;
  float red, green, blue;
  float opacity;
  boolean isBright = false;

  
  public Star() {
    x = random(-width*universeWidth, width*universeWidth);
    y = random(-height*universeHeight, height*universeHeight);
    //z = random(-300, 300);
    radius = random(1, 5);
    
    if(int(random(1,100))==1){ // make a few rare bigstars
      radius = random(5, 20);
    }
    
    //translate(0,0,0);

    red = random(100, 255);
    green = random(100, 255);
    blue = random(100, 255);
    opacity = random(0, 255);
  }
  
  public void show() {
    
    //translate(0,0,z);

    
    fill(red, green, blue, opacity);
    if(x<width && x>-width && y<height && y>-height){
      ellipse(x, y, radius, radius);
    }
    

    //translate(0,0,-z);


  }
   
  public void update() {
    
    x += xVel + xShift;
    y += yVel + yShift;   
    
    
    // twinkling
    if(x<width && x>-width && y<height && y>-height){ 
      if (opacity >= 255) {isBright = true;}
      if (opacity <= 100) {isBright = false;}
      
      if (isBright == false) {opacity += random(-1,7);} 
      else {opacity -= random(-1,7);}
    
    }
    
    if(x<-width*universeWidth){ x=width*universeWidth; }
    if(x>width*universeWidth){ x=-width*universeWidth; }
    if(y<-height*universeHeight){ y=height*universeHeight; }
    if(y>height*universeHeight){ y=-height*universeHeight; }
    
  }
}
