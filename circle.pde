class circle{
  float x;
  float y;
  float r;
  color c;
  boolean growing=true;
  
  circle(float x_,float y_, color c_){
   x=x_;
   y=y_;
   c=c_;
   r=1;
  }
  void grow(){
    if(growing){
      r=r+0.5;
    } 
  }
  
 Boolean edges(){
   return (x+r>width || x-r<0 || y+r>height || y-r<0);
 }
  void show(){
    float red=random(0,255);
    float green=random(0,255);
    float blue=random(0,255);
   // stroke(red,green,blue);
   // stroke(255);
    strokeWeight(2);
    noStroke();
   // noFill();
  // fill(green,red,blue);
  fill(c);
   ellipse(x,y,r*2,r*2); 
  }
  
}