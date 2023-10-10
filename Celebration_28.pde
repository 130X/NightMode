//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage picBackground;
Boolean nightmode=false;      //Note: clock and turn on automatically
Boolean brightnessControl=false;      //Note: ARROWS
int brightnessNumber=128;       //Range:1-255
//
void setup() {
  //fullScreen(); //displayWidth, displayHeight
  size( 800, 500 ); //Landscape
  // Copy Display Orientation
  appWidth = width;
  appHeight = height;
  //
  //Population
  int hourNightMode = hour(); //24-hour clock
  println(hourNightMode);
  if ( hourNightMode>19 ) {
    nightmode=true;
  } else if ( hourNightMode<06 ) {
    nightmode=true;
  } else {
    nightmode=false;
  }
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  //Concatentation of Pathways
  String up = "..";
  String open = "/"; 
  String imagesPath = up + open + up + open + up + open;
  String landScapeImage = "Images used"; 
  picBackground = loadImage( landScapeImage + open + "cactus gr7.png");
  //
  //DIVs
  //rect( backgroundimageX, backgroundimageY, backgroundImageWidth, backgroundImageHeight );
  //
} //End setup 
//
void draw() {
  //background(255); //built in BUG, 1 pixel
  //rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  //
  //println(brightnessControl, nightmode);
  if ( brightnessControl==true )
  { //Gray Scale: 1/2 tint (i.e 128/256=1/2)
    if ( brightnessNumber<1 ) {
      brightnessNumber=1;
    } else if ( brightnessNumber>255 ) {
      brightnessNumber=255;
    } else {
      //Empty ELSE
    }
    tint (255, brightnessNumber);
    //println(brightnessNumber);
  }
  //if ( nightmode==true ) tint ( 64, 64, 40 ); //Gray Scale: 1/2 tint (i.e 128/256=1/2)
  if ( nightmode==true ) {
    tint ( 64, 64, 40 ); //blue light must be limited, i.e Less than <40
    //println(nightmode);
  } else {
    noTint(); //See Processing DOC
    //println(nightmode);
  }
 image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
 image( orangeForeground ); //orange image, purpose see circles in aspect ratio 
 image(); // acer nitro 50 in portrait , geomety is landscape, thus centered
} //End draw
//
void keyPressed() {
  if ( key=='n' || key=='N') { //Nightmode, basic control is Boolean
    if ( nightmode==true ) {
      nightmode = false;
    } else {
      nightmode = true;
    }
  }
  //Brightness: ARROWS activate brightnessControl, never off
  //NOTE: Nightmode does turn off
  if ( key==CODED && keyCode==UP || keyCode==DOWN ) { //Brightness keybind
    brightnessControl = true;
    //Bultin BUG, use boolean 
    if (key==CODED && keyCode==UP) brightnessNumber++ ; //brightnessNumber+=1  //brightnessNumber = brightnessNumber+1
    if (key==CODED && keyCode==DOWN) brightnessNumber-- ; //brightnessNumber-=1 //brightnessNumber = brightnessNumber-1
    //CONTINUE HERE with brightness toggles
  }
  //
  //println(brightnessNumber);
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
// End MAIN Program
