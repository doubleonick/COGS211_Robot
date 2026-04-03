#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>
#include "CogServo.h"

Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver(); // default I2C addr 0x40
CogServo driveServos(pwm);                               // PWM driver mode

void setup() {
  // Use channels 0 and 1 (begin() will initialize driver to 50 Hz by default)
  driveServos.begin(0, 1); // left channel 0, right channel 1
  driveServos.halt(0.0f);
}

void loop() {
  // Reverse turn for 800 ms with a R/L asymmetry
  driveServos.driveProportional(-40, +40, 0.5f);

  // Small pause
  driveServos.halt(1.0f);
}