//int ledPin = 9; // LED on Digital Pin 9
//int ledPin2=7;
int piezoPin1 = 5; // Piezo on Analog Pin 3
int piezoPin2 = 4; // Piezo on Analog Pin 5
//int piezoPin3 = 3; // Piezo on Analog Pin 6
//int piezoPin4 = 2; // Piezo on Analog Pin 9
//int threshold = 100; // The sensor value to reach before activation
int sensorValue1 = 0; // A variable to store the value read from the sensor
int sensorValue2 = 0;
int sensorValue3 = 0;
int sensorValue4 = 0;
void setup() {
//pinMode(ledPin, OUTPUT); // Set the ledPin to an OUTPUT
Serial.begin(9600);
}
void loop() {
sensorValue1 = analogRead(piezoPin1); // Read the value from the sensor
Serial.print(sensorValue1);
Serial.print(",");
sensorValue2 = analogRead(piezoPin2); // Read the value from the sensor
Serial.print(sensorValue2);
//Serial.print(",");
//sensorValue3 = analogRead(piezoPin3); // Read the value from the sensor
//Serial.print(sensorValue3);
//Serial.print(",");
//sensorValue4 = analogRead(piezoPin4); // Read the value from the sensor
//Serial.print(sensorValue4);
Serial.println();

//if (sensorValue >= threshold and sensorValue<200) { // If knock detected set brightness to max
//  digitalWrite(ledPin,HIGH);
//  Serial.println(sensorValue);
//  
//}
//else if (sensorValue>=200){
//  digitalWrite(ledPin2,HIGH);
//  Serial.println(sensorValue);
//}
//else{
//  digitalWrite(ledPin,LOW);
//  }
}
