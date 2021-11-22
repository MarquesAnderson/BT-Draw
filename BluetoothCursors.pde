
//********************************************************************
// The following code is required to enable bluetooth at startup.
//********************************************************************
void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  bt = new KetaiBluetooth(this);
  println("Creating KetaiBluetooth");
}

void onActivityResult(int requestCode, int resultCode, Intent data) {
  bt.onActivityResult(requestCode, resultCode, data);
}

//********************************************************************


//Call back method to manage data received
void onBluetoothDataEvent(String who, byte[] data)
{
  if (isConfiguring)
    return;

  //KetaiOSCMessage is the same as OscMessage
  //   but allows construction by byte array
  KetaiOSCMessage m = new KetaiOSCMessage(data);
  if (m.isValid())
  {
    if (m.checkAddrPattern("/remoteMouse/"))
    {
      if (m.checkTypetag("ii"))
      {
        
        remoteMouse.x = m.get(0).intValue();
        remoteMouse.y = m.get(1).intValue();
        
      }
    }
    
    else if(m.checkAddrPattern("/size/")){
      
      if(m.checkTypetag("ii")){
        
        if(otherSize.size() == 0){
          
          otherSize.add(m.get(0).intValue());
          otherSize.add(m.get(1).intValue());
          ratio.add(1.0*otherSize.get(0)/width);
          ratio.add(1.0*otherSize.get(1)/height);
          
        }
        
        else{
          
          otherSize.set(0, m.get(0).intValue());
          otherSize.set(1, m.get(1).intValue());
          ratio.set(0, 1.0*otherSize.get(0)/width);
          ratio.set(1, 1.0*otherSize.get(1)/height);
          
        }
        
        println(otherSize);
        println(ratio);
        
      }
    }
  }
}

String getBluetoothInformation()
{
  String btInfo = "Server Running: ";
  btInfo += bt.isStarted() + "\n";
  btInfo += "Discovering: " + bt.isDiscovering() + "\n";
  btInfo += "Device Discoverable: "+bt.isDiscoverable() + "\n";
  btInfo += "\nConnected Devices: \n";

  ArrayList<String> devices = bt.getConnectedDeviceNames();
  for (String device : devices)
  {
    btInfo+= device+"\n";
  }

  return btInfo;
}