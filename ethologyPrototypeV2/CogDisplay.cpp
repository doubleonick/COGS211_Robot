#include "CogDisplay.h"

#include <Arduino_H7_Video.h>
#include <lvgl.h>

Arduino_H7_Video Display(800,480,GigaDisplayShield);

static lv_obj_t* chassis;

static lv_obj_t* leftLDR;
static lv_obj_t* rightLDR;

static lv_obj_t* leftIR;
static lv_obj_t* rightIR;

static lv_obj_t* leftBump;
static lv_obj_t* rightBump;

static lv_obj_t* leftWheel;
static lv_obj_t* rightWheel;

CogDisplay::CogDisplay()
:
_leftWheel(0),
_rightWheel(0),
_leftLight(0),
_rightLight(0),
_leftProx(60),
_rightProx(60),
_leftFrontBump(false),
_rightFrontBump(false)
{
}

void CogDisplay::begin()
{
    Display.begin();
    lv_init();

    createHUD();
}

void CogDisplay::setWheelSpeeds(
    int left,
    int right)
{
    _leftWheel = left;
    _rightWheel = right;
}

void CogDisplay::setLights(
    int left,
    int right)
{
    _leftLight = left;
    _rightLight = right;
}

void CogDisplay::setProximity(
    int left,
    int right)
{
    _leftProx = left;
    _rightProx = right;
}

void CogDisplay::setBumps(
    bool leftFront,
    bool rightFront)
{
    _leftFrontBump = leftFront;
    _rightFrontBump = rightFront;
}

void CogDisplay::createHUD()
{
    lv_obj_set_style_bg_color(
        lv_scr_act(),
        lv_color_black(),
        LV_PART_MAIN);

    chassis = lv_obj_create(lv_scr_act());

    lv_obj_set_size(chassis,280,280);

    lv_obj_center(chassis);

    lv_obj_set_style_radius(
        chassis,
        LV_RADIUS_CIRCLE,
        0);

    lv_obj_set_style_bg_opa(
        chassis,
        LV_OPA_TRANSP,
        0);

    lv_obj_set_style_border_width(
        chassis,
        4,
        0);

    lv_obj_set_style_border_color(
        chassis,
        lv_color_white(),
        0);

    //
    // LDRs
    //

    leftLDR = lv_obj_create(lv_scr_act());

    lv_obj_set_size(leftLDR,32,32);

    lv_obj_align(
        leftLDR,
        LV_ALIGN_CENTER,
        -120,
        -160);

    lv_obj_set_style_radius(
        leftLDR,
        LV_RADIUS_CIRCLE,
        0);

    rightLDR = lv_obj_create(lv_scr_act());

    lv_obj_set_size(rightLDR,32,32);

    lv_obj_align(
        rightLDR,
        LV_ALIGN_CENTER,
        120,
        -160);

    lv_obj_set_style_radius(
        rightLDR,
        LV_RADIUS_CIRCLE,
        0);

    //
    // IRs
    //

    leftIR = lv_obj_create(lv_scr_act());

    lv_obj_set_size(leftIR,45,18);

    lv_obj_align(
        leftIR,
        LV_ALIGN_CENTER,
        -70,
        -125);

    rightIR = lv_obj_create(lv_scr_act());

    lv_obj_set_size(rightIR,45,18);

    lv_obj_align(
        rightIR,
        LV_ALIGN_CENTER,
        70,
        -125);

    //
    // Bumpers
    //

    leftBump = lv_obj_create(lv_scr_act());

    lv_obj_set_size(leftBump,28,28);

    lv_obj_align(
        leftBump,
        LV_ALIGN_CENTER,
        -90,
        -95);

    lv_obj_set_style_radius(
        leftBump,
        LV_RADIUS_CIRCLE,
        0);

    rightBump = lv_obj_create(lv_scr_act());

    lv_obj_set_size(rightBump,28,28);

    lv_obj_align(
        rightBump,
        LV_ALIGN_CENTER,
        90,
        -95);

    lv_obj_set_style_radius(
        rightBump,
        LV_RADIUS_CIRCLE,
        0);

    //
    // Wheel indicators
    //

    leftWheel = lv_label_create(lv_scr_act());

    lv_obj_align(
        leftWheel,
        LV_ALIGN_CENTER,
        -80,
        0);

    rightWheel = lv_label_create(lv_scr_act());

    lv_obj_align(
        rightWheel,
        LV_ALIGN_CENTER,
        80,
        0);
}

void CogDisplay::update()
{
    //
    // LDR COLOR
    //

    uint8_t leftAmber =
        map(_leftLight,0,100,80,255);

    uint8_t rightAmber =
        map(_rightLight,0,100,80,255);

    lv_obj_set_style_bg_color(
        leftLDR,
        lv_color_make(
            leftAmber,
            leftAmber,
            60),
        LV_PART_MAIN);

    lv_obj_set_style_bg_color(
        rightLDR,
        lv_color_make(
            rightAmber,
            rightAmber,
            60),
        LV_PART_MAIN);

    //
    // IR COLOR
    //

    uint8_t leftRed =
        map(_leftProx,60,18,160,255);

    uint8_t leftGreen =
        map(_leftProx,60,18,140,0);

    uint8_t leftBlue =
        map(_leftProx,60,18,140,0);

    uint8_t rightRed =
        map(_rightProx,60,18,160,255);

    uint8_t rightGreen =
        map(_rightProx,60,18,140,0);

    uint8_t rightBlue =
        map(_rightProx,60,18,140,0);

    lv_obj_set_style_bg_color(
        leftIR,
        lv_color_make(
            leftRed,
            leftGreen,
            leftBlue),
        LV_PART_MAIN);

    lv_obj_set_style_bg_color(
        rightIR,
        lv_color_make(
            rightRed,
            rightGreen,
            rightBlue),
        LV_PART_MAIN);

    //
    // BUMPERS
    //

    lv_obj_set_style_bg_color(
        leftBump,
        _leftFrontBump ?
            lv_color_white()
            :
            lv_color_black(),
        LV_PART_MAIN);

    lv_obj_set_style_border_color(
        leftBump,
        lv_color_white(),
        LV_PART_MAIN);

    lv_obj_set_style_border_width(
        leftBump,
        2,
        LV_PART_MAIN);

    lv_obj_set_style_bg_color(
        rightBump,
        _rightFrontBump ?
            lv_color_white()
            :
            lv_color_black(),
        LV_PART_MAIN);

    lv_obj_set_style_border_color(
        rightBump,
        lv_color_white(),
        LV_PART_MAIN);

    lv_obj_set_style_border_width(
        rightBump,
        2,
        LV_PART_MAIN);

    //
    // WHEEL ARROWS
    //

    String leftArrow;
    String rightArrow;

    int leftCount =
        constrain(abs(_leftWheel)/20,0,5);

    int rightCount =
        constrain(abs(_rightWheel)/20,0,5);

    char up[] = "▲";
    char down[] = "▼";

    for(int i=0;i<leftCount;i++)
    {
        leftArrow +=
            (_leftWheel >= 0)
            ? up
            : down;

        leftArrow += "\n";
    }

    for(int i=0;i<rightCount;i++)
    {
        rightArrow +=
            (_rightWheel >= 0)
            ? up
            : down;

        rightArrow += "\n";
    }

    lv_label_set_text(
        leftWheel,
        leftArrow.c_str());

    lv_label_set_text(
        rightWheel,
        rightArrow.c_str());

    lv_timer_handler();
}