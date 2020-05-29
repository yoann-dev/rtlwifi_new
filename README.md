rtlwifi_new_debian_10
===========
### A repo for the newest Realtek rtlwifi codes.

Fork from https://github.com/lwfinger/rtlwifi_new.git **ONLY extended branch here**.

This code will build on any kernel 4.2 and newer as long as the distro has not modified
any of the kernel APIs.

It includes the following drivers:

rtl8192ce, rtl8192cu, rtl8192se, rtl8192de, rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be, rtl8821ae,
and rtl8723de.

#### Installation instruction
You can find `<<YOUR WIRELESS DRIVER CODE>>` using `lspci | grep Wireless`.
  
You will need to install "make", "gcc", "kernel headers", "kernel build essentials", and "git".

If you are running Debian, then

```
sudo apt install linux-headers-$(uname -r) build-essential git
```

To build and install kernel, use the following script :

```
sudo ./install_wifi.sh <<YOUR WIRELESS DRIVER CODE>> 
```

You can add modprobe options to configure your driver, for example with rtl8723de card (option to
fix slow signal) :

```
sudo ./install_wifi.sh rtl8723de "options rtl8723de ant_sel=2"
```
And then shut down the computer completely and start it to make sure the driver is properly loaded.
