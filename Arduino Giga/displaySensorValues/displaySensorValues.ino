#include "Arduino_H7_Video.h"
#include "ArduinoGraphics.h"

#define BLACK 0x000000  // Define black color as a hex value

#define ANALOG_PIN A0   // Example analog pin
#define DIGITAL_PIN 2   // Example digital pin

Arduino_H7_Video Display(800, 480, GigaDisplayShield);

void setup() {
    Serial.begin(9600);
    pinMode(DIGITAL_PIN, INPUT);
    Display.begin();
    Display.clear();
    Display.beginDraw();
    Display.textFont(Font_5x7);
//    Display.textFont(Arial_14); // Set readable font
    Display.textSize(5);
  
    Display.stroke(255, 255, 255);
}

void loop() {
    int analogValue = analogRead(ANALOG_PIN);
    int digitalValue = digitalRead(DIGITAL_PIN);

    // Clear text area manually by drawing a filled rectangle over previous text
    Display.rect(0, 0, 800, 480); // If it only supports four arguments

    // Convert values to strings and display
    String analogStr = "Analog Value: " + String(analogValue);
    String digitalStr = "Digital Value: " + String(digitalValue);

    Serial.println(analogStr);
    Serial.println(digitalStr);
    
    Display.stroke(255, 255, 255);
    Display.text(analogStr.c_str(), 50, 50);
    Display.text(digitalStr.c_str(), 50, 100);
    Display.endDraw();


    delay(50); // Refresh interval
}
