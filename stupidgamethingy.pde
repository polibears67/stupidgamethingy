public float xCoor = 0;
public float yCoor = 0;
public float universeWidth=5;
public float universeHeight=5;
public boolean[] keys;
public boolean loose = false;

float norm = 0.05;
float dirangle=90;
float speedmult=.1;
float turnspeed=0;
public float gravitysmallnum=0.000001;

public float xVel = 0;
public float yVel = 0;
public float xShift = 0;
public float yShift = 0;

public boolean touchingPlanet=true;
public int closestPlanet;

public float shipsize=10;
public int shipmass=200;

public float cenx;
public float ceny;


int totalStars = int(random(pow(universeWidth,2)*1200, pow(universeHeight,2)*1200));
Star[] stars = new Star[totalStars];
int totalPlanets = int(random(5, 20));
Planet[] planets = new Planet[totalPlanets];
Gates gate = new Gates();

public void setup() {
  frameRate(60);
  size(1200,800);   //size of the window
  background(0);  //creates a black background
  stroke(255);
  strokeWeight(0);

  
  
  
  keys=new boolean[4];
  cenx=width/2;
  ceny=height/2;
  
  
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for(int i = 0; i < planets.length; i++) {
    planets[i] = new Planet();
    //println("hey");
  }
  
  
  
  
  //println(planets[0].x);
  //println(planets[1].x);

  //planets[0].doubleradius=800;
}




void draw(){
  
  if (!gate.inGate()) {
    background(0);
    fill(255);
    textSize(32);
    text("You Won",width/2,width/2);
    
  } else if(loose){
    background(0);
    fill(255);
    textSize(32);
    text("You Lost",width/2,width/2);
  } else {
 
  /*
  if (playerInEnd()){
    drawEnd();
  }
  */
  //animation thingy
  fill(0,0,0,255);
  rect(0, 0, width, height);
  xShift=0;
  yShift=0;
  
  /////////-/////////-/////////-/////////-/////////-/////////-/////////-/////////-
  //println(screenx);
  //println(screeny);
  
  //update screen coords
  xCoor-=xVel+xShift;
  yCoor+=yVel+yShift;
  //println(xCoor + "  " + yCoor);


  // weird keypresses
  if(keys[2]==true){
    turnspeed -= 0.1;
    if(touchingPlanet){
      dirangle-=5;
    }
  }
  if(keys[3]==true){
    turnspeed +=0.1;
    if(touchingPlanet){
      dirangle+=5;
    }
  }
  if(touchingPlanet==false){
    dirangle += turnspeed;
  }
  
  
  
  /////////-/////////-/////////-/////////-/////////-/////////-/////////-/////////- stars
  
  // dirangle of ship calculated so that you go the direction you are pointing
  if(keys[0]==true){
      xVel += ( ceil( cos(radians(dirangle))*100 )/100f) * speedmult;
      yVel += ( ceil( sin(radians(dirangle))*100 )/100f) * speedmult;
    }
  if(keys[1]==true){
    xVel -= ( ceil( cos(radians(dirangle))*100 )/100f) * speedmult;
    yVel -= ( ceil( sin(radians(dirangle))*100 )/100f) * speedmult;
  }
  
  for(int i = 0; i < stars.length; i++) {
    /*
    if (keyPressed) {
      if (keyCode == LEFT) {
        //stars[i].xVel += norm;
      }
      if (keyCode == RIGHT) {
        //stars[i].xVel -= norm;
      }
      if (keyCode == DOWN) {
        stars[i].xVel -= ( ceil( cos(radians(dirangle))*100 )/100f) * speedmult;
        stars[i].yVel -= ( ceil( sin(radians(dirangle))*100 )/100f) * speedmult;
      }
      if (keyCode == UP) {
        stars[i].xVel += ( ceil( cos(radians(dirangle))*100 )/100f) * speedmult;
        stars[i].yVel += ( ceil( sin(radians(dirangle))*100 )/100f) * speedmult;
        //println( sin(dirangle) );
      }   
    }
    */
    //println(dirangle);
    //println( sin(radians(dirangle)) );
    //println( cos(radians(dirangle)) );
    //stars[i].xVel = 0;
    //stars[i].yVel = 0;
    
    
    stars[i].show();
    stars[i].update();


  } // end of for star loop
  
  
  /////////-/////////-/////////-/////////-/////////-/////////-/////////-/////////- \
  
  for(int i = 0; i < planets.length; i++) {
    planets[i].update();
    planets[i].show();
    //println("ddd");
    
  }
    
  closestPlanet=0;
  for(int i=0; i>totalPlanets-1; i++){
    if (planets[i+1].dist>planets[i].dist){
      closestPlanet=i+1;
    }
  
  }
  
  //println("CP "+ closestPlanet);
  
  
  if(touchingPlanet){
    //dirangle=planets[closestPlanet].plaangle+=180;
  }
  //println(planets[closestPlanet].plaangle+=180);
  
  
  

  //draw center thingy - generates left-facing but rotates 90deg at start
  push();
  rectMode(CENTER);
  
  
  
  translate(width/2,height/2);
  rotate(radians(dirangle));
  
  if(keys[0]==true){  //flames
    fill(200,50,0);
    ellipse(40,0,20,20);
    fill(200,125,0);
    ellipse(49,0,15,15);
    fill(200,200,0);
    ellipse(57,0,10,10);
  }
  
  //ship?
  fill(255);
  rect(5,0,50,40);
  ellipse(-20,0,40,40);
  fill(100,200,255);
  ellipse(-17,0,15,15);
  ellipse(9,0,15,15);
  
  


  translate(-width/2,-height/2);
  rotate(radians(-dirangle));
  
  
  pop(); // keeps stars straight
  
  /////////-/////////-/////////-/////////-/////////-/////////-/////////-/////////- 





  gate.update();
  gate.show();
  }
}


void keyPressed()
{
  if(keyCode==UP)
    keys[0]=true;
  if(keyCode==DOWN)
    keys[1]=true;
  if(keyCode==LEFT)
    keys[2]=true;
  if(keyCode==RIGHT)
    keys[3]=true;
}

void keyReleased()
{
  if(keyCode==UP)
    keys[0]=false;
  if(keyCode==DOWN)
    keys[1]=false;
  if(keyCode==LEFT)
    keys[2]=false;
    
  if(keyCode==RIGHT)
    keys[3]=false;
} 
