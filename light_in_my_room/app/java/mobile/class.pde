void function_power ()
{
  openURL(power.str_button);
}

void function_color1 ()
{
  openURL(color1.str_button);
}

void function_color2 ()
{
  openURL(color2.str_button);
}

void function_color3 ()
{
  openURL(color3.str_button);
}

void function_piscar ()
{
  openURL(piscar.str_button);
}

void function_fader ()
{
  openURL(fader.str_button);
}

void function_shutdown ()
{
  openURL(shutdown.str_button);
}

float time_left = 0;
void function_shutdown_display ()
{
  time_left =  time_max - (millis()/1000 - time_start);
  if (time_left > time_max)
  {
    time_left = 0;
    openURL(power.str_button);
  }

  text("left time: " + time_left + "s", shutdown.xpos + shutdown.xdel/2 - 10, shutdown.ypos + shutdown.ydel + 10);
}

void openURL (String _str_button)
{
  try
  {
    URL url = new URL(IP + _str_button);
    URLConnection urlcon=url.openConnection();
    System.out.println("------------------------------------");

    //get the inputstream of the open connection.
    BufferedReader br = new BufferedReader(new InputStreamReader (urlcon.getInputStream()));
    String i;

    while ((i = br.readLine()) != null)
            {
                System.out.println(i);
            }
  }
  catch (Exception e)
  {
    System.out.println(e);
  }
}

void normal_color ()
{
  color1.cor(#ff0000);
  color2.cor(#00ff00);
  color3.cor(#0000ff);
}

void function_selec ()
{
  fill(#a6a6a6);
  noStroke();
  rect(0, 0, 200, height);

  textSize(15);
  fill(#000000);
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

  void pos(int _xpos, int _ypos)
  {
    xpos = _xpos;
    ypos = _ypos;
  }
  void size(int _xdel, int _ydel)
  {
    xdel = _xdel;
    ydel = _ydel;
  }
  void cor(int _cor)
  {
    cor = _cor;
  }
  void label (String _lab)
  {
    lab = _lab;
  }
  void value (float _value)
  {
    value = _value;
  }
  void teSize (int _teSize)
  {
    teSize = _teSize;
  }
  void str_button (String _str_button)
  {
    str_button = _str_button;
  }
  boolean confere()
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

  void display()
  {
    pushMatrix();
      translate(xpos, ypos);

      fill(cor);
      stroke(cor);
      rect(0, 0, xdel, ydel, 20, 20, 20, 20);

      textAlign(CENTER, CENTER);
      textSize(teSize);
      fill(#000000);
      text(lab, xdel/2, ydel/2 - 2);
    popMatrix();
  }
}
