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

void openURL (String _str_button)
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
      rect(0, 0, xdel, ydel);

      textAlign(CENTER, CENTER);
      textSize(teSize);
      fill(#000000);
      text(lab, xdel/2, ydel/2 - 2);
    popMatrix();
  }
}
