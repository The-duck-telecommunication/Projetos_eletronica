import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.net.URL; 
import java.io.*; 
import java.net.URLConnection; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class desktop extends PApplet {

Button selec = new Button();
Button power = new Button();

//funcoes basicas
Button piscar = new Button();
Button fader = new Button();
Button shutdown = new Button();

//cores basicas
Button color1 = new Button(); //red
Button color2 = new Button(); //green
Button color3 = new Button(); //blue

//outras cores
Button color4 = new Button(); //

//bibliotecas




String IP = "http://192.168.1.25/";
float time_start = 0, time_max = 3600;

public void setup ()
{
  
  colorMode(HSB);

  selec.pos(0, 0);
  selec.size(50, 50);
  selec.label("Mode");
  selec.teSize(12);
  selec.cor(0xffffffb3);
  selec.value(0); //true

  power.pos(width - 80, 30);
  power.size(50, 20);
  power.cor(0xff3366ff);
  power.label("On");
  power.teSize(20);
  power.value(1); //true
  power.str_button("button0");

  piscar.pos(PApplet.parseInt(0.05f*width), PApplet.parseInt(100));
  piscar.size(PApplet.parseInt(0.9f*width/3), 40);
  piscar.cor(0xff3366ff);
  piscar.teSize(15);
  piscar.label("Piscar");
  piscar.value(0);
  piscar.str_button("button1");

  fader.pos(PApplet.parseInt(piscar.xpos + piscar.xdel), PApplet.parseInt(100));
  fader.size(PApplet.parseInt(0.9f*width/3), 40);
  fader.cor(0xff3366ff);
  fader.teSize(15);
  fader.label("Fader");
  fader.value(0);
  fader.str_button("button2");

  shutdown.pos(PApplet.parseInt(fader.xpos + fader.xdel), PApplet.parseInt(100));
  shutdown.size(PApplet.parseInt(0.9f*width/3), 40);
  shutdown.cor(0xff3366ff);
  shutdown.teSize(15);
  shutdown.label("Shutdown");
  shutdown.value(0);
  shutdown.str_button("buttonN14");

  color1.pos(PApplet.parseInt(0.05f*width), PApplet.parseInt(height/2));
  color1.size(PApplet.parseInt(0.9f*width/3), 40);
  color1.cor(0xffff0000);
  color1.teSize(15);
  color1.label("Vermelho");
  color1.value(0);
  color1.str_button("button3");

  color2.pos(PApplet.parseInt(color1.xpos + color1.xdel), PApplet.parseInt(height/2));
  color2.size(PApplet.parseInt(0.9f*width/3), 40);
  color2.cor(0xff00ff00);
  color2.teSize(15);
  color2.label("Verde");
  color2.value(0);
  color2.str_button("button4");

  color3.pos(PApplet.parseInt(color2.xpos + color2.xdel), PApplet.parseInt(height/2));
  color3.size(PApplet.parseInt(0.9f*width/3), 40);
  color3.cor(0xff0000ff);
  color3.teSize(15);
  color3.label("Azul");
  color3.value(0);
  color3.str_button("button5");
}

public void draw ()
{
  background(0xffefefef);

  selec.display();
  if(selec.value == 1)
    function_selec();
  else
  {
    textSize(22);
    fill(0xff000000);
    text("Led Bedroon", width/2 - 15, 35);

    piscar.display();
    fader.display();
    shutdown.display();
    if(shutdown.value == 1)
      function_shutdown_display();

    color1.display();
    color2.display();
    color3.display();
  }
  power.display();
}

public void mousePressed ()
{
  if(selec.confere())
    selec.value(1);
  else
    selec.value(0);

  if(power.confere())
  {
    function_power();

    if(power.value == 1)
    {
      power.cor(0xff003d99);
      power.label("Off");
      power.value(0);
    }
    else if(power.value == 0)
    {
      //power.cor(#3366ff);
      //power.label("On");
      power.value(1);
    }
  }

  if(piscar.confere())
  {
    function_piscar();

    if(piscar.value == 1)
    {
      //piscar.cor(#003d99);
      piscar.value(0);
    }
    else if(piscar.value == 0)
    {
      //power.cor(#3366ff);
      piscar.value(1);
    }
  }

  if(fader.confere())
  {
    function_fader();

    if(fader.value == 1)
    {
      //fader.cor(#003d99);
      fader.value(0);
    }
    else if(fader.value == 0)
    {
      //fader.cor(#3366ff);
      fader.value(1);
    }
  }

  if(shutdown.confere())
  {
    function_shutdown();

    if(shutdown.value == 1)
    {
      //shutdown.cor(#003d99);
      shutdown.value(0);
    }
    else if(shutdown.value == 0)
    {
      //shutdown.cor(#3366ff);
      shutdown.value(1);
      time_start = millis()/1000;
    }
  }

  if(color1.confere())
  {
    function_color1();

    if(color1.value == 1)
    {
      //color1.cor(#660000);
      color1.value(0);
    }
    else if(color1.value == 0)
    {
      color1.cor(0xffff0000);
      color1.value(1);
    }
  }

  if(color2.confere())
  {
    function_color2();

    if(color2.value == 1)
    {
      //color2.cor(#006600);
      color2.value(0);
    }
    else if(color2.value == 0)
    {
      color2.cor(0xff00ff00);
      color2.value(1);
    }
  }

  if(color3.confere())
  {
    function_color3();

    if(color3.value == 1)
    {
      //color3.cor(#000066);
      color3.value(0);
    }
    else if(color3.value == 0)
    {
      color3.cor(0xff0000ff);
      color3.value(1);
    }
  }
}

public void mouseMoved()
{
  if(selec.confere())
    selec.cor(0xffffffcc);
  else
    selec.cor(0xffffffb3);

  if(power.confere())
    power.cor(0xff66ccff);
  else
    if(power.value == 1)
      power.cor(0xff3366ff);
    else
      power.cor(0xff003d99);

  if(piscar.confere())
    piscar.cor(0xff66ccff);
  else
    if(piscar.value == 1)
      piscar.cor(0xff3366ff);
    else
      piscar.cor(0xff3366ff);

  if(fader.confere())
    fader.cor(0xff66ccff);
  else
    if(fader.value == 1)
      fader.cor(0xff3366ff);
    else
      fader.cor(0xff3366ff);

  if(shutdown.confere())
    shutdown.cor(0xff66ccff);
  else
    if(shutdown.value == 1)
      shutdown.cor(0xff3366ff);
    else
      shutdown.cor(0xff3366ff);

  if(color1.confere())
    color1.cor(0xffff6666);
  else
    if(color1.value == 2) //1
      color1.cor(0xff660000);
    else
      color1.cor(0xffff0000);

  if(color2.confere())
    color2.cor(0xff66ff66);
  else
    if(color2.value == 2) //1
      color2.cor(0xff006600);
    else
      color2.cor(0xff00ff00);

  if(color3.confere())
    color3.cor(0xff6666ff);
  else
    if(color3.value == 2) //1
      color3.cor(0xff000066);
    else
      color3.cor(0xff0000ff);
}
public void function_power ()
{
  openURL(power.str_button);
}

public void function_color1 ()
{
  openURL(color1.str_button);
}

public void function_color2 ()
{
  openURL(color2.str_button);
}

public void function_color3 ()
{
  openURL(color3.str_button);
}

public void function_piscar ()
{
  openURL(piscar.str_button);
}

public void function_fader ()
{
  openURL(fader.str_button);
}

public void function_shutdown ()
{
  openURL(shutdown.str_button);
}

float time_left = 0;
public void function_shutdown_display ()
{
  time_left =  time_max - (millis()/1000 - time_start);
  if (time_left > time_max)
  {
    time_left = 0;
    openURL(power.str_button);
  }

  text("left time: " + time_left + "s", shutdown.xpos + shutdown.xdel/2 - 10, shutdown.ypos + shutdown.ydel + 10);
}

public void openURL (String _str_button)
{
  try
  {
    URL url = new URL(IP + _str_button);
    URLConnection urlcon=url.openConnection();

    //get the inputstream of the open connection.
    BufferedReader br = new BufferedReader(new InputStreamReader (urlcon.getInputStream()));
    String i;
  }
  catch (Exception e)
  {
  }
}

public void normal_color ()
{
  color1.cor(0xffff0000);
  color2.cor(0xff00ff00);
  color3.cor(0xff0000ff);
}

public void function_selec ()
{
  fill(0xffa6a6a6);
  noStroke();
  rect(0, 0, 200, height);

  textSize(15);
  fill(0xff000000);
  text("IP: " + IP, 100, 20);
}

class Button
{
  int xpos, ypos, xdel , ydel, cor, teSize = 1;
  float value;
  String lab = "", str_button = "";

  Button ()
  {
    //nothing
  }

  public void pos(int _xpos, int _ypos)
  {
    xpos = _xpos;
    ypos = _ypos;
  }
  public void size(int _xdel, int _ydel)
  {
    xdel = _xdel;
    ydel = _ydel;
  }
  public void cor(int _cor)
  {
    cor = _cor;
  }
  public void label (String _lab)
  {
    lab = _lab;
  }
  public void value (float _value)
  {
    value = _value;
  }
  public void teSize (int _teSize)
  {
    teSize = _teSize;
  }
  public void str_button (String _str_button)
  {
    str_button = _str_button;
  }
  public boolean confere()
  {
    if((mouseX <= xpos + xdel) && (mouseX >= xpos))
    {
      if((mouseY <= ypos + ydel) && (mouseY >= ypos))
        return true;
      else
        return false;
    }
    else
      return false;
  }

  public void display()
  {
    pushMatrix();
      translate(xpos, ypos);

      fill(cor);
      stroke(cor);
      rect(0, 0, xdel, ydel, 20, 20, 20, 20);

      textAlign(CENTER, CENTER);
      textSize(teSize);
      fill(0xff000000);
      text(lab, xdel/2, ydel/2 - 2);
    popMatrix();
  }
}
  public void settings() {  size(300, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "desktop" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
