class Body
{
  NetAddress rmt;
  PVector head = new PVector(0, 0);
  PVector ihead = new PVector(0, 0);
  PVector handr = new PVector(0, 0);
  PVector ihandr = new PVector(0, 0);
  PVector handl = new PVector(0, 0);
  PVector ihandl = new PVector(0, 0);
  PVector elbowr = new PVector(0, 0);
  PVector ielbowr = new PVector(0, 0);
  PVector elbowl = new PVector(0, 0);
  PVector ielbowl = new PVector(0, 0);
  PVector shoulderr = new PVector(0, 0);
  PVector ishoulderr = new PVector(0, 0);
  PVector shoulderl = new PVector(0, 0);
  PVector ishoulderl = new PVector(0, 0);

  HashMap<String, PVector> field = new HashMap<String, PVector>();
  float lerpRate = 0.2;
  float scale = 1;

  Body() {
    field.put("/head", head);
    field.put("/handr", handr);
    field.put("/handl", handl);
    field.put("/elbowr", elbowr);
    field.put("/elbowl", elbowl);
    field.put("/shoulderr", shoulderr);
    field.put("/shoulderl", shoulderl);
  }
  void getJoints(String s, float x, float y) {
    field.get(s).x = x*scale;
    field.get(s).y = -y*scale;
  }
  void updateData() {
    ihead = PVector.lerp(ihead, head, lerpRate);
    ellipse(ihead.x, ihead.y, 10, 10);    
    ihandr = PVector.lerp(ihandr, handr, lerpRate);
    ellipse(ihandr.x, ihandr.y, 10, 10);    
    ihandl = PVector.lerp(ihandl, handl, lerpRate);
    ellipse(ihandl.x, ihandl.y, 10, 10);    
    ielbowr = PVector.lerp(ielbowr, elbowr, lerpRate);
    ellipse(ielbowr.x, ielbowr.y, 10, 10);    
    ielbowl = PVector.lerp(ielbowl, elbowl, lerpRate);
    ellipse(ielbowl.x, ielbowl.y, 10, 10);    
    ishoulderr = PVector.lerp(ishoulderr, shoulderr, lerpRate);
    ellipse(ishoulderr.x, ishoulderr.y, 10, 10);    
    ishoulderl = PVector.lerp(ishoulderl, shoulderl, lerpRate);
    ellipse(ishoulderl.x, ishoulderl.y, 10, 10);

    line(ihandr.x, ihandr.y, ielbowr.x, ielbowr.y);
    line(ihandl.x, ihandl.y, ielbowl.x, ielbowl.y);
    line(ishoulderl.x, ishoulderl.y, ielbowl.x, ielbowl.y);
    line(ishoulderr.x, ishoulderr.y, ielbowr.x, ielbowr.y);
  }
  void sendData(OscP5 osc) {
    OscMessage msg = new OscMessage("/hd");
    msg.add(ihead.x); 
    msg.add(ihead.y);
    osc.send(msg);

    msg = new OscMessage("/hdr");
    msg.add(ihandr.x); 
    msg.add(ihandr.y);
    osc.send(msg);


    msg = new OscMessage("/hdl");
    msg.add(ihandl.x); 
    msg.add(ihandl.y);
    osc.send(msg);

    msg = new OscMessage("/ebr");
    msg.add(ielbowr.x); 
    msg.add(ielbowr.y);
    osc.send(msg);


    msg = new OscMessage("/ebl");
    msg.add(ielbowl.x); 
    msg.add(ielbowl.y);
    osc.send(msg);


    msg = new OscMessage("/sdr");
    msg.add(ishoulderr.x); 
    msg.add(ishoulderr.y);
    osc.send(msg);


    msg = new OscMessage("/sdl");
    msg.add(ishoulderl.x); 
    msg.add(ishoulderl.y);
    osc.send(msg);
  }

  void sendData(OscP5 osc, PVector _hd, PVector _hdr, PVector _hdl, PVector _ebr, PVector _ebl, PVector _sdr, PVector _sdl ) {
    OscMessage msg = new OscMessage("/hd");
    msg.add(_hd.x); 
    msg.add(_hd.y);
    osc.send(msg);

    msg = new OscMessage("/hdr");
    msg.add(_hdr.x); 
    msg.add(_hdr.y);
    osc.send(msg);


    msg = new OscMessage("/hdl");
    msg.add(_hdl.x); 
    msg.add(_hdl.y);
    osc.send(msg);

    msg = new OscMessage("/ebr");
    msg.add(_ebr.x); 
    msg.add(_ebr.y);
    osc.send(msg);


    msg = new OscMessage("/ebl");
    msg.add(_ebl.x); 
    msg.add(_ebl.y);
    osc.send(msg);


    msg = new OscMessage("/sdr");
    msg.add(_sdr.x); 
    msg.add(_sdr.y);
    osc.send(msg);


    msg = new OscMessage("/sdl");
    msg.add(_sdl.x); 
    msg.add(_sdl.y);
    osc.send(msg);
  }
}
