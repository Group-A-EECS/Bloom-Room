import processing.serial.*;
Serial myPort;  // Create object from Serial class
int numFrames = 12;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
String[] curr_flowers={"0"};
String[] prev_flowers={"0"};
int[] posx={534};
int[] posy={300};
PImage bg;
void setup()
{
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  size(1068,600);
  frameRate(40);
  bg = loadImage("centerflower.jpeg");
  background(bg);
  
  //load the flowers in setup
}
void draw(){
  if ( myPort.available() > 0) {  
    //readString();
    for(int y=0;y<curr_flowers.length;y++){
      print(curr_flowers[y]);
     if(!curr_flowers[y].equals(prev_flowers[y])){
       if(curr_flowers[y].equals("1")){
         flower1();
         drawflower();
       }
       //else if(curr_flowers[y].equals("2")){
       //  flower2();
       //  drawflower();
       //}
       if(currentFrame==11){
         prev_flowers[0]=curr_flowers[0];
         prev_flowers[1]=curr_flowers[1];
         //print("dogs");
         print(prev_flowers[y]);
       }
       
     }else{
       print("no flower pressed");
     }
   }
}
}
void serialEvent(Serial myPort){
    String inString = myPort.readStringUntil('\n');
    print(inString);

    if (inString != null) {

      // trim off any whitespace:

      inString = trim(inString);

      // split the string on the commas and convert the resulting substrings into an float array:

      float values = float(inString);

      // if the array has at least three elements, you know you got the whole

      // thing.  Put the numbers in the color variables:
      
      println(values);
      
       
      
        if(values<800){
          curr_flowers[0]="1";
        }
        else{
          curr_flowers[0]="0";
        }
    
    }

  }
void flower1()
{
  images[0]  = loadImage("frame_00_delay-0.1s.gif");
  images[1]  = loadImage("frame_01_delay-0.1s.gif"); 
  images[2]  = loadImage("frame_02_delay-0.1s.gif");
  images[3]  = loadImage("frame_03_delay-0.1s.gif"); 
  images[4]  = loadImage("frame_04_delay-0.1s.gif");
  images[5]  = loadImage("frame_05_delay-0.1s.gif"); 
  images[6]  = loadImage("frame_06_delay-0.1s.gif");
  images[7]  = loadImage("frame_07_delay-0.1s.gif"); 
  images[8]  = loadImage("frame_08_delay-0.1s.gif");
  images[9]  = loadImage("frame_09_delay-0.1s.gif"); 
  images[10] = loadImage("frame_09_delay-0.1s.gif");
  images[11] = loadImage("frame_09_delay-0.1s.gif"); 
  
}
//void flower2()
//{
//  images[0]  = loadImage("frame_01_delay-1s.gif");
//  images[1]  = loadImage("frame_02_delay-1s.gif"); 
//  images[2]  = loadImage("frame_03_delay-1s.gif");
//  images[3]  = loadImage("frame_04_delay-1s.gif"); 
//  images[4]  = loadImage("frame_05_delay-1s.gif");
//  images[5]  = loadImage("frame_06_delay-1s.gif"); 
//  images[6]  = loadImage("frame_07_delay-1s.gif");
//  images[7]  = loadImage("frame_08_delay-1s.gif"); 
//  images[8]  = loadImage("frame_09_delay-1s.gif");
//  images[9]  = loadImage("frame_10_delay-1s.gif"); 
//  images[10] = loadImage("frame_11_delay-1s.gif");
//  images[11] = loadImage("frame_12_delay-1s.gif"); 
  
//}
void drawflower( ){
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  for (int x = -100; x < width; x += images[0].width) { 
       background(bg);
       for(int i=0;i<curr_flowers.length;i++){
         if (curr_flowers[i].equals("1")){
                image(images[(currentFrame)],posx[i], posy[i]);
              }
            }
          }
}
