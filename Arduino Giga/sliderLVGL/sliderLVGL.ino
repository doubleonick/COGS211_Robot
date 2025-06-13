#include "Arduino_H7_Video.h"
#include "Arduino_GigaDisplayTouch.h"

#include "lvgl.h"

Arduino_H7_Video Display(800, 480, GigaDisplayShield); /* Arduino_H7_Video Display(1024, 768, USBCVideo); */
Arduino_GigaDisplayTouch  TouchDetector;

void setup() 
{
  Serial.begin(9600);
//  Display.begin();
//  Display.clear();
//  Display.beginDraw();
//  Display.textFont(Font_5x7);
//  Display.textSize(5);
//  Display.stroke(255, 255, 255); // White text
  TouchDetector.begin();

  lv_obj_t * screen = lv_obj_create(lv_scr_act());
  lv_obj_set_size(screen, Display.width(), Display.height());

  //Dimensions of the panel in which the slider sits.
  static lv_coord_t col_dsc[] = { 500, LV_GRID_TEMPLATE_LAST};
  static lv_coord_t row_dsc[] = { 400, LV_GRID_TEMPLATE_LAST};

  lv_obj_t * grid = lv_obj_create(lv_scr_act());

  lv_obj_set_grid_dsc_array(grid, col_dsc, row_dsc);

  lv_obj_set_size(grid, Display.width(), Display.height());

  lv_obj_center(grid);

  lv_obj_t * label;
  lv_obj_t * obj;

  obj = lv_obj_create(grid);
  lv_obj_set_grid_cell(obj, LV_GRID_ALIGN_STRETCH, 0, 1,
                        LV_GRID_ALIGN_STRETCH, 0, 1);
  lv_obj_set_flex_flow(obj, LV_FLEX_FLOW_COLUMN);

  //The slider
  lv_obj_t * slider = lv_slider_create(obj);
  lv_slider_set_value(slider, 0, LV_ANIM_OFF);
  lv_obj_center(slider);
  label = lv_label_create(obj);
  lv_label_set_text(label, "-100         Set Servo         100");
  lv_obj_align_to(label, slider, LV_ALIGN_CENTER, 0, 10);

}

void loop() {
  lv_timer_handler();

  int sliderValue = lv_slider_get_value(slider);

  char digitalBuffer[3];
  sprintf(digitalBuffer, "%d%", sliderValue); // Digital values are just 1 digit

        
//  Display.clear();
//  Display.beginDraw();
//  Display.textFont(Font_5x7);
//  Display.stroke(255, 255, 255);
//  Display.text(digitalBuffer, 50, 60);
//  Display.endDraw();

}
