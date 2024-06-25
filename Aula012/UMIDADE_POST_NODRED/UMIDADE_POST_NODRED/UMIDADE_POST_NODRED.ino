#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

WiFiClient client;
HTTPClient httpClient;

const char *WIFI_SSID = "HackaTruck";
const char *WIFI_PASSWORD = "eiaTruck2016";
const char *URL = "http://192.168.128.6:1880/umidadePOST";
//http://
int output_value ;
int sensor_pin = A0;
 
void setup(){
    Serial.begin(115200); 
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("Connected");
    delay(2000);
}

void loop(){
  output_value= analogRead(sensor_pin);  
  output_value = map(output_value,1024,0,0,100);
  String data = "umidade="+String(output_value);

    httpClient.begin(client, URL);
    httpClient.addHeader("Content-Type", "application/x-www-form-urlencoded");
    httpClient.POST(data);
    String content = httpClient.getString();
    httpClient.end();

    Serial.print(output_value); 
    Serial.print("\n resposta");   
    Serial.println(content);
    delay(3000);
}