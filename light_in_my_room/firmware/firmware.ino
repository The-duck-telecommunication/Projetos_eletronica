/*A fazer

  (V) Ver se as cores estão boas 
  ( ) Arrumar HTML
  ( ) Olhar bug na troca de uma funcção para a outra
  ( ) IP fixo
*/

int led_red = 14,
    led_gre = 12,
    led_blu = 13;

int set = 2, set_old = 2;

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ArduinoOTA.h>

const char* ssid = "h'(x)";
const char* password = "T5e5L0e9C7o7M0u2N7i4C4a0C6o4E0s";

WiFiServer server(80);
String header;

void setup()
{
  Serial.begin(115200);

  WiFi.begin(ssid, password);

  pinMode(2, OUTPUT);
  int resetar = millis();
  while (WiFi.status() != WL_CONNECTED)
  {
    digitalWrite(2, LOW);
    delay(200);
    Serial.print(".");
    digitalWrite(2, HIGH);

    resetar = millis();
    if (resetar > 500000)
      ESP.restart();
  }

  IPAddress ip(192,168,1,25);
  IPAddress gateway(192,168,1,1);
  IPAddress subnet(255,255,255,0);
  WiFi.config(ip, gateway, subnet);

  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  server.begin();

  pinMode(led_red, OUTPUT);
  pinMode(led_gre, OUTPUT);
  pinMode(led_blu, OUTPUT);


  ArduinoOTA.setHostname("ESP_quarto09");
  ArduinoOTA.onStart([]() {
    Serial.println("Inicio...");
  });
  ArduinoOTA.onEnd([]() {
    Serial.println("nFim!");
  });
  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total) {
    Serial.printf("Progresso: %u%%r", (progress / (total / 100)));
  });
  ArduinoOTA.onError([](ota_error_t error) {
    Serial.printf("Erro [%u]: ", error);
    if (error == OTA_AUTH_ERROR) Serial.println("Autenticacao Falhou");
    else if (error == OTA_BEGIN_ERROR) Serial.println("Falha no Inicio");
    else if (error == OTA_CONNECT_ERROR) Serial.println("Falha na Conexao");
    else if (error == OTA_RECEIVE_ERROR) Serial.println("Falha na Recepcao");
    else if (error == OTA_END_ERROR) Serial.println("Falha no Fim");
  });
  ArduinoOTA.begin();
}

void loop()
{
  ArduinoOTA.handle();

  wifi();

  if(set == 0)
    shotdowm_led();
  else if (set == 1)
    combination();
  else if (set == 2)
    fade(100);
  else if (set == 3)
    vermelhao();
  else if (set == 4)
    verdao();
  else if (set == 5)
    azulao();
  else if (set == 6)
    vermelhao_claro();
  else if (set == 7)
    azul_agua();
  else if (set == 8)
    verde_agua();
  else if (set == 9)
    lilas();
  else if (set == 10)
    branco();
  else if (set == 11)
    azul_escuro();
  else if (set == 12)
    verde_escuro();
  else if (set == 13)
    amarelo();
}








void wifi ()
{
  WiFiClient client = server.available();

  if (client)
  {
    Serial.println("New Client.");
    String currentLine = "";

    while (client.connected())
    {
      if (client.available())
      {
        char c = client.read();
        Serial.write(c);
        header += c;

        if (c == '\n')
        {
          if (currentLine.length() == 0)
          {
            client.println(all_html()); //envia o html para o cliente

            break;
          }
          else
          {
            currentLine = "";
          }
        }
        else if (c != '\r')
        {
          currentLine += c;
        }
      }
    }

    if (header.indexOf("GET /button0") >= 0)
    {
      set_old = set;
      set = 0;
    }
    else if (header.indexOf("GET /button1") >= 0)
    {
      set_old = set;
      set = 1;
    }
    else if (header.indexOf("GET /button2") >= 0)
    {
      set_old = set;
      set = 2;
    }
    else if (header.indexOf("GET /button3") >= 0)
    {
      set_old = set;
      set = 3;
    }
    else if (header.indexOf("GET /button4") >= 0)
    {
      set_old = set;
      set = 4;
    }
    else if (header.indexOf("GET /button5") >= 0)
    {
      set_old = set;
      set = 5;
    }
    else if (header.indexOf("GET /button6") >= 0)
    {
      set_old = set;
      set = 6;
    }
    else if (header.indexOf("GET /button7") >= 0)
    {
      set_old = set;
      set = 7;
    }
    else if (header.indexOf("GET /button8") >= 0)
    {
      set_old = set;
      set = 8;
    }
    else if (header.indexOf("GET /button9") >= 0)
    {
      set_old = set;
      set = 9;
    }
    else if (header.indexOf("GET /buttonN10") >= 0)
    {
      set_old = set;
      set = 10;
    }
    else if (header.indexOf("GET /buttonN11") >= 0)
    {
      set_old = set;
      set = 11;
    }
    else if (header.indexOf("GET /buttonN12") >= 0)
    {
      set_old = set;
      set = 12;
    }
    else if (header.indexOf("GET /buttonN13") >= 0)
    {
      set_old = set;
      set = 13;
    }

    header = "";
    client.stop();
  }
}

String all_html ()
{
  String _html = "";
  //_html += "HTTP/1.1 200 OK";
  //_html += "Content-type:text/html";
  //_html += "Connection: close";
  // Display the HTML web page

  _html += "<!DOCTYPE html><html>";
  _html += "<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">";
  _html += "<link rel=\"icon\" href=\"data:,\">";

  _html += "<style>";
  
  _html += ".btn-group button {";
  _html += "background-color: #4CAF50;";
  _html += "border: 1px solid green; ";
  _html += "color: white;";
  _html += "padding: 10px 24px;";
  _html += "cursor: pointer;";
  _html += "float: left;";
  _html += "}";

  _html += ".btn-group:after {";
  _html += "content: "";";
  _html += "clear: both;";
  _html += "display: table;";
  _html += "}";

  _html += ".btn-group button:not(:last-child) {";
  _html += "border-right: none;";
  _html += "}";

  _html += ".btn-group button:hover {";
  _html += "background-color: #3e8e41;";
  _html += "}";

  _html += "</style>";

  _html += "</head>";

  // Web Page Heading
  _html += "<body>";

  _html += "<h1 style=\"text-align: center\">My Web page :D</h1>";
  
  _html += "<div class=\"btn-group\" style=\"width:100%\">";

  _html += "<br>";
  _html += "<p><a href=\"/button0\"><button style=\"width:100%\" >Desligar</button></a></p>";

	_html += "</div>";

  _html += "<br>";
  _html += "<p>Modo atual: ";
  if(set == 0)
    _html += "Desligado</p>";
  else if ((set >= 1) && (set <= 2))
    _html += "Funcoes</p>";
  else if ((set >= 3) && (set <= 5))
    _html += "Cores solidas</p>";
  else if ((set >= 6) && (set <= 13))
    _html += "Cores</p>";
  

  _html += "<br>";

  _html += "<p>Algumas funcoes:</p>";
	_html += "<div class=\"btn-group\" style=\"width:100%\">";

  _html += "<p><a href=\"/button1\"><button style=\"width:50%\" >Pisca pisca</button></a></p>";
  _html += "<p><a href=\"/button2\"><button style=\"width:50%\" >Fade</button></a></p>";

	_html += "</div>";

  _html += "<br>";
  _html += "<br>";
	_html += "<p>Algumas cores:</p>";

	_html += "<div class=\"btn-group\" style=\"width:100%\">";

  _html += "<p><a href=\"/button6\"><button style=\"width:25%\">Vermelho claro</button></a></p>";
 	_html += "<p><a href=\"/button7\"><button style=\"width:25%\">Azul agua</button></a></p>";
  _html += "<p><a href=\"/button8\"><button style=\"width:25%\">Verde agua</button></a></p>";
  _html += "<p><a href=\"/button9\"><button style=\"width:25%\">Lilas sleep</button></a></p>";

  _html += "<p><a href=\"/buttonN10\"><button style=\"width:25%\">Branco normal</button></a></p>";
 	_html += "<p><a href=\"/buttonN11\"><button style=\"width:25%\">Azul escuro</button></a></p>";
  _html += "<p><a href=\"/buttonN12\"><button style=\"width:25%\">Verde escuro</button></a></p>";
  _html += "<p><a href=\"/buttonN13\"><button style=\"width:25%\">Amarelo bebe</button></a></p>";

	_html += "</div>";


  _html += "<br>";
  _html += "<br>";
  _html += "<br>";
  _html += "<br>";
  _html += "<br>";
  _html += "<hr>";
  _html += "<br>";
	_html += "<p>Cores solidas</p>";
	_html += "<div class=\"btn-group\" style=\"width:100%\">";

 	_html += "<p><a href=\"/button3\"><button style=\"width:33.3%; background-color: rgb(245, 30, 30);\" href=\"/button3\">Vermelho</button></a></p>";
 	_html += "<p><a href=\"/button4\"><button style=\"width:33.3%; background-color: rgb(30, 245, 30);\" href=\"/button4\">Verde</button></a></p>";
 	_html += "<p><a href=\"/button5\"><button style=\"width:33.3%; background-color: rgb(30, 30, 245);\" href=\"/button5\">Azul</button></a></p>";

	_html += "</div>";
  
  /*
  _html += "<br>";
  _html += "<br>";
  _html += "<p>for dev: <br> set: ";
  _html += set;
  _html += "; set old: ";
  _html += set_old;
  _html += "</p>";*/

  _html += "</body></html>";

  return _html;
}

String all_html_test ()
{
  String _html = "";
  _html += "HTTP/1.1 200 OK";
  _html += "Content-type:text/html";
  _html += "Connection: close";
  // Display the HTML web page

  _html += "<!DOCTYPE html><html>";

  _html += "<head>";

  _html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">";
  _html += "<link rel=\"icon\" href=\"data:,\">";
  
  _html += "<style>html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}";
  _html += ".button { background-color: #195B6A; border: none; color: white; padding: 16px 40px;";
  _html += "text-decoration: none; font-size: 30px; margin: 2px; cursor: pointer;}";
  _html += ".button2 {background-color: #77878A;}</style>";

  _html += "</head>";

  // Web Page Heading
  _html += "<body>";
  _html += "<h1>Web Server select function and color :D</h1>";

	_html += "<p>Same function:</p>";
	_html += "<div class=\"btn-group\" style=\"width:100%\">";

  _html += "<p><a href=\"/button1\"><button style=\"width:50%\" >Pisca pisca></button></a></p>";
  _html += "<p><a href=\"/button2\"><button style=\"width:50%\" >Fade></button></a></p>";

	_html += "</div>";

	_html += "<p>Basic color:</p>";

	_html += "<div class=\"btn-group\" style=\"width:100%\">";

 	_html += "<button style=\"width:33.3%\" href=\"/button3\">Vermelho</button>";
 	_html += "<button style=\"width:33.3%\" href=\"/button4\">Verde</button>";
 	_html += "<button style=\"width:33.3%\" href=\"/button5\">Azul</button>";

	_html += "</div>";

	_html += "<p>Four buttons in a group:</p>";
	_html += "<div class=\"btn-group\" style=\"width:100%\">";
 	_html += "<button style=\"width:25%\">Apple</button>";
 	_html += "<button style=\"width:25%\">Samsung</button>";
  _html += "<button style=\"width:25%\">Sony</button>";
  _html += "<button style=\"width:25%\">HTC</button>";
	_html += "</div>";

 	_html += "</body></html>";

  return _html;
}

void fade (int del)
{
  Serial.println("primeiro for");
  for (int i = 0; (i < 255) && (!breck_for()); i++)
  {
    analogWrite(led_red, i);
    analogWrite(led_blu, 255 - i);
    Serial.println(i);

    wifi();
    delay(del);
  }

  Serial.println("segundo for");
  for (int i = 0; (i < 255) && (!breck_for()); i++)
  {
    analogWrite(led_red, 255 - i);
    analogWrite(led_gre, i);
    Serial.println(i);

    wifi();
    delay(del );
  }

  Serial.println("terceiro for");
  for (int i = 0; (i < 255) && (!breck_for()); i++)
  {
    analogWrite(led_gre, 255 - i);
    analogWrite(led_blu, i);
    Serial.println(i);

    wifi();
    delay(del );
  }
}

bool breck_for ()
{
  Serial.print("set: ");
  Serial.print(set);
  Serial.print("  set_old: ");
  Serial.println(set_old);

  if (set != set_old)
  {
    set_old = set;
    return true;
  }
  else
    return false;
}

void combination ()
{
  digitalWrite(led_red, HIGH);
  wifi();
  delay(500);
  digitalWrite(led_gre, HIGH);
  wifi();
  delay(500);

  digitalWrite(led_red, LOW);
  wifi();
  delay(500);

  digitalWrite(led_blu, HIGH);
  wifi();
  delay(500);

  digitalWrite(led_gre, LOW);
  wifi();
  delay(500);

  shotdowm_led();
}

void vermelhao ()
{
  digitalWrite(led_red, HIGH);
  digitalWrite(led_gre, LOW);
  digitalWrite(led_blu, LOW);
}

void verdao ()
{
  digitalWrite(led_red, LOW);
  digitalWrite(led_gre, HIGH);
  digitalWrite(led_blu, LOW);
}

void azulao ()
{
  digitalWrite(led_red, LOW);
  digitalWrite(led_gre, LOW);
  digitalWrite(led_blu, HIGH);
}

void vermelhao_claro()
{
  digitalWrite(led_red, HIGH);
  analogWrite(led_gre, 150);
  analogWrite(led_blu, 150);
}
void branco()
{
  digitalWrite(led_red, HIGH);
  digitalWrite(led_gre, HIGH);
  digitalWrite(led_blu, HIGH);
}

void azul_agua()
{
  analogWrite(led_red, 200);
  analogWrite(led_gre, 200);
  digitalWrite(led_blu, HIGH);
}
void azul_escuro()
{
  analogWrite(led_red, 50);
  analogWrite(led_gre, 50);
  analogWrite(led_blu, 200);
}

void verde_agua ()
{
  digitalWrite(led_red, LOW);
  digitalWrite(led_gre, HIGH);
  digitalWrite(led_blu, HIGH);
}
void verde_escuro ()
{
  digitalWrite(led_red, LOW);
  analogWrite(led_gre, 200);
  analogWrite(led_blu, 50);
}

void lilas ()
{
  analogWrite(led_red, 180);
  analogWrite(led_gre, 50);
  analogWrite(led_blu, 180);
}

void amarelo ()
{
  analogWrite(led_red, 255);
  analogWrite(led_gre, 220);
  analogWrite(led_blu, 0);
}

void shotdowm_led()
{
  digitalWrite(led_red, LOW);
  digitalWrite(led_gre, LOW);
  digitalWrite(led_blu, LOW);
}
