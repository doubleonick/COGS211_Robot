#include <Arduino.h>

void setup() {
  Serial.begin(9600);
  // Wait for the serial port to connect. (This might be necessary on some boards.)
  while (!Serial) { }
  Serial.println("Sketch is running.");

  // Also, blink the built-in LED (if available) for a visual cue.
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(500);
  digitalWrite(LED_BUILTIN, LOW);
  delay(500);
  Serial.println("Loop is running.");
}
