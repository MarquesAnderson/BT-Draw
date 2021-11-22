
void setup(){   
  
  size(displayWidth, displayHeight);

  orientation(PORTRAIT);

  background(78, 93, 75);
  stroke(255);

  textSize(16*displayDensity);

  //start listening for BT connections
  bt.start();

  UIText =  "d - discover devices\n" +
    "b - make this device discoverable\n" +
    "c - connect to device\n     from discovered list.\n" +
    "p - list paired devices\n" +
    "x - disconnect connected device\n" + 
    "i - Bluetooth info";
  
  wHold = width + 1;
  hHold = height + 1;
  
}

void settings(){
  //fullScreen();
}