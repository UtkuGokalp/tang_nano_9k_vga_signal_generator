# VGA Signal Generator (Tang Nano 9K)
This is a project for generating a VGA signal (static image) with a resolution of 800x600 @ 60 Hz. The FPGA used is Tang Nano 9K from GOWIN Semiconductors.

 - Resolution: 800x600@60 Hz
 - Generated Image: 8 colored bars (in order: black, red, green, yellow, blue, magenta, cyan, white)
 - Current Draw: 35 mA
 - Voltage: 5V
 - Schematic is given below and is also in the project files

# Photos
Circuit and the image on a monitor
![](demo.jpg)

Display information from the monitor
![](resolution.jpg)

# Schematic
[View schematic](schematic.pdf)

# Using
 1. Clone the repository:
    ```
    git clone https://github.com/UtkuGokalp/fpga_vga_signal_generator.git
    ```
 2. Open the project in Gowin IDE:
    ```
    File -> Open -> Navigate to project directory -> vga_signal_generator.gprj
    ```
 3. Synthesize, Place & Route, Upload using default settings
    
