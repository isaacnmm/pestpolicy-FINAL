---
date: '2025-07-10T00:00:00+00:00'
lastmod: '2025-07-10T00:00:00+03:00'
author: Isaac
layout: post
title: "How to Format Sd Card to Fat32"
categories:
- Raspberry Pi 3
slug: /how-to-format-sd-card-to-fat32/
description: Formatting the
tags: 
  - raspberry-pi-3
  - format
  - card
---
Formatting the
[Raspberry Pi 3 SD card](https://pestpolicy.com/best-sd-card-for-[raspberry-pi-3](/posts/best-sd-card-for-raspberry-pi-3/)/)
, particularly SDXC (64GB and above), to fat32 is usually the first step while using the tiny computing system for
**Pi 3 projects**
. Back up all the important data or files on your computer or on an external device.
- Previously, I was using DISKPART but now I have found better ways. But under what circumstances would you need to [format](/posts/format-sd-card-to-fat32/) the Raspberry Pi SD card?
(1) To increase storage capacity because of pre-partition (2) To remove a preloaded Operating System and install another one (3) To clean any corrupt software and files from the card.
Read Also:
Recliner for Tall People Reviewed
.
### 1. How to Format SD card FAT32 in Windows 10
First, maybe you already know that Windows with an inbuilt format utility. However, this format utility will not format any FAT32 (USB drive or SD card), which is usually bigger than 32GB.
Notably, if you need to format the FAT32 partition and right-click the SD card in windows on file system format, it only shows just the exFAT and NTFS options.

Maybe you love using the command line top covert the 32GB card to FAT32. But this is not possible for anything larger than 32Gb. It'll get to 90% and say it failed.
Therefore, for our formatting purpose today, well not be going to the windows inbuilt format utility.
**Step 1:**
Purchase a compatible Pi 3 SD card, specifically a Micro SD card.
Further, you may purchase a Raspberry Pi 3 starter kit, which comes with an SD card. Therefore, if the SD card size is larger than 32 GB continue to step 2 where we convert it to FAT32.
**Step 2:**
Format the SDXC Card (64 GB or larger) for Pi 3.
Note that SDFormatter will not format your SD card whose capacity is bigger than 32GB. Therefore, youll need to download other software such as the
[fat32format](http://www.ridgecrop.demon.co.uk/index.htm?guiformat.htm)
. Other options of the FAT32 Format tool, but not so easy to use, are
[EaseUS Partition](http://www.easeus.com/partition-manager/epm-free.html)
or�the
[MiniTool Partition Wizard](http://www.minitool.com/partition-manager/partition-wizard-home.html)
.
1. Download the FAT32 Format tool (guiformat.exe download) by ridgecrop consultants. Run the tool on your computer. Note, you'll not need to install anything!
2. Note that the GUI version of your downloaded FAT32 Format tool will be akin to the windows built-in format tool.
3. Run the downloaded formatter tool while the "FORMAT SIZE ADJUSTMENT" is adjusted to be "ON", to delete all the micro-SD card partitions.
4. Then, now you can pick the drive you wish to format (the letter for the SDXC Card) as shown on This PC and run the guiformat.exe tool (FAT32 Format). Ensure all other options are at the default and hit "Start".
5. However, FAT32 Format will not conduct disk integrity checks for your SDXC Card after formatting.
6. Therefore, after formatting the SD card, youll need to run this command*"chkdsk /R x:" in this case, youll replace the letter *"x:" with the name of the SD card drive. Or you can use the[SD Formatter](https://www.sdcard.org/downloads/formatter_4/)to make sure the partitions are totally deleted. Take some break, this process could take time to finish!
7. After you are done, you can now go ahead to thePi 3 Operating System Installation.
### **2. How**** to format SD card to fat32 on mac**
Unlike Windows, Mac OS X has inbuilt formatting tools to enable you to format your micro-SD / SD card to FAT32.
However, note that the SD card partition could be named MS-DOS or FAT.
So, who do you format the SD card to FAT32?
*Step by Step:*
1. Connect the SD card or the SD card adapter holding the SD card to the Mac computer
2. Click and open the Disk Utility.
3. Select the SD card storage on the left panel.
4. Click and alter it to the erase tab.
5. Go to the Volume Format and hit the erase option
6. Confirm the action by hitting Erase
7. After the formatting is completed, shut your Disk Utility.Read Also:Recliners for Sleeping
### 3. How to Format 128GB SD card FAT32
Equally, like the other SD cards with the exFAT32 partition format (any with a capacity over 32GB) the
**128GB**
SD card will not be formatted by the Disk Management and Diskpart utility in windows.
Therefore, youll only get errors such as these:
1. For Command Prompt  volume is too large for FAT32
2. For Disk Management  Windows is unable to complete drive format
Therefore, youll also need to use another software to format the 128GB SD card.
For Windows 10 and other Windows, you can download the
[Formatting Tool](http://www.ridgecrop.demon.co.uk/index.htm?guiformat.htm)
for the effective formatting of the 128GB SD card.
Step By Step:
Caution: As I have noted above, youll need to back up all the important files and data that are in the 128GB SD card you want to format.
1. Insert the 128GB SD card to the PC using the card reader (for the micro-SD card only).
2. Download, install and start the[Formatting Tool](http://www.ridgecrop.demon.co.uk/index.htm?guiformat.htm)
3. Check the Formatting Tools main windows and notice the SD card showing behind your current hard drive.
4. Click on the SD card (Right-click) and hit the format partition button
5. Check the appearing window and select the FAT32 partition and hit ok
6. Click Apply to format.
## Considerations buy Raspberry Pi 3 SD card
### **1. SD Class (Class 1 to Class 10)�**
Your cards class will affect the transfer speed and storage of data. For example, class 5 cards will only allow 5 MB/s.
- Further, you should note that the higher the class number implies that the SD card will perform better in your operation of raspberry pi3.
### **2. Micro SD storage capacity�**
Despite that you might only require only 4GB to install the Raspbian Lite image, other installations are different.
- To install Raspbian or NOOBs, your least SD card capacity for microSD should be 8GB.
- Raspberry Pi 1B+, 2B, and 3B comes with a microSDHC card slot and thus will only allow a maximum of 32GB size SD cards.
However, there are
**some**
SD cards that will function in the microSDXC cards slot which are larger than 32 GB. All SD cards larger than 32 GB will be formatted to the exFAT filesystem, as noted by the Raspberry Pi foundation, as opposed to the normal FAT32 filesystem.
## Conclusion
Raspberry Pi 3 Model B & Model B+ is only compatible with Micro SD cards.
- The SD card store data files and enable�Raspberry Pi3 Software�booting.
In addition, consider purchasing a��cooler and
[power supply](https://pestpolicy.com/best-power-supply-raspberry-pi-3/)
for the highest efficiency.
