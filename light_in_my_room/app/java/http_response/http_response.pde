import java.net.URL;
import java.io.*;
import java.net.URLConnection;


void setup ()
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

void draw () {
}
