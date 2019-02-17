
ArrayList <circle> circles;
PImage image;
void setup(){
  size(1440,1440);

  image= loadImage("t3.jpg");
  image.loadPixels();
  circles=new ArrayList<circle>();
  
}

void draw(){
  background(0);
  //frameRate(30);
  int total=3000;
  int count=0;
  int attempts=0;
  while(count<total){
    circle Cnew=newCircle();
    if(Cnew!=null){
          circles.add (Cnew); 
    }
    count++;
    attempts++;
    if(attempts>3000){
      noLoop();
      println("finished");
       break; 
    }
  }
 
  for(circle c:circles){
    if(c.growing){
      if(c.edges()){
        c.growing=false;
      }else{
       for(circle other:circles){
         if(c!=other){
           float d=dist(c.x,c.y, other.x,other.y);
           if(d-2<c.r+other.r){
            c.growing=false;
            break;
           }
         }
       }  
    }
  }
  c.show();
  c.grow();
  }
}

circle newCircle(){
  float x=random(width);
  float y=random(height);
  color col;
  int index=int(x)+int(y)*width;
  col=image.pixels[index];
  boolean flag=true;
  
  for(circle c:circles){
    float d= dist(x,y,c.x,c.y);
    if(d<c.r){
     flag=false;
     break;
    }
  }
  if(flag){
    return new circle(x,y,col);
  }else{
   return null; 
  }
}