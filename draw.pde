void draw()
{
  if (isConfiguring)
  {
    ArrayList<String> names;
    background(78, 93, 75);

    //based on last key pressed lets display
    //  appropriately
    if (key == 'i')
      info = getBluetoothInformation();
    else
    {
      if (key == 'p')
      {
        info = "Paired Devices:\n";
        names = bt.getPairedDeviceNames();
      } else
      {
        info = "Discovered Devices:\n";
        names = bt.getDiscoveredDeviceNames();
      }

      for (int i=0; i < names.size(); i++)
      {
        info += "["+i+"] "+names.get(i).toString() + "\n";
      }
    }
    text(UIText + "\n\n" + info, 5, 90*displayDensity);
  } else
  {
    background(78, 93, 75);
    pushStyle();
    fill(255);
    ellipse(mouseX, mouseY, 20, 20);
    fill(0, 255, 0);
    stroke(0, 255, 0);
    //ellipse(remoteMouse.x, remoteMouse.y, 20, 20);   
    fill(0);
    if(otherSize.size() > 0){
      ellipse(remoteMouse.x/ratio.get(0), remoteMouse.y/ratio.get(1), 20, 20); 
    
      //ratio adjustment
      /*x to width
      if(ratio.get(0)*width > otherSize.get(0)){
        
        ratio.set(0, ratio.get(0) - 0.1);
      }
      else if(ratio.get(0)*width < otherSize.get(0)){
        ratio.set(0, ratio.get(0) + 0.1);
      }
      //y to height
      if(ratio.get(1)*height > otherSize.get(1)){
        ratio.set(1, ratio.get(1) - 0.1);
      }
      else if(ratio.get(1)*height < otherSize.get(1)){
        ratio.set(1, ratio.get(1) + 0.1);
      }*/
    }
    popStyle();
  }

  drawUI();
}
