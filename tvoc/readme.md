## Setup
The sensor setup requires 4 components plus cables. 
We aim to provide a small platform to mount the sensors onto. 
If this fails, our arrangement will look like below.

![](setup1.jpg)

### Microcontroller 
ESP32 based development kit [Atom Matrix](https://m5stack.com/products/atom-matrix-esp32-development-kit)

### TVOC Sensor
TVOC/eCO2 Gas Sensor Unit [SGP30](https://m5stack.com/products/tvoc-eco2-gas-unit-sgp30)

### Temperature Sensor
Temperature and barometric pressure [BMP280](https://m5stack.com/collections/m5-unit/products/barometric-pressure-unitbmp280)

### I2C Hub
To connect all of the above we need the [hub](https://wiki.seeedstudio.com/Grove-I2C_Hub/) 

### Cables
We need 3 cables to connect sensors and controller to the hub. The have different length but essentially the same function. 

We also need a USB canble to hook up the Atom to your computer

## Software
