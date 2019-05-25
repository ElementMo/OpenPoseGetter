import oscP5.*;
import netP5.*;
import java.io.*;

int val, dataIndex;
OscP5 oscP5, multi, multi1, unity;
Body body;
ArrayList<BodySerialized> data = new ArrayList<BodySerialized>();
ArrayList<BodySerialized> restored = new ArrayList<BodySerialized>();
boolean isPlayBack = false, isRecording = false;

void settings() {
  size(300, 300);
}
void setup() {
  strokeWeight(5);
  stroke(255);
  oscP5 = new OscP5(this, 9000);
  multi = new OscP5(this, "238.0.0.1", 8000);
  multi1 = new OscP5(this, "238.0.0.1", 8001);
  //unity = new OscP5(this, "127.0.0.1", 8003);
  body = new Body();
}
void draw() {
  background(0);
  text(val, 30, 30);
  //camera(0, 0, 200, 0, 0, 0, 0, 1, 0);
  translate(width/2, height/2);


  //body.updateData();


  if (isRecording && !isPlayBack) {
    data.add(new BodySerialized(body.ihead, body.ihandr, body.ihandl, body.ielbowr, body.ielbowl, body.ishoulderr, body.ishoulderl));
  }
  if (isPlayBack) {
    if (dataIndex >= restored.size()-2) {
      dataIndex = 0;
    }
    if (dataIndex < restored.size()-1) {
      PVector hd = restored.get(dataIndex).hd;
      PVector hdr = restored.get(dataIndex).hdr;
      PVector hdl = restored.get(dataIndex).hdl;
      PVector ebr = restored.get(dataIndex).ebr;
      PVector ebl = restored.get(dataIndex).ebl;
      PVector sdr = restored.get(dataIndex).sdr;
      PVector sdl = restored.get(dataIndex).sdl;

      line(hdr.x, hdr.y, ebr.x, ebr.y);
      line(hdl.x, hdl.y, ebl.x, ebl.y);
      line(sdr.x, sdr.y, ebr.x, ebr.y);
      line(sdl.x, sdl.y, ebl.x, ebl.y);
      //body.sendData(unity, hd, hdr, hdl, ebr, ebl, sdr, sdl);
      body.sendData(multi, hd, hdr, hdl, ebr, ebl, sdr, sdl);
      body.sendData(multi1, hd, hdr, hdl, ebr, ebl, sdr, sdl);
    }
    dataIndex++;
  }
  //body.sendData(multi);
}

void oscEvent(OscMessage msg) {
  val ++;
  if (msg.checkAddrPattern(msg.addrPattern())) {
    body.getJoints(msg.addrPattern(), msg.get(0).floatValue(), msg.get(1).floatValue());
  }
}





void keyPressed() {
  if (key == 'p') {
    println("Read and Playbcak");
    isPlayBack = true;
    isRecording = false;
    restored = readObject();
  }
  if (key == 's') {
    println("Store");      
    isRecording = false;
    writeObject(data);
    data.clear();
  }
  if (key == 'r') {
    println("Recoring");
    isRecording = true;
  }
}
void writeObject(ArrayList<BodySerialized> kinectData) {
  try {
    FileOutputStream fos = new FileOutputStream(sketchPath() + "/" + "bodyData.dat");
    ObjectOutputStream oos = new ObjectOutputStream(fos);
    oos.writeObject(kinectData);
    oos.close();
  }
  catch(Exception e) {
  }
}

ArrayList<BodySerialized> readObject() {
  try {
    FileInputStream fis = new FileInputStream(sketchPath() + "/" + "bodyData.dat");
    ObjectInputStream ois = new ObjectInputStream(fis);
    ArrayList<BodySerialized> _foo = (ArrayList<BodySerialized>)ois.readObject();
    ois.close();
    return _foo;
  } 
  catch (FileNotFoundException e) {
    e.printStackTrace();
  } 
  catch (IOException e) {
    e.printStackTrace();
  } 
  catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
  return null;
}
