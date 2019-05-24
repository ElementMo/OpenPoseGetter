import java.io.*;
import processing.core.*;

class BodySerialized extends PApplet implements Serializable
{
  PVector hd = new PVector(0, 0);   
  PVector hdr = new PVector(0, 0);
  PVector hdl = new PVector(0, 0);
  PVector ebr = new PVector(0, 0);
  PVector ebl = new PVector(0, 0);
  PVector sdr = new PVector(0, 0);
  PVector sdl = new PVector(0, 0);

  BodySerialized(PVector _hd, PVector _hdr, PVector _hdl, PVector _ebr, PVector _ebl, PVector _sdr, PVector _sdl) {
    this.hd = _hd;
    this.hdr = _hdr;
    this.hdl = _hdl;
    this.ebr = _ebr;
    this.ebl = _ebl; 
    this.sdr = _sdr;
    this.sdl = _sdl;
  }
}
