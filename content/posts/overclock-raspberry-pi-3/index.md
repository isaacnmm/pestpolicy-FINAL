---
date: '2025-07-10T00:00:00+00:00'
lastmod: '2025-07-10T00:00:00+03:00'
author: Isaac
layout: post
title: "Overclock Raspberry Pi 3"
categories:
- Laptops
slug: /overclock-raspberry-pi-3/
description: In this article, Ill teach you how to overclock your Raspberry pi 3  with
  the goal of improving its performance.
tags: 
  - laptops
  - overclock
  - raspberry
---
In this article, Ill teach you how to overclock your Raspberry pi 3  with the goal of improving its performance.

Despite that overclocking mainly happen on the software level, the changes will significantly affect the physical level too.
First, increasing the power of the Raspberry Pi 3 processor  through overclocking  may cause hazardous overheating of the Raspberry Pi and all the hardware components near it.�Notably, the temperatures reach highs of 100  C! Read Also:
USB Hub for iMac
.
## Why Overclock Raspberry Pi 3?
Despite Raspberry Pi 3 has an improved processor power, its still limited in some functions. For example, playing videos and games such as Minecraft require improved fluidity.
You can achieve the extra fluidity by overclocking the Raspberry Pi 3. Overclocking the Raspberry Pi 3 can help you boost its processor performance from the basic 1.2 GHz to about 1.5 GHz.
Read Also:
[Laptops for FL Studio](https://pestpolicy.com/best-laptops-for-fl-studio/)
## Requirements
Next, an increase in the processor power creates a demand on the power consumption for the system. This might be dangerous when the power supply of your Raspberry Pi is not adequately upgraded.
Therefore, for the above challenges, youll require to arm, yourself with the vital accessories to overclock safely:
1. A quality cooling system  this will help reduce the temperature rise that comes due to overclocking. Therefore, youll require a cooling system that included active cooling (fan) and passive cooling (heatsink).
2. A great microSD Card for your Raspberry Pi 3. Most definitely, 32GB of micro-SD storage will be adequate but you can check the
SD Card for Raspberry Pi 3
.
3. A great power supply  for this I advise that you take a 5v 3A power supply.
## **Modify the Raspberry Pi 3 configuration files.**
Lets dive right into the overclocking details.�For previous Raspberry Pi models, you only required to use the sudo raspi-config command. But now, youll have to modify the Raspberry Pi 3 configuration files.
1. First, well require modifying the /boot/config.txt files that hold different settings that are loading during Raspberry Pi startup. The settings mainly affect the processor use and Raspberry Pi behavior.
Therefore, begin a terminal window in the Raspberry Pi and input the command below:
sudo nano /boot/config.txt
The above command will launch the file named /boot/config.txt. Further, the command�sudo and the text editor�nano will request the system to undertake the function using the administrator account (�/boot/config.txt because this is a critical action.
1. With the file being open, ready for modification, now edit it so that you input the below-outlined lines:
*core_freq=500 # GPU Frequency*
*arm_freq=1300 # CPU Frequency*
*over_voltage=4 #Electric power sent to CPU / GPU (4 = 1.3V)*
*disable_splash=1 # Disables the display of the electric alert screen*
However, note that the above lines might already be available in different lines. In such a case, youll only need to ensure that the lines are not commented on (this means that the lines of code must not begin with one�#)
1. Next, save all the changes through this shortcut�Ctrl+o and finally exit from the file using this shortcut�Ctrl+x.
2. Finally, use the reboot command to restart your Raspberry Pi
Read Also:
[Laptop for Music Production](https://pestpolicy.com/best-laptop-for-music-production/)
## Test whether the overclock is enabled
To check, just run this command lscpu, and itll show the processor details. Therefore, if the CPU max MHz values are 1500, then youre on point  youve overclocked the Raspberry Pi 3!
## Overclocking Raspberry Pi 2 or older models
Like I had noted above, overclocking the Raspberry Pi 2 and easier models is much easier. Therefore, the modification will be a lot easier as youll utilize the GUI�raspi-config.
So, on the Raspberry Pi terminal, give the command below:
sudo raspi
*-config*
Then, select the Overclock option. Click ok on the pop up that will be outlining the dangers of such overclocking actions.
Next, select the overclock option that you like, such as the 1000MHz. Finally, click the ok option for a list of the changes youve made.
Finally, hit Finish and when prompted whether to restart your Raspberry Pi, click ok. And..thats all, you Raspberry Pi is now overclocked.
Read Also:
[Mac for Music Production](https://pestpolicy.com/best-mac-for-music-production/)
## Removing the overclocking?
So, to remove the Raspberry Pi overclocking, youll only require removing the changes you put above from the Raspberry Pi configuration file - /boot/config.txt.
However, if youd created a backup file, simply copy it to the /boot directory to fully overwrite your config.txt file.
Further, on the
*/etc/rc.local*
file  remember to remove the line named
*/usr/bin/zram.sh &*
.
Finally, reboot the Raspberry Pi to fully disable all the overclocking configurations.
Read Also:
[MacBook for Video Editing](https://pestpolicy.com/best-macbook-for-video-editing/)
## Conclusion
Weve just outlined how to overclock your Raspberry Pi 3  its time to enjoy the power boost! However, you may find detail on
[how else to configure the CPU usage](https://www.raspberrypi.org/documentation/configuration/config-txt.md)
.
