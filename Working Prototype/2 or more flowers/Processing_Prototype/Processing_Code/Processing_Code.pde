import processing.serial.*;//connect arduino code
Serial myPort;  // Create object from Serial class
int numFrames = 12;  // The number of frames in the animation
int currentFrame = 0;  // current frame
PImage[] images = new PImage[numFrames]; //array of images for the animation
String[] curr_flowers={"0","0"};  //current flowers values (2 flowers, but more can be added)
String[] prev_flowers={"0","0"}; //previous flowwer value (2 flowers, but more can be added)
int[] posx={50,500}; //x positions of flowers
int[] posy={50,250}; //y positions of flowers
PImage bg; //background

void setup()
{
  //Set up ports
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  //screen size, frame rate and background
  size(1068,600);
  frameRate(40);
  bg = loadImage("2flowers.jpeg");
  background(bg);
  
  //POSSIBLE FUTURE IMPROVEMENT:load the flowers in setup
}
void draw(){
  if ( myPort.available() > 0) {  //if my port is available
     //POSSIBLE FUTURE IMPROVEMENT:readString();
    for(int y=0;y<curr_flowers.length;y++){ //go through current flowers
      print(curr_flowers[y]); //print values for testing
      //check if value has changes and check if the value is 1
     if(!curr_flowers[y].equals(prev_flowers[y])){
       if(curr_flowers[y].equals("1")){
         flower1(); //load flower 1
         drawflower(); //draw flower
       }
       //check if value is 2 (flower 2)
       //else if(curr_flowers[y].equals("2")){
       //  flower2(); //load flower 2
       //  drawflower(); //draw flower
       //}
       //if last frame reached, don't go to next one
       if(currentFrame==11){
         prev_flowers[0]=curr_flowers[0];
         prev_flowers[1]=curr_flowers[1];
         print(prev_flowers[y]);
       }
       
     }else{
       print("no flower pressed");//no flower pressed
     }
   }
}
}
void serialEvent(Serial myPort){//get values from arduino
    String inString = myPort.readStringUntil('\n');
    print(inString);

    if (inString != null) {

      // trim off any whitespace:

      inString = trim(inString);

      // split the string on the commas and convert the resulting substrings into an float array:

      float[] values = float(split(inString, ","));

      println(values);
      
       //check values against threshold and change to corresponding value
        if(values[0]<800){
          curr_flowers[0]="1";
        }
        else{
          curr_flowers[0]="0";
        }
        if(values[1]>950){
          curr_flowers[1]="1";
        }
        else{
          curr_flowers[1]="0";
        }
    
    }

  }
void flower1()//loading flower 1
{
  images[0]  = loadImage("frame_00_delay-0.08s.gif");
  images[1]  = loadImage("frame_03_delay-0.08s.gif"); 
  images[2]  = loadImage("frame_10_delay-0.08s.gif");
  images[3]  = loadImage("frame_17_delay-0.08s.gif"); 
  images[4]  = loadImage("frame_24_delay-0.08s.gif");
  images[5]  = loadImage("frame_31_delay-0.08s.gif"); 
  images[6]  = loadImage("frame_33_delay-0.08s.gif");
  images[7]  = loadImage("frame_38_delay-0.08s.gif"); 
  images[8]  = loadImage("frame_45_delay-0.08s.gif");
  images[9]  = loadImage("frame_56_delay-0.08s.gif"); 
  images[10] = loadImage("frame_57_delay-0.08s.gif");
  images[11] = loadImage("frame_59_delay-0.08s.gif"); 
  
}
//void flower2() //load flower 2
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
void drawflower( ){ //function loops through frames and created animation
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
