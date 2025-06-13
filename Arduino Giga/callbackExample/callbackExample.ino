unsigned long previousMillis = 0;
const unsigned long interval = 1000; // 1 second

void myCallback() {
    Serial.print("Callback function executed... ");
    Serial.println(previousMillis);
}

void setup() {
    Serial.begin(9600);
}

void loop() {
    unsigned long currentMillis = millis();

    // Check if enough time has passed
    if (currentMillis - previousMillis >= interval) {
        previousMillis = currentMillis;
        myCallback();  // Execute the function
    }
}
