#include "Arduino_H7_Video.h"
#include "lvgl.h"
#include "Arduino_GigaDisplayTouch.h"

// Display and touch setup
Arduino_H7_Video Display(800, 480, GigaDisplayShield);
Arduino_GigaDisplayTouch TouchDetector;

// Constants
#define MAX_ITEMS 8
String labels[MAX_ITEMS];
int numItems = 0;
int selectedIndex = -1;

// GUI element references
lv_obj_t *grid;              // Grid layout for GUI
lv_obj_t *radio_container;   // Container for radio buttons

// Function prototypes
void addButtonCallback(lv_event_t *e);
void removeButtonCallback(lv_event_t *e);
void moveUpButtonCallback(lv_event_t *e);
void moveDownButtonCallback(lv_event_t *e);
void readyButtonCallback(lv_event_t *e);

void setup() {
  delay(3000);  // Delay for initialization

  // Initialize display and touch
  Display.begin();
  TouchDetector.begin();

  // Create screen
  lv_obj_t *screen = lv_obj_create(lv_scr_act());
  lv_obj_set_size(screen, Display.width(), Display.height());

  // Create grid layout
  static lv_coord_t col_dsc[] = {500, LV_GRID_TEMPLATE_LAST};
  static lv_coord_t row_dsc[] = {400, LV_GRID_TEMPLATE_LAST};
  grid = lv_obj_create(lv_scr_act());
  lv_obj_set_grid_dsc_array(grid, col_dsc, row_dsc);
  lv_obj_set_size(grid, Display.width(), Display.height());
  lv_obj_center(grid);

  // Create radio container
  radio_container = lv_obj_create(grid);
  lv_obj_set_grid_cell(radio_container, LV_GRID_ALIGN_STRETCH, 0, 1,
                       LV_GRID_ALIGN_STRETCH, 0, 1);
  lv_obj_set_flex_flow(radio_container, LV_FLEX_FLOW_COLUMN);

  // Add action buttons
  lv_obj_t *add_button = lv_btn_create(grid);
  lv_obj_set_grid_cell(add_button, LV_GRID_ALIGN_CENTER, 1, 1, LV_GRID_ALIGN_CENTER, 0, 1);
  lv_obj_t *label = lv_label_create(add_button);
  lv_label_set_text(label, "Add");
  lv_obj_add_event_cb(add_button, addButtonCallback, LV_EVENT_CLICKED, NULL);

  lv_obj_t *remove_button = lv_btn_create(grid);
  lv_obj_set_grid_cell(remove_button, LV_GRID_ALIGN_CENTER, 1, 1, LV_GRID_ALIGN_CENTER, 1, 1);
  label = lv_label_create(remove_button);
  lv_label_set_text(label, "Remove");
  lv_obj_add_event_cb(remove_button, removeButtonCallback, LV_EVENT_CLICKED, NULL);

  lv_obj_t *move_up_button = lv_btn_create(grid);
  lv_obj_set_grid_cell(move_up_button, LV_GRID_ALIGN_CENTER, 1, 1, LV_GRID_ALIGN_CENTER, 2, 1);
  label = lv_label_create(move_up_button);
  lv_label_set_text(label, "Move Up");
  lv_obj_add_event_cb(move_up_button, moveUpButtonCallback, LV_EVENT_CLICKED, NULL);

  lv_obj_t *move_down_button = lv_btn_create(grid);
  lv_obj_set_grid_cell(move_down_button, LV_GRID_ALIGN_CENTER, 1, 1, LV_GRID_ALIGN_CENTER, 3, 1);
  label = lv_label_create(move_down_button);
  lv_label_set_text(label, "Move Down");
  lv_obj_add_event_cb(move_down_button, moveDownButtonCallback, LV_EVENT_CLICKED, NULL);

  lv_obj_t *ready_button = lv_btn_create(grid);
  lv_obj_set_grid_cell(ready_button, LV_GRID_ALIGN_CENTER, 1, 1, LV_GRID_ALIGN_CENTER, 4, 1);
  label = lv_label_create(ready_button);
  lv_label_set_text(label, "Ready");
  lv_obj_add_event_cb(ready_button, readyButtonCallback, LV_EVENT_CLICKED, NULL);
}

void loop() {
  lv_task_handler();  // Handle LVGL tasks
}

// Callback functions
void addButtonCallback(lv_event_t *e) {
  if (numItems < MAX_ITEMS) {
    String label = "New Item " + String(numItems + 1);
    labels[numItems++] = label;

    lv_obj_t *cb = lv_checkbox_create(radio_container);
    lv_checkbox_set_text(cb, label.c_str());
  }
}

void removeButtonCallback(lv_event_t *e) {
  if (selectedIndex >= 0 && selectedIndex < numItems) {
    labels[selectedIndex] = "";
    lv_obj_t *cb = lv_checkbox_create(radio_container);
    lv_obj_del(cb);
    numItems--;
    selectedIndex = -1;
  }
}

void moveUpButtonCallback(lv_event_t *e) {
  if (selectedIndex > 0) {
    String temp = labels[selectedIndex];
    labels[selectedIndex] = labels[selectedIndex - 1];
    labels[selectedIndex - 1] = temp;
    selectedIndex--;
  }
}

void moveDownButtonCallback(lv_event_t *e) {
  if (selectedIndex < numItems - 1) {
    String temp = labels[selectedIndex];
    labels[selectedIndex] = labels[selectedIndex + 1];
    labels[selectedIndex + 1] = temp;
    selectedIndex++;
  }
}

void readyButtonCallback(lv_event_t *e) {
  SerialUSB.println("Ready button clicked!");
  for (int i = 0; i < numItems; i++) {
    SerialUSB.println("Hierarchy Item: " + labels[i]);
  }
}
