int piezoPin1 = 5; // Piezo on Analog Pin 3
int sensorValue1 = 0; // A variable to store the value read from the sensor
void setup() {
  Serial.begin(9600);
}
void loop() {
  sensorValue1 = analogRead(piezoPin1); // Read the value from the sensor
  Serial.println(sensorValue1);
}
