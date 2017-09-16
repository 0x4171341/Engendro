# Engendro
Box Open Source, aca  nos dedicaremos a escribir codigo, agregar scripts que en cualquier momento  esten funcionales para hacer arreglos de software  a telefonos Android 
para preparar nuestro entorno de desarrollo necesitaremos unas herramientas, aca les dejo unas indicaciones, estas las uso 
desde aur, porque soy user de #ArchLinux pero esta disponible para  todas las distros y sabores! 

##Arch Linux: add udev rule for android-tools

First install android-tools:

# pacman -Syu android-tools

Connect your Android device with a usb cable to your computer and run lsusb:

$ lsusb
Bus 001 Device 020: ID 0bb4:0f91 HTC (High Tech Computer Corp.)  

Create and edit /etc/udev/rules.d/99-android.rules using the idVendor:idProduct of the Android device from the previous output and set OWNER to your username:

SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", ATTR{idProduct}=="0f91", MODE="0640", OWNER="leedev"  

Reload udev to recognize your new rule:

# udevadm control --reload

adb, fastboot, and mkbootimg will now recognize your device.

