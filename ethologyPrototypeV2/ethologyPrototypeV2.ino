#include "EthologyRobot.h"
#include "CogDisplay.h"
// #include "CogAnaDigi.h"

// #include "CogProximity.h"
// #include "CogLight.h"

// CogProximity rightProx("A1");
// CogProximity leftProx("A0");
// CogLight     rightLight("A3");
// CogLight     leftLight("A2");

// Example usage with a labeled analog pin and a numeric digital pin
// CogAnaDigi analogSensor(A0);//DO I HAVE TO USE "A0", or will A0 do?
// CogAnaDigi digitalSensor(7);  // assumed DIGITAL by constructor

// Pick your actual PWM-capable pins for your Arduino board
constexpr uint8_t LEFT_SERVO_CHANNEL  = 6;
constexpr uint8_t RIGHT_SERVO_CHANNEL = 5;

Adafruit_PWMServoDriver pwm;
EthologyRobot bot;//pwm);
CogDisplay display;
//EthologyRobot bot;//USE FOR Servo.h IMPLEMENTATION

// void rotateClockwise()
// {
//   for(int rate = 0; rate <=100; rate += 5)
//   {
//     bot.driveProportional(rate, -rate,  0.5);
//   }
// }

// void rotateAntiClockwise()
// {
//   for(int rate = 0; rate >= -100; rate -= 5)
//   {
//     bot.driveProportional(rate, -rate,  0.5);
//   }
// }

// void driveForward()
// {
//   for(int rate = 0; rate <=100; rate += 5)
//   {
//     bot.driveProportional(rate, rate,  0.5);
//   }
// }

// void driveBackward()
// {
//   for(int rate = 0; rate >= -100; rate -= 5)
//   {
//     bot.driveProportional(rate, rate,  0.5);
//   }
// }

void setup() 
{
  Serial.begin(9600);
  bot.begin(LEFT_SERVO_CHANNEL, RIGHT_SERVO_CHANNEL);
  display.begin();
  // bot.halt(3.0);
}

void loop() 
{
  bot.hierarchy();

  display.setLights(
      bot.leftLight.getData(),
      bot.rightLight.getData());

  display.setProximity(
      bot.leftProx.getData(),
      bot.rightProx.getData());

  display.setBumps(
      bot.leftFrontBump.getData() == 0,
      bot.rightFrontBump.getData() == 0);

  // Temporary placeholder until wheel command getters exist
  display.setWheelSpeeds(0, 0);

  display.update();

}