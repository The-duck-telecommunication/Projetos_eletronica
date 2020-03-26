package processing.test.mobile;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.net.URL; 
import java.io.*; 
import java.net.URLConnection; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class mobile extends PApplet {






ControlP5 cp5;
CheckBox checkbox;

String IP = "http://192.168.1.25/";

public void setup ()
{
  
  cp5 = new ControlP5(this);

  checkbox = cp5.addCheckBox("checkBox")
    .setColorForeground(color(120))
    .setColorActive(color(150))
    .setColorLabel(color(255))
    .setPosition(width - 100, 10)
    .setSize(80, 20)
    .addItem("Desliga", 0)
    ;
}

public void draw ()
{
  background(238, 238, 238);
}

public void checkBox()
{
  try  
  {   
    URL url = new URL("http://192.168.1.25/button0");   
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

  public void settings() {  fullScreen(); }
}
