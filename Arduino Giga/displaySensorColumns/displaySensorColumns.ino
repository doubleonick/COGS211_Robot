#include "Arduino_H7_Video.h"
#include "ArduinoGraphics.h"

const int NUM_ANA_PINS  = 8;
const int NUM_DIGI_PINS = 8;

#define ANALOG_PIN A0  
#define DIGITAL_PIN 2  

Arduino_H7_Video Display(800, 480, GigaDisplayShield);

int analogPins[NUM_ANA_PINS]   = {0, 1, 2, 3, 4, 5, 6, 7};
int digitalPins[NUM_DIGI_PINS] = {0, 1, 2, 3, 4, 5, 6, 7};
//int servo_pins[NUM_SERVOS];

void setup() 
{
    Serial.begin(9600);
    pinMode(DIGITAL_PIN, INPUT);
    Display.begin();
    Display.clear();
    Display.beginDraw();
    Display.textFont(Font_5x7);
    Display.textSize(5);
    Display.stroke(255, 255, 255); // White text

    
//    servo_pins   = [SERVO_LEFT_PIN, SERVO_RIGHT_PIN];
}

void loop() 
{
    int analogValue;// = analogRead(ANALOG_PIN);
    int digitalValue;// = digitalRead(DIGITAL_PIN);

    // Clear the screen before drawing new values
    Display.clear();

    // Print column headings
    Display.text("Analog Values", 50, 20);  // Left column header
    Display.text("Digital Values", 400, 20); // Right column header

    // Calculate positioning for consistent spacing
    for (int i = 0; i < NUM_ANA_PINS; i++) {  // Display 5 sets of data for simulation
        analogValue = analogRead(analogPins[i]);
        digitalValue = digitalRead(digitalPins[i]);

        // Format values into strings with padding
        char analogBuffer[NUM_ANA_PINS];
        sprintf(analogBuffer, "%d%8d", analogPins[i], analogValue); // Ensures 5 digits spacing

        char digitalBuffer[NUM_DIGI_PINS];
        sprintf(digitalBuffer, "%d%8d", digitalPins[i], digitalValue); // Digital values are just 1 digit

        // Print values at fixed intervals in columns
        Display.text(analogBuffer, 50, 60 + (i * 40));  // Left column
        Display.text(digitalBuffer, 400, 60 + (i * 40)); // Right column
    }

    Display.endDraw();
    delay(50); // Refresh interval
}
