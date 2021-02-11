**Achtung: hier steckt noch sehr viel "Google Translate" drin!!!

## Aufbau
Das Sensor-Setup erfordert 4 Komponenten plus Kabel.
Vermutlich werden wir eine kleine Plattform für die Montage der Sensoren bereitstellen.
Falls das nicht geht, wird usner Aufbau etwas unorderntlicher sein, wie unten zu sehen. Es sollte jedoch gleich funktionieren.

! [] (setup1.jpg)

### Mikrocontroller
ESP32-basiertes Entwicklungskit [Atom Matrix] (https://m5stack.com/products/atom-matrix-esp32-development-kit)

### TVOC-Sensor
TVOC / eCO2-Gassensoreinheit [SGP30] (https://m5stack.com/products/tvoc-eco2-gas-unit-sgp30)

### Temperatursensor
Temperatur und Luftdruck [BMP280] (https://m5stack.com/collections/m5-unit/products/barometric-pressure-unitbmp280)

### I2C Hub
Um alles miteinander zu verbinden, benötigen wir den [Hub] (https://wiki.seeedstudio.com/Grove-I2C_Hub/).

### Kabel
Wir benötigen 3 Kabel, um Sensoren und Controller mit dem Hub zu verbinden. Sie haben unterschiedliche Länge, aber im Wesentlichen die gleiche Funktion.

Wir benötigen auch einen USB-Anschluss, um den Atom an Ihren Computer anzuschließen.

## Software
Wir müssen ein Programm schreiben, um dem Mikrocontroller (dem *atom*, erinnerst du dich?) zu sagen, wie er die Sensorwerte lesen und wie er uns die Ergebnisse anzeigen soll.

Um dies zu erreichen, benötigen wir einige Werkzeuge, wie unten gezeigt:

! [] (swarch.jpg)

Von links nach rechts gegen den Uhrzeigersinn:
 * Der Atom und die Sensoren
 * Ihr Computer, der mit einem USB-Kabel an den atom angeschlossen ist
   * Ihr Computer muss ein Programm namens *M5Burn* ausführen, das einige grundlegende Dinge mit dem Atom über das USB-Kabel erledigt.
   * Ihr Computer muss auf dem M5Stack-Server eine Webseite mit dem Namen [*M5Flow*] (https://flow.m5stack.com/) öffnen, auf der Sie das Programm für das Atom schreiben können. M5Flow stellt auch eine Verbindung zu Ihrem Atom her - nicht über USB, sondern direkt über das Internet. Dies ist der Grund, warum Ihr Atom auch eine Verbindung zum Internet herstellen muss. Sie müssen es also mit Ihren drahtlosen Anmeldeinformationen versehen. Dies geschieht mit M5Burn. **Klingt kompliziert?** Wir sind hier um zu helfen.
 * Der M5Stack-Server bietet Ihnen eine Liste aller Funktionen Ihres Sensorsystems und deren Verwendung. Es kümmert sich auch darum, **Ihr Programm** in ein für den Mikrocontroller geeignetes Format zu übersetzen: Computer lesen Zahlen, während Menschen Buchstaben und Wörter - oder Bilder - lesen.

Falls Sie noch nie ein Programm geschrieben haben: Haben Sie keine Angst! Auf unserer *einfachen Strecke* wird es einfacher als Sie vielleicht denken.

Falls Sie bereits mit Arduino oder ähnlichen Dingen vertraut sind: Ja, es gibt auch eine Überholspur. Wechseln Sie zum [Quick Intro] (# Quick Intro), nachdem Sie den Abschnitt [Downloads] (# Software-Downloads) überprüft haben.

### Ausführliche Einführung
... noch nicht geschrieben ...


### Kurze Einführung
... noch nicht geschrieben ...


### Software-Downloads
Die [Download-Seite] (https://m5stack.com/pages/download) von M5Stack bietet einige Programme für alle wichtigen Plattformen (Windows, MacOS und Linux):

! [] (m5downs.png)

Wir benötigen M5Burner. Bitte laden Sie die Version für Ihr Betriebssystem herunter und installieren Sie sie. Möglicherweise benötigen Sie auch den CP2104-Treiber (wahrscheinlich nicht unter Linux). Dies ist alles, was Sie brauchen, wenn Sie dem *einfachen Weg* folgen.

Die UIFlow-Desktop-IDE entspricht dem M5Stack-Server, sodass Sie die Entwicklungsumgebung direkt auf Ihrem Computer ausführen können. Bitte beachten Sie: Wir konnten diesen Ansatz noch nicht testen. Wenn Sie also nicht weiterkommen, können wir Ihnen möglicherweise nicht sofort helfen.

Arduino-IDE ist eine völlig andere Art von Werkzeug. Während das Atom in Bezug auf das physikalische Layout kein Arduino ist, ist es weitgehend softwarekompatibel. Die M5Stack-Bibliothek ermöglicht Ihrer Arduino-IDE den Zugriff auf alle Funktionen des Atoms und der Sensoren. Kein *Blockly* und kein *Python* - aber darüber haben wir noch nicht gesprochen.
