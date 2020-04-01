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
Button color5 = new Button(); //
Button color6 = new Button(); //
Button color7 = new Button(); //
Button color8 = new Button(); //
Button color9 = new Button(); //
Button color10 = new Button(); //
Button color11 = new Button(); //



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


  color1.pos(int(0.05*width), int(0.81*height));
  color1.size(int(0.9*width/3), 40);
  color1.cor(#ff0000);
  color1.teSize(18);
  color1.label("Vermelho");
  color1.value(0);
  color1.str_button("button3");

  color2.pos(int(color1.xpos + color1.xdel), color1.ypos);
  color2.size(int(0.9*width/3), 40);
  color2.cor(#00ff00);
  color2.teSize(18);
  color2.label("Verde");
  color2.value(0);
  color2.str_button("button4");

  color3.pos(int(color2.xpos + color2.xdel), color1.ypos);
  color3.size(int(0.9*width/3), 40);
  color3.cor(#0000ff);
  color3.teSize(18);
  color3.label("Azul");
  color3.value(0);
  color3.str_button("button5");


  color4.pos(int(0.05*width), color1.ypos - 100);
  color4.size(int(0.9*width/4), 40);
  color4.cor(#ffabab);
  color4.teSize(10);
  color4.label("Ver Claro");
  color4.value(0);
  color4.str_button("button6");

  color5.pos(color4.xpos + color4.xdel, color4.ypos);
  color5.size(int(0.9*width/4), 40);
  color5.cor(#94ffff);
  color5.teSize(10);
  color5.label("Azul agua");
  color5.value(0);
  color5.str_button("button7");

  color6.pos(color5.xpos + color5.xdel, color4.ypos);
  color6.size(int(0.9*width/4), 40);
  color6.cor(#00ffff);
  color6.teSize(10);
  color6.label("Verde agua");
  color6.value(0);
  color6.str_button("button8");

  color7.pos(color6.xpos + color6.xdel, color4.ypos);
  color7.size(int(0.9*width/4), 40);
  color7.cor(#c116c4);
  color7.teSize(10);
  color7.label("Lilas sleep");
  color7.value(0);
  color7.str_button("button9");

  color8.pos(int(0.05*width), int(3 + color4.ydel + color4.ypos));
  color8.size(int(0.9*width/4), 40);
  color8.cor(#efefef);
  color8.teSize(10);
  color8.label("Branco");
  color8.value(0);
  color8.str_button("buttonN10");

  color9.pos(color8.xpos + color8.xdel, int(3 + color4.ydel + color4.ypos));
  color9.size(int(0.9*width/4), 40);
  color9.cor(#00588a);
  color9.teSize(10);
  color9.label("Azul escuro");
  color9.value(0);
  color9.str_button("buttonN11");

  color10.pos(color9.xpos + color9.xdel, int(3 + color4.ydel + color4.ypos));
  color10.size(int(0.9*width/4), 40);
  color10.cor(#00ffff);
  color10.teSize(10);
  color10.label("Verde escuro");
  color10.value(0);
  color10.str_button("buttonN12");

  color11.pos(color10.xpos + color10.xdel, int(3 + color4.ydel + color4.ypos));
  color11.size(int(0.9*width/4), 40);
  color11.cor(#f9f73d);
  color11.teSize(10);
  color11.label("Amarelo");
  color11.value(0);
  color11.str_button("buttonN13");
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

    color4.display();
    color5.display();
    color6.display();
    color7.display();

    color8.display();
    color9.display();
    color10.display();
    color11.display();
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

  if(color4.confere())
    function_color4();

  if(color5.confere())
    function_color5();

  if(color6.confere())
    function_color6();

  if(color7.confere())
    function_color7();

  if(color8.confere())
    function_color8();

  if(color9.confere())
    function_color9();

  if(color10.confere())
    function_color10();

  if(color11.confere())
    function_color11();

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
