#include "Arduino_H7_Video.h"
#include "Arduino_GigaDisplayTouch.h"
#include "lvgl.h"
#include <Servo.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 480
#define NUM_SERVOS 1

int servoPin = 9;
Servo servo;
//int servoPins[NUM_SERVOS] = {9, 10, 11, 12, 13};
//Servo servos[NUM_SERVOS];

Arduino_H7_Video Display(SCREEN_WIDTH, SCREEN_HEIGHT, GigaDisplayShield);
Arduino_GigaDisplayTouch TouchDetector;

lv_obj_t *slider;
lv_obj_t *label;
//lv_obj_t *toggle_btn;
//lv_obj_t *radio_btns[NUM_SERVOS];

int activeServoIndex = 0;  // Tracks selected servo
bool servoEnabled = true; // Enable/Disable state
int servoValue = 90;       // Default servo position

// **Slider event callback**
void slider_event_cb(lv_event_t * e) {
    lv_obj_t * slider = (lv_obj_t *)lv_event_get_target(e);
    servoValue = lv_slider_get_value(slider);

//    if (servoEnabled) 
//    {
////        servos[activeServoIndex].write(servoValue);
//      servo.write(servoValue);
//    }

    lv_label_set_text_fmt(label, "Servo Position: %d", servoValue);
}

//// **Enable/Disable button callback**
//void toggle_event_cb(lv_event_t * e) {
//    servoEnabled = !servoEnabled;
//    lv_label_set_text(toggle_btn, servoEnabled ? "Disable" : "Enable");
//}

//// **Radio button callback for selecting servos**
//void radio_event_cb(lv_event_t * e) {
//    lv_obj_t * btn = (lv_obj_t *)lv_event_get_target(e);
//    activeServoIndex = lv_obj_get_index(btn);  // Get index from UI
//}

// **Setup LVGL UI Elements**
void setup() 
{
  Serial.begin(9600);
  Display.begin();
  TouchDetector.begin();

  lv_obj_t * screen = lv_obj_create(lv_scr_act());
  lv_obj_set_size(screen, Display.width(), Display.height());

  static lv_coord_t col_dsc[] = { 500, LV_GRID_TEMPLATE_LAST};
  static lv_coord_t row_dsc[] = { 400, LV_GRID_TEMPLATE_LAST};

  lv_obj_t * grid = lv_obj_create(lv_scr_act());

  lv_obj_set_grid_dsc_array(grid, col_dsc, row_dsc);

  lv_obj_set_size(grid, Display.width(), Display.height());

  lv_obj_center(grid);

  //lv_obj_t * label;
  lv_obj_t * obj;

  obj = lv_obj_create(grid);
  lv_obj_set_grid_cell(obj, LV_GRID_ALIGN_STRETCH, 0, 1,
                        LV_GRID_ALIGN_STRETCH, 0, 1);
  lv_obj_set_flex_flow(obj, LV_FLEX_FLOW_COLUMN);

  //lv_obj_t * 

  // **Create slider container**
  lv_obj_t * slider_container = lv_obj_create(screen);
  lv_obj_set_size(slider_container, 400, 120);
  lv_obj_align(slider_container, LV_ALIGN_BOTTOM_MID, 0, -50);
  lv_obj_set_flex_flow(slider_container, LV_FLEX_FLOW_COLUMN);

  // **Create slider container**
  slider = lv_slider_create(slider_container);
  lv_slider_set_range(slider, 0, 180);
  lv_slider_set_value(slider, 90, LV_ANIM_OFF);
  lv_obj_add_event_cb(slider, slider_event_cb, LV_EVENT_VALUE_CHANGED, NULL);
  lv_obj_center(slider);
  
//
//  slider = lv_slider_create(obj);
//  lv_slider_set_value(slider, 50, LV_ANIM_OFF);
//  lv_obj_center(slider);
//  label = lv_label_create(obj);
////  lv_label_set_text(label, "Servo Position");
//  lv_obj_align_to(label, slider, LV_ALIGN_OUT_BOTTOM_MID, 0, 10);
}

// **LVGL Timer Update**
void loop() {
    lv_timer_handler();
}
