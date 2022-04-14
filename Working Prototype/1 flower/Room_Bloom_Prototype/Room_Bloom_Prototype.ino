//Initialize connection to analog 5
int piezoPin1 = 5; // Piezo on Analog Pin 3
//Initialize sensor value
int sensorValue1 = 0; // A variable to store the value read from the sensor
//Set up Serial Monitor as output
void setup() {
  Serial.begin(9600);
}
//Read analog value and print it on serial monitor
void loop() {
  sensorValue1 = analogRead(piezoPin1); // Read the value from the sensor
  Serial.println(sensorValue1);
}
