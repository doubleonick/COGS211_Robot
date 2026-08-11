#ifndef COGDISPLAY_H
#define COGDISPLAY_H

#include <Arduino.h>

class CogDisplay
{
public:

    CogDisplay();

    void begin();

    void setWheelSpeeds(
        int left,
        int right);

    void setLights(
        int left,
        int right);

    void setProximity(
        int left,
        int right);

    void setBumps(
        bool leftFront,
        bool rightFront);

    void update();

private:

    int _leftWheel;
    int _rightWheel;

    int _leftLight;
    int _rightLight;

    int _leftProx;
    int _rightProx;

    bool _leftFrontBump;
    bool _rightFrontBump;

    void createHUD();
};

#endif