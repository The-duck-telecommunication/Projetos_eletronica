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
import java.net.URL;
import java.io.*;
import java.net.URLConnection;

void setup ()
{
  size(300, 500);
  colorMode(HSB);

  power.pos(width - 80, 30);
  power.size(50, 20);
  power.cor(#3366ff);
  power.label("On");
  power.teSize(20);
  power.value(1); //true
  power.str_button("button0");

  color1.pos(int(0.05*width), int(height/2));
  color1.size(int(0.9*width/3), 40);
  color1.cor(#ff0000);
  color1.teSize(15);
  color1.label("Vermelho");
  color1.value(0);
  color1.str_button("button3");

  color2.pos(int(color1.xpos + color1.xdel), int(height/2));
  color2.size(int(0.9*width/3), 40);
  color2.cor(#00ff00);
  color2.teSize(15);
  color2.label("Verde");
  color2.value(0);
  color2.str_button("button4");

  color3.pos(int(color2.xpos + color2.xdel), int(height/2));
  color3.size(int(0.9*width/3), 40);
  color3.cor(#0000ff);
  color3.teSize(15);
  color3.label("Azul");
  color3.value(0);
  color3.str_button("button5");
}

void draw ()
{
  background(#efefef);

  power.display();
  color1.display();
  color2.display();
  color3.display();
}

void mousePressed ()
{
  if(power.confere())
  {
    function_power();

    if(power.value == 1)
    {
      power.cor(#003d99);
      power.label("Off");
      power.value(0);
    }
    else if(power.value == 0)
    {
      power.cor(#3366ff);
      power.label("On");
      power.value(1);
    }
  }

  if(color1.confere())
  {
    function_color1();

    if(color1.value == 1)
    {
      color1.cor(#660000);
      color1.value(0);
    }
    else if(color1.value == 0)
    {
      color1.cor(#ff0000);
      color1.value(1);
    }
  }

  if(color2.confere())
  {
    function_color2();

    if(color2.value == 1)
    {
      color2.cor(#006600);
      color2.value(0);
    }
    else if(color2.value == 0)
    {
      color2.cor(#00ff00);
      color2.value(1);
    }
  }

  if(color3.confere())
  {
    function_color3();

    if(color3.value == 1)
    {
      color3.cor(#000066);
      color3.value(0);
    }
    else if(color3.value == 0)
    {
      color3.cor(#0000ff);
      color3.value(1);
    }
  }
}

void mouseMoved()
{
  if(power.confere())
    power.cor(#66ccff);
  else
    if(power.value == 1)
      power.cor(#3366ff);
    else
      power.cor(#003d99);

  if(color1.confere())
    color1.cor(#ff6666);
  else
    if(color1.value == 1)
      color1.cor(#660000);
    else
      color1.cor(#ff0000);

  if(color2.confere())
    color2.cor(#66ff66);
  else
    if(color2.value == 1)
      color2.cor(#006600);
    else
      color2.cor(#00ff00);

  if(color3.confere())
    color3.cor(#6666ff);
  else
    if(color3.value == 1)
      color3.cor(#000066);
    else
      color3.cor(#0000ff);
}
