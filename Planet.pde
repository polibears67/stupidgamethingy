public class Planet{
  float x;
  float y;
  float doubleradius;
  float red, green, blue;
  
  float force;
  float xdist;
  float ydist;
  float dist;
  
  
  
  
  public Planet(){
    x = random(-width*universeWidth, width*universeWidth);
    y = random(-height*universeHeight, height*universeHeight);
    //z = random(-300, 300);
    doubleradius = random(100, 400);
    
    red = random(100, 255);
    green = random(100, 255);
    blue = random(100, 255);
    
    println(x);
    println(y);
  }
  
  public void show(){
    fill(red, green, blue);
    if(x<width+doubleradius && x>-width-doubleradius && y<height+doubleradius && y>-height-doubleradius){
      ellipse(x, y, doubleradius, doubleradius);
    }
  }
  
  public void update(){
    //println(dist + " " + radius);
    
    
    x += xVel + xShift;
    y += yVel + yShift;   
    
    // rocket distance relative to planet
    xdist=x-cenx; 
    ydist=y-ceny;
    //println(dist);
    
    if(dist>doubleradius/2+40){ //add gravity
      xVel-=force*xdist;    //because distance is always positive //<>//
      yVel-=force*ydist;
      touchingPlanet=false;

    } 
    else{
      if(touchingPlanet==false){
        xVel=0;
        yVel=0;
      }
      touchingPlanet=true;

    }
    println(touchingPlanet);
    
    if (dist<doubleradius/2+50){
      //xVel*=-1;
      //yVel*=-1;
      
      
      //println("DR= "+ doubleradius/2+50 + "dist= " + dist);
      
      xShift=20;
      /* //<>//
                  if (dist<doubleradius/2+50){
        xVel-=force*xdist;    //because distance is always positive
        yVel-=force*ydist;
      }
      */
      
    }
    
    //println(dist);
    dist= sqrt( (xdist)*(xdist)+(ydist)*(ydist) )   ;
    force=(gravitysmallnum * ( (shipmass)*( PI*pow(doubleradius/2,2) ) ) / pow(dist,2) );
    //println(force*xdist);
    
    
  }
  
  
  
  
  
  
  
  
}
