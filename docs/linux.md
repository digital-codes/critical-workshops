# Installation on Linux


## m5burner

M5 provide a zip [download link for the beta version](https://m5stack.oss-cn-shenzhen.aliyuncs.com/resource/software/M5Burner-Beta-Linux.zip) in the [docs](https://docs.m5stack.com/#/en/uiflow/introduction_atom) with binaries. 
On the [official download page](https://m5stack.com/pages/download) there are links to stable versions. Download (71 MB) and unpack to a local dir

    wget https://m5stack.oss-cn-shenzhen.aliyuncs.com/resource/software/M5Burner-Beta-Linux.zip -O /tmp/M5Burner-Beta-Linux.zip
    mkdir -p $HOME/local/m5burner/
    unzip -d $HOME/local/m5burner/ /tmp/M5Burner-Beta-Linux.zip # beta

Here is an improved start script [m5burner.sh](./m5burner.sh) which works from any location and tries to find the binary, if necessary.
Copy it to a location in your $PATH variable.


# UIFlow-Desktop

The [official download page](https://m5stack.com/pages/download) lists a download for `UIFlow-Desktop-IDE`, which resembles the [flow.m5stack.com](https://flow.m5stack.com/) website for programming with blockly and python.

    wget https://static-cdn.m5stack.com/resource/software/UIFlow-Desktop-IDE_Linux.zip -O /tmp/UIFlow-Desktop-IDE_Linux.zip
    mkdir -p $HOME/local/m5uiflow/
    unzip -d $HOME/local/m5uiflow/ /tmp/UIFlow-Desktop-IDE_Linux.zip

    $HOME/local/m5uiflow/bin/uiflow-desktop-ide


## Burn an image to the device

In m5burner select an image and flash onto the connected device, here called *burn*. Serial should be given at *COM* and is likely `/dev/ttyUSB0`, if this is your only USB to serial device, or try the highest number.

### `UIFlow_Matrix` 


#### `UIFlow_Matrix-v1.7.2` 

This firmware version was iinitially a fail, please switch to an older one (or newer, if failing) or remove and re-download this firmware. 
Finally this version seems to work here, too.



```
 Start Burn 
 =================
$HOME/local/m5burner/packages/tools/esptool.py --chip esp32 --port /dev/ttyUSB0 --baud 750000 --before default_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0x1000 $HOME/local/m5burner/packages/fw/atom/UIFlow_Matrix-v1.7.2.bin
=================
esptool.py v2.5.0
Serial port /dev/ttyUSB0
Connecting...
.
.

Chip is ESP32-PICO-D4 (revision 1)
Features: WiFi, BT, Dual Core, 240MHz, Embedded Flash, VRef calibration in efuse
MAC: 24:a1:60:45:47:30
Uploading stub...
Running stub...
Stub running...
Changing baud rate to 750000
Changed.
Configuring flash size...
Auto-detected Flash size: 4MB
Compressed 63448 bytes to 15554...

Writing at 0x00001000... (100 %)

Wrote 63448 bytes (15554 compressed) at 0x00001000 in 0.3 seconds (effective 1895.1 kbit/s)...
Hash of data verified.

Leaving...
Hard resetting via RTS pin...

=================
 Burn Successfully 
=================
```

Boot messages and APIKEY can be seen in the *COM Monitor*:


```
ets Jun  8 2016 00:22:57

rst:0x1 (POWERON_RESET),boot:0x13 (SPI_FAST_FLASH_BOOT)
configsip: 188777542, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:1
load:0x3fff0018,len:4
load:0x3fff001c,len:5276
load:0x40078000,len:12872
load:0x40080400,len:3512
entry 0x4008063c

       _  __ _               
 _   _(_)/ _| | _____      __
| | | | | |_| |/ _ \ \ /\ / /
| |_| | |  _| | (_) \ V  V / 
 \__,_|_|_| |_|\___/ \_/\_/  

APIKEY: YOURAPIKEY
```

The device creates a Wifi which is named like `M5-YOURAPIKEY` and a webserver reachable after connecting to this via the IP/URL: [192.168.4.1](http://192.168.4.1/)
* configure your wifi password (technically the password is sent unencrypted via a POST request like `http://192.168.4.1/configure?ssid=YOURSSID&password=YOURWIFIPW`)
    * If you get the warning `×_× WiFi connection failed Click here return configure page.`, then try again (password wrong?)
    * success indicated by `^_^ WiFi connection success Reset device now ..`
        * reset and your device should can now connect to your network, indicated at startup by a red glow (*Wifi connecting*), followed by a blue one (*Wifi connection success*).
        <!-- * be reached via your network, look up the IP in your router, ESP-<ID>.fritz.box -->
    
:::alert
 TODO: how to connect? ui thing cannot find it
:::

<!-- 

working after retrying/redownload vof firmware
Unfortunately I got a reset loop on the device which can be seen in the *COM Monitor*:


```
rst:0x3 (SW_RESET),boot:0x13 (SPI_FAST_FLASH_BOOT)
configsip: 188777542, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:1
load:0x3fff0018,len:4
load:0x3fff001c,len:5276
load:0x40078000,len:12872
load:0x40080400,len:3512
entry 0x4008063c
[0;31mE (415) esp_image: invalid segment length 0x3d0020c0[0m
[0;31mE (415) boot: Factory app partition is not bootable[0m
[0;31mE (415) boot: No bootable app partitions in the partition table[0m
ets Jun  8 2016 00:22:57
```


### UIFlow_Matrix-v1.7.1 

Chose the older version v1.7.1, download it and *burn*.


```
=================
 Start Burn 
 =================
$HOME/local/m5burner/packages/tools/esptool.py --chip esp32 --port /dev/ttyUSB0 --baud 750000 --before default_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0x1000 $HOME/local/m5burner/packages/fw/atom/UIFlow_Matrix-v1.7.1.bin
=================

[...]

=================
 Burn Successfully 
=================
```

On the *COM Monitor* in m5burner you can see the `<ID>`  of your device:

```
rst:0x1 (POWERON_RESET),boot:0x13 (SPI_FAST_FLASH_BOOT)
configsip: 188777542, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:1
load:0x3fff0018,len:4
load:0x3fff001c,len:5276
load:0x40078000,len:12872
load:0x40080400,len:3512
entry 0x4008063c

       _  __ _               
 _   _(_)/ _| | _____      __
| | | | | |_| |/ _ \ \ /\ / /
| |_| | |  _| | (_) \ V  V / 
 \__,_|_|_| |_|\___/ \_/\_/  

APIKEY: YOURAPIKEY
```


#### `UIFlow_Matrix-v1.4.5.1-matrix`

In this version a Wifi AP is started, and the device can be reached via Wifi and the URL [192.168.4.1](http://192.168.4.1/)

```
rst:0x1 (POWERON_RESET),boot:0x13 (SPI_FAST_FLASH_BOOT)
[...]
WiFi AP WebServer Start!
Connect to Wifi SSID:M5Stack-4730
And connect to esp via your web browser (like 192.168.4.1)
listening on ('0.0.0.0', 80)
```


### `UIFlow_Lite`

`UIFlow_Lite` seems larger (takes longer to *burn*), but boots the device with a friendly reddish green. Pushing reset (at the side of the matrix device) reveals en APIKEY:

```
ets Jun  8 2016 00:22:57

rst:0x1 (POWERON_RESET),boot:0x13 (SPI_FAST_FLASH_BOOT)
configsip: 188777542, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:1
load:0x3fff0018,len:4
load:0x3fff001c,len:5276
load:0x40078000,len:12872
load:0x40080400,len:3512
entry 0x4008063c

       _  __ _               
 _   _(_)/ _| | _____      __
| | | | | |_| |/ _ \ \ /\ / /
| |_| | |  _| | (_) \ V  V / 
 \__,_|_|_| |_|\___/ \_/\_/  

APIKEY: YOURAPIKEY
```

The latter is good to know, take a note, it will be needed later for the UI and Wifi.

## Using the UI

A user interface (UI) can be reached via website or locally by starting the `uiflow-desktop-ide` (use full path on commandline or link it in a dir of `$PATH`).

    Upload code failed, maybe your device is offline check it and retry

-->
