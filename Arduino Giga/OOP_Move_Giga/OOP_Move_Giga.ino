/*******************************************************************/
/*******************************************************************
 * Created January 2024 by Nick Livingston
 * Edited April 2024 by Nick Livingston
 * 
 * This is baseline code for getting a TinyDuino based two-wheeled
 * vehicle to drive using proportional drive.  Proportional drive
 * in this context means, the left and right motors (servo or DC)
 * are controlled through a drive() function that specifies how
 * much of the maximum possible power should be used to drive
 * each motor, and for how long.  The left_proportion and
 * right_proportion parameters for the drive() function may take
 * values between -1 and 1, where -1 means that motor should be
 * driven at full power "backwards", and +1 means the motor should
 * be driven at full power "forwards".
 *
 * This code has been tested and verified for the TinyScreen+ and
 * RobotZero controllers, and works with both DC and servo motors.
 * The constant integer, "MOTOR_TYPE" is used to determine which
 * motor is used in the rest of the code.  "DC_MOTOR" means that
 * a direct current motor will be used, either in the DC motor port
 * on the RobotZero, or in a motor shield for the TinyScreen+.
 * "TS_SERVO" stands for "TinyScreen" servo, and will indicate that
 * a ServoDriver object should be created and initialized with the
 * value NO_R_REMOVED, which comes from the ServoDriver library, and
 * resolves to the value 0.  "RZ_SERVO" stands for "RobotZero" servo
 * and indicates that a ServoDriver object should be created and
 * initialized with the value 15, which is the argument needed for
 * the ServoDriver constructor if a servo is being used with the
 * RobotZero controller.
 * Thus, to use this code, you must know which controller you are
 * using if you are going to drive using servos, or you must set
 * MOTOR_TYPE to DC_MOTOR if you are using a DC motor.  This code
 * can serve as a starting point for more sophisticated robotics
 * projects.  Add code for your sensors and controlling logic, and
 * your two wheeled robot should be on its way!
 *******************************************************************/
/*******************************************************************/
#include <Adafruit_PWMServoDriver.h>
#include <ServoDriver.h>

#define SerialMonitorInterface Serial

/*** Motor/Servo Variables and Constants ***/

//Meta Motor
#define DC_MOTOR 1
#define TS_SERVO NO_R_REMOVED
#define RZ_SERVO 15
#define AF_SERVO 16
const int MOTOR_TYPE = AF_SERVO;

//Servo Motor
const int SERVO_HALT = 1500;
const int MAX_SERVO_OFFSET = 500;
const int LEFT_PORT = 0;
const int RIGHT_PORT = 2;

//Adafruit Servo Motor
const int SERVO_FREQ = 50; // Analog servos run at ~50 Hz updates

//DC Motor
int maxPWM = 10000;
int steps = 300;
int stepSize = maxPWM / steps;

//If you are not using a DC motor, the value of MOTOR_TYPE
//should be set to "TS_SERVO" if you are using the TinyScreen+ processor
//or "RZ_SERVO" if you are using the RobotZero.  Each of these constants
//has the value needed to pass to the ServoDriver constructor in order
//to properly initialize the servo object for the corresponding controller.
#if MOTOR_TYPE != DC_MOTOR
ServoDriver servo(MOTOR_TYPE);// Value passed is the address- RobotZero is always address 15
Adafruit_PWMServoDriver af_servo = Adafruit_PWMServoDriver();
#endif 

void setup() 
{
  delay(200);              //TOF Sensor Startup time
  SerialMonitorInterface.begin(115200);
  driveInit();
}
/*******************************************************************/
void loop() 
{
  SerialMonitorInterface.println("forward");
  translate(0.5, "forward", 2);
  SerialMonitorInterface.println("backward");
  translate(0.5, "backward", 2);
  SerialMonitorInterface.println("rotate clockwise");
  rotate(0.5, "clockwise", 5);
  SerialMonitorInterface.println("rotate anti-clockwise");
  rotate(0.5, "anti-clockwise", 5);
  SerialMonitorInterface.println("arc right");
  arc(0.5, "right", 5);
  SerialMonitorInterface.println("arc left");
  arc(0.5, "left", 5);
}
/*******************************************************************/
void driveInit() {
//  if (MOTOR_TYPE == DC_MOTOR)
//  {
//    dcMotorInit();
//  }
//  else 
//  if(MOTOR_TYPE != AF_SERVO)
//  {
//    servoInit();
//  }
//  else
//  {
//    afServoInit();
//  }
  afServoInit();
}
/*******************************************************************/
void afServoInit()
{
  af_servo.begin();
  /*
   * In theory the internal oscillator (clock) is 25MHz but it really isn't
   * that precise. You can 'calibrate' this by tweaking this number until
   * you get the PWM update frequency you're expecting!
   * The int.osc. for the PCA9685 chip is a range between about 23-27MHz and
   * is used for calculating things like writeMicroseconds()
   * Analog servos run at ~50 Hz updates, It is importaint to use an
   * oscilloscope in setting the int.osc frequency for the I2C PCA9685 chip.
   * 1) Attach the oscilloscope to one of the PWM signal pins and ground on
   *    the I2C PCA9685 chip you are setting the value for.
   * 2) Adjust setOscillatorFrequency() until the PWM update frequency is the
   *    expected value (50Hz for most ESCs)
   * Setting the value here is specific to each individual I2C PCA9685 chip and
   * affects the calculations for the PWM update frequency. 
   * Failure to correctly set the int.osc value will cause unexpected PWM results
   */
  af_servo.setOscillatorFrequency(27000000);
  af_servo.setPWMFreq(SERVO_FREQ);  // Analog servos run at ~50 Hz updates

  delay(10);
}
/*******************************************************************/
void drive(float left_proportion, float right_proportion, float delay_seconds)
{
  uint16_t left_speed;
  uint16_t right_speed;

  if(MOTOR_TYPE == DC_MOTOR)
  {
//    left_speed  = -left_proportion * maxPWM;
//    right_speed = right_proportion * maxPWM;
//
//    SerialMonitorInterface.print(", left_speed: ");
//    SerialMonitorInterface.print(left_speed);
//    SerialMonitorInterface.print(", right_speed: ");
//    SerialMonitorInterface.println(right_speed);
//
//    setDCMotor(LEFT_PORT, left_speed);
//    setDCMotor(RIGHT_PORT, right_speed);
//    delay(delay_seconds * 1000);
  }
  else
  {
    left_speed  = SERVO_HALT - left_proportion * MAX_SERVO_OFFSET;
    right_speed = SERVO_HALT + right_proportion * MAX_SERVO_OFFSET;
    
    SerialMonitorInterface.print(", left_speed: ");
    SerialMonitorInterface.print(left_speed);
    SerialMonitorInterface.print(", right_speed: ");
    SerialMonitorInterface.println(right_speed);

    if(MOTOR_TYPE == AF_SERVO)
    {
      af_servo.writeMicroseconds(LEFT_PORT, left_speed);
      af_servo.writeMicroseconds(RIGHT_PORT, right_speed);
    }
    else
    {
      servo.setServo(LEFT_PORT, left_speed);
      servo.setServo(RIGHT_PORT, right_speed);
    }
         
    delay(delay_seconds * 1000);
  }
  
  
}
/*******************************************************************/
void translate(float speed, String direction, float delay_seconds)
{
  if(direction == "backward")
  {
    speed *= -1;
  }
  drive(speed, speed, delay_seconds);
}
/*******************************************************************/
void rotate(float speed, String direction, float delay_seconds)
{
  float left_speed = speed;
  float right_speed = speed;
  if(direction == "clockwise")
  {
    right_speed *= -1;
  }
  else if(direction == "anti-clockwise")
  {
    left_speed *= -1;
  }

  drive(left_speed, right_speed, delay_seconds);
}
/*******************************************************************/
void arc(float speed, String direction, float delay_seconds)
{
  if(speed < 0.2)
  {
    speed = 0.2;
  }
  else if(speed > 1.0)
  {
    speed = 1.0;
  }
  
  float left_speed = speed;
  float right_speed = speed;
  
  if(direction == "left")
  {
    left_speed *= 0.5;
  }
  else if(direction == "right")
  {
    right_speed *= 0.5;
  }

  drive(left_speed, right_speed, delay_seconds);
}
/*******************************************************************/
