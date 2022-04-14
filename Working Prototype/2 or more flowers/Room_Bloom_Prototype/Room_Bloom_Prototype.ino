int piezoPin1 = 5; // Piezo on Analog Pin 5
int piezoPin2 = 4; // Piezo on Analog Pin 4
int sensorValue1 = 0; // A variable to store the value read from sensor 1
int sensorValue2 = 0; // A variable to store the value read from sensor 2
void setup() {
Serial.begin(9600);//Initialize Serial Monitor
}
void loop() {
sensorValue1 = analogRead(piezoPin1); // Read the value from the sensor
Serial.print(sensorValue1);
Serial.print(",");
sensorValue2 = analogRead(piezoPin2); // Read the value from the sensor
Serial.print(sensorValue2);
Serial.println();
}
