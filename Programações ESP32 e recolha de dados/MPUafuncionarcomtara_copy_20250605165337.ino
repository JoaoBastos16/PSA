#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>

Adafruit_MPU6050 mpu;

int b = 0;
 float ax1 = 0, ay1 = 0, az1 = 0;
void setup(void) {
  Serial.begin(115200);
pinMode(19,OUTPUT);
digitalWrite(19,HIGH);
  if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) delay(10);
  }

  mpu.setAccelerometerRange(MPU6050_RANGE_2_G);
  mpu.setGyroRange(MPU6050_RANGE_250_DEG);
  mpu.setFilterBandwidth(MPU6050_BAND_21_HZ);

  delay(100); 

}

void loop() {
  const int SAMPLES = 30;
  float ax = 0, ay = 0, az = 0;

  // recolhe várias amostras para fazer médias
  for (int i = 0; i < SAMPLES; i++) {
    sensors_event_t a, g, temp;
    mpu.getEvent(&a, &g, &temp);
    ax += a.acceleration.x;
    ay += a.acceleration.y;
    az += a.acceleration.z;
  if (b == 0) {
  ax1 = ax;
  ay1 = ay;
  az1 = az;
  b = b+1;
}
    delay(10); }

  // faz a media
  ax = (ax / SAMPLES) - ax1;
  ay = (ay / SAMPLES) - ay1;
  az = (az / SAMPLES) - az1;

  // formata os dados
  String data = String(ax, 2) + ";" +
                String(ay, 2) + ";" +
                String(az, 2);

  // Output the data
  Serial.println(data);

}
