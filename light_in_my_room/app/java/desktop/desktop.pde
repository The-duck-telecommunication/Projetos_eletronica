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
import java.net.URL;
import java.io.*;
import java.net.URLConnection;

String IP = "http://192.168.1.25/";
float time_start = 0, time_max = 3600;

void setup ()
{
  size(300, 500);
  colorMode(HSB);

  selec.pos(0, 0);
  selec.size(50, 50);
  selec.label("Mode");
  selec.teSize(12);
  selec.cor(#ffffb3);
  selec.value(0); //true

  power.pos(width - 80, 30);
  power.size(50, 20);
  power.cor(#3366ff);
  power.label("On");
  power.teSize(20);
  power.value(1); //true
  power.str_button("button0");

  piscar.pos(int(0.05*width), int(100));
  piscar.size(int(0.9*width/3), 40);
  piscar.cor(#3366ff);
  piscar.teSize(15);
  piscar.label("Piscar");
  piscar.value(0);
  piscar.str_button("button1");

  fader.pos(int(piscar.xpos + piscar.xdel), int(100));
  fader.size(int(0.9*width/3), 40);
  fader.cor(#3366ff);
  fader.teSize(15);
  fader.label("Fader");
  fader.value(0);
  fader.str_button("button2");

  shutdown.pos(int(fader.xpos + fader.xdel), int(100));
  shutdown.size(int(0.9*width/3), 40);
  shutdown.cor(#3366ff);
  shutdown.teSize(15);
  shutdown.label("Shutdown");
  shutdown.value(0);
  shutdown.str_button("buttonN14");

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

  selec.display();
  if(selec.value == 1)
    function_selec();
  else
  {
    textSize(22);
    fill(#000000);
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

void mousePressed ()
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
      power.cor(#003d99);
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
      color1.cor(#ff0000);
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
      color2.cor(#00ff00);
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
      color3.cor(#0000ff);
      color3.value(1);
    }
  }
}

void mouseMoved()
{
  if(selec.confere())
    selec.cor(#ffffcc);
  else
    selec.cor(#ffffb3);

  if(power.confere())
    power.cor(#66ccff);
  else
    if(power.value == 1)
      power.cor(#3366ff);
    else
      power.cor(#003d99);

  if(piscar.confere())
    piscar.cor(#66ccff);
  else
    if(piscar.value == 1)
      piscar.cor(#3366ff);
    else
      piscar.cor(#3366ff);

  if(fader.confere())
    fader.cor(#66ccff);
  else
    if(fader.value == 1)
      fader.cor(#3366ff);
    else
      fader.cor(#3366ff);

  if(shutdown.confere())
    shutdown.cor(#66ccff);
  else
    if(shutdown.value == 1)
      shutdown.cor(#3366ff);
    else
      shutdown.cor(#3366ff);

  if(color1.confere())
    color1.cor(#ff6666);
  else
    if(color1.value == 2) //1
      color1.cor(#660000);
    else
      color1.cor(#ff0000);

  if(color2.confere())
    color2.cor(#66ff66);
  else
    if(color2.value == 2) //1
      color2.cor(#006600);
    else
      color2.cor(#00ff00);

  if(color3.confere())
    color3.cor(#6666ff);
  else
    if(color3.value == 2) //1
      color3.cor(#000066);
    else
      color3.cor(#0000ff);
}
