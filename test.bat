gpio export 20 out
gpio export 21 out
gpio export 26 out

ls /sys/class/gpio/gpio20/value
cat /sys/class/gpio/gpio20/value

ls /sys/class/gpio/gpio21/value
cat /sys/class/gpio/gpio21/value

gpio export 26 out
ls /sys/class/gpio/gpio26/value
cat /sys/class/gpio/gpio26/value


gpio unexport 21 
gpio unexport 20 
gpio unexport 26 

ls /sys/bus/w1/devices/28-00000726f007/w1_slave
cat /sys/bus/w1/devices/28-00000726f007/w1_slave


