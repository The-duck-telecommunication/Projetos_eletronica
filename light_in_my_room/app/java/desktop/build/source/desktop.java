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




public void setup ()
{
  
  colorMode(HSB);

  power.pos(width - 80, 30);
  power.size(50, 20);
  power.cor(0xff3366ff);
  power.label("On");
  power.teSize(20);
  power.value(1); //true
  power.str_button("button0");

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

  power.display();
  color1.display();
  color2.display();
  color3.display();
}

public void mousePressed ()
{
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
      power.cor(0xff3366ff);
      power.label("On");
      power.value(1);
    }
  }

  if(color1.confere())
  {
    function_color1();

    if(color1.value == 1)
    {
      color1.cor(0xff660000);
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
      color2.cor(0xff006600);
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
      color3.cor(0xff000066);
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
  if(power.confere())
    power.cor(0xff66ccff);
  else
    if(power.value == 1)
      power.cor(0xff3366ff);
    else
      power.cor(0xff003d99);

  if(color1.confere())
    color1.cor(0xffff6666);
  else
    if(color1.value == 1)
      color1.cor(0xff660000);
    else
      color1.cor(0xffff0000);

  if(color2.confere())
    color2.cor(0xff66ff66);
  else
    if(color2.value == 1)
      color2.cor(0xff006600);
    else
      color2.cor(0xff00ff00);

  if(color3.confere())
    color3.cor(0xff6666ff);
  else
    if(color3.value == 1)
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

public void openURL (String _str_button)
{
  try
  {
    URL url = new URL("http://192.168.1.25/" + _str_button);
    URLConnection urlcon=url.openConnection();

    //get the inputstream of the open connection.
    BufferedReader br = new BufferedReader(new InputStreamReader (urlcon.getInputStream()));
    String i;
  }
  catch (Exception e)
  {
  }
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
      rect(0, 0, xdel, ydel);

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
