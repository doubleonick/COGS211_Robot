#include <Servo.h>
#include "Arduino_H7_Video.h"         // Board-specific display library (its initialization is done internally)
#include "Arduino_GigaDisplayTouch.h"   // Board-specific touch library (initialized internally)
#include "lvgl.h"

Servo myServo;
lv_timer_t * myTimer;  // LVGL timer object

// Callback function executed by the LVGL timer every 1000 ms.
void myCallback(lv_timer_t * timer) {
  Serial.println("Callback function executed.");
  static int angle = 0;
  
  myServo.write(angle);
  Serial.print("Servo moved to: ");
  Serial.println(angle);
  
  // Toggle between 0° and 180° for demo purposes.
  angle = (angle == 0) ? 180 : 0;
}

void setup() {
  Serial.begin(9600);
//  while (!Serial) { }  // Wait for serial connection to establish
  Serial.println("Setup started.");
  
  // Initialize the servo on pin 9.
  myServo.attach(9);
  myServo.write(90);  // Start at a neutral position.
  
  // Board-specific libraries (Arduino_H7_Video and Arduino_GigaDisplayTouch) typically perform their own initialization.
  // So, explicit initialization calls are not required here.
  
  // Initialize LVGL.
  lv_init();
  Serial.println("LVGL initialized.");
  
  // Create an LVGL timer that triggers myCallback every 1000ms.
  myTimer = lv_timer_create(myCallback, 1000, NULL);
  
  if (myTimer != NULL) {
    Serial.println("LVGL Timer created successfully.");
  }
  else {
    Serial.println("Error: LVGL Timer creation failed!");
  }
}

void loop() {
  // Update LVGL's internal tick count. This is required for timers and animations to work.
  lv_tick_inc(5);
  
  // Process LVGL tasks—including executing timer callbacks.
  lv_timer_handler();
  
  Serial.println("LVGL Timer Processing...");
  
  delay(5);  // A small delay for system stability.
}
