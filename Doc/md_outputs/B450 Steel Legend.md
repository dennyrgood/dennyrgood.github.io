# B450 Steel Legend

Extracted from PDF: B450 Steel Legend.pdf

---

Version 1.1
Published November 2020
Copyright©2020 ASRock INC. All rights reserved.

Copyright Notice:
No part of this documentation may be reproduced, transcribed, transmitted, or
translated in any language, in any form or by any means, except duplication of
documentation by the purchaser for backup purpose, without written consent of
ASRock Inc.
Products and corporate names appearing in this documentation may or may not
be registered trademarks or copyrights of their respective companies, and are used
only for identification or explanation and to the owners’ benefit, without intent to
infringe.

Disclaimer:
Specifications and information contained in this documentation are furnished for
informational use only and subject to change without notice, and should not be
constructed as a commitment by ASRock. ASRock assumes no responsibility for
any errors or omissions that may appear in this documentation.
With respect to the contents of this documentation, ASRock does not provide
warranty of any kind, either expressed or implied, including but not limited to
the implied warranties or conditions of merchantability or fitness for a particular
purpose.
In no event shall ASRock, its directors, officers, employees, or agents be liable for
any indirect, special, incidental, or consequential damages (including damages for
loss of profits, loss of business, loss of data, interruption of business and the like),
even if ASRock has been advised of the possibility of such damages arising from any
defect or error in the documentation or product.

This device complies with Part 15 of the FCC Rules. Operation is subject to the following
two conditions:
(1) this device may not cause harmful interference, and
(2) this device must accept any interference received, including interference that
may cause undesired operation.

CALIFORNIA, USA ONLY
The Lithium battery adopted on this motherboard contains Perchlorate, a toxic substance
controlled in Perchlorate Best Management Practices (BMP) regulations passed by the
California Legislature. When you discard the Lithium battery in California, USA, please
follow the related regulations in advance.
“Perchlorate Material-special handling may apply, see www.dtsc.ca.gov/hazardouswaste/
perchlorate”
ASRock Website: http://www.asrock.com

AUSTRALIA ONLY
Our goods come with guarantees that cannot be excluded under the Australian Consumer
Law. You are entitled to a replacement or refund for a major failure and compensation for
any other reasonably foreseeable loss or damage caused by our goods. You are also entitled
to have the goods repaired or replaced if the goods fail to be of acceptable quality and the
failure does not amount to a major failure. If you require assistance please call ASRock Tel
: +886-2-28965588 ext.123 (Standard International call charges apply)
The terms HDMI® and HDMI High-Definition Multimedia Interface, and the HDMI
logo are trademarks or registered trademarks of HDMI Licensing LLC in the United
States and other countries.

Contents
Chapter 1 Introduction

1

1.1

Package Contents

1

1.2

Specifications

2

1.3

Motherboard Layout

7

1.4

I/O Panel

9

Chapter 2 Installation

11

2.1

Installing the CPU

12

2.2

Installing the CPU Fan and Heatsink

14

2.3

Installing Memory Modules (DIMM)

22

2.4

Expansion Slots (PCI Express Slots)

26

2.5

Jumpers Setup

27

2.6

Onboard Headers and Connectors

28

2.7

CrossFireX TM and Quad CrossFireX TM Operation Guide

33

2.7.1

Installing Two CrossFireX TM-Ready Graphics Cards

33

2.7.2 Driver Installation and Setup

35

2.8

M.2_SSD (NGFF) Module Installation Guide (M2_1)

36

2.9

M.2_SSD (NGFF) Module Installation Guide (M2_2)

39

Chapter 3 Software and Utilities Operation

42

3.1

Installing Drivers

42

3.2

A-Tuning

43

3.2.1 Installing A-Tuning

43

3.2.2 Using A-Tuning

43

3.3

ASRock Live Update & APP Shop

46

3.3.1 UI Overview

46

3.3.2 Apps

47

3.3.3 BIOS & Drivers

50

3.3.4 Setting

51

3.4

ASRock Polychrome RGB

52

Chapter 4 UEFI SETUP UTILITY

55

4.1

Introduction

55

4.1.1

UEFI Menu Bar

55

4.1.2 Navigation Keys

56

4.2

Main Screen

57

4.3

OC Tweaker Screen

58

4.4

Advanced Screen

61

4.4.1 CPU Configuration

62

4.4.2 North Bridge Configuration

63

4.4.3 South Bridge Configuration

64

4.4.4 Storage Configuration

65

4.4.5 Super IO Configuration

66

4.4.6 ACPI Configuration

67

4.4.7 Trusted Computing

68

4.4.8 AMD CBS

69

4.4.9 AMD PBS

77

4.5

Tools

78

4.6

Hardware Health Event Monitoring Screen

80

4.7

Security Screen

83

4.8

Boot Screen

84

4.9

Exit Screen

86

B450 Steel Legend

Chapter 1 Introduction
Thank you for purchasing ASRock B450 Steel Legend motherboard, a reliable
motherboard produced under ASRock’s consistently stringent quality control.
It delivers excellent performance with robust design conforming to ASRock’s
commitment to quality and endurance.
In this manual, Chapter 1 and 2 contains the introduction of the motherboard
and step-by-step installation guides. Chapter 3 contains the operation guide of the
software and utilities. Chapter 4 contains the configuration guide of the BIOS setup.

Because the motherboard specifications and the BIOS software might be updated, the
content of this manual will be subject to change without notice. In case any modifications of this manual occur, the updated version will be available on ASRock’s website
without further notice. If you require technical support related to this motherboard,
please visit our website for specific information about the model you are using. You
may find the latest VGA cards and CPU support list on ASRock’s website as well.
ASRock website http://www.asrock.com.

1.1 Package Contents
ASRock B450 Steel Legend Motherboard (ATX Form Factor)
ASRock B450 Steel Legend Quick Installation Guide
ASRock B450 Steel Legend Support CD
1 x I/O Panel Shield
2 x Serial ATA (SATA) Data Cables (Optional)
2 x Screws for M.2 Sockets (Optional)
1 x Standoff for M.2 Socket (Optional)

English

•
•
•
•
•
•
•

1

1.2 Specifications

English
2

Platform

• ATX Form Factor

CPU

• AMD AM4 Socket
• Digi Power design
• 6 Power Phase design

Chipset

• AMD Promontory B450

Memory

• Dual Channel DDR4 Memory Technology
• 4 x DDR4 DIMM Slots
• AMD Ryzen series CPUs (Matisse) support DDR4
3200/2933/2667/2400/2133 ECC & non-ECC, un-buffered
memory*
• AMD Ryzen series CPUs (Pinnacle Ridge) support DDR4
3533+(OC)/3200(OC)/2933(OC)/2667/2400/2133 ECC & nonECC, un-buffered memory*
• AMD Ryzen series CPUs (Picasso) support DDR4
2933/2667/2400/2133 non-ECC, un-buffered memory*
• AMD Ryzen series CPUs (Summit Ridge) support DDR4
3466+(OC)/3200(OC)/2933(OC)/2667/2400/2133 ECC &
non-ECC, un-buffered memory*
• AMD Ryzen series CPUs (Raven Ridge) support DDR4
3466+(OC)/3200(OC)/2933/2667/2400/2133 non-ECC, unbuffered memory*
* For Ryzen Series CPUs (Picasso and Raven Ridge), ECC is only
supported with PRO CPUs.
* Please refer to Memory Support List on ASRock’s website for
more information. (http://www.asrock.com/)
* Please refer to page 22 for the table for AMD non-XMP memory frequency support. For more details, please refer to the QVL
on ASRock’s website.
• Max. capacity of system memory: 64GB
• Supports Extreme Memory Profile (XMP) memory modules
• 15μ Gold Contact in DIMM Slots

B450 Steel Legend

Expansion
Slot

AMD Ryzen series CPUs (Matisse, Summit Ridge and Pinnacle
Ridge)
• 2 x PCI Express 3.0 x16 Slots (PCIE1: x16 mode; PCIE4: x4
mode)*
AMD Ryzen series CPUs (Picasso, Raven Ridge)
• 2 x PCI Express 3.0 x16 Slots (PCIE1: x8 mode; PCIE4: x4
mode)*
AMD Athlon series CPUs
• 2 x PCI Express 3.0 x16 Slots (PCIE1: x4 mode; PCIE4: x2
mode)*
* Supports NVMe SSD as boot disks
* If M2_1 is occupied, PCIE4 will be disabled.
• 4 x PCI Express 2.0 x1 Slots
TM
TM
• Supports AMD Quad CrossFireX and CrossFireX **
** This feature is only supported with Ryzen Series CPUs
(Matisse, Summit Ridge, Pinnacle Ridge, Picasso and Raven
Ridge).
TM
• Integrated AMD Radeon Vega Series Graphics in Ryzen
Series APU*
* Actual support may vary by CPU
• DirectX 12, Pixel Shader 5.0
• Shared memory default 2GB. Max Shared memory supports
up to 16GB.
* The Max shared memory 16GB requires 32GB system memory
installed.
• Dual graphics output: Support HDMI and DisplayPort 1.2
ports by independent display controllers
• Supports HDMI 1.4 with max. resolution up to 4K x 2K
(4096x2160) @ 24Hz / (3840x2160) @ 30Hz
• Supports DisplayPort 1.2 with max. resolution up to 4K x 2K
(4096x2160) @ 60Hz
• Supports Auto Lip Sync, Deep Color (12bpc), xvYCC and
HBR (High Bit Rate Audio) with HDMI 1.4 Port (Compliant
HDMI monitor is required)
• Supports HDCP 1.4 with HDMI 1.4 and DisplayPort 1.2 Ports
• Supports 4K Ultra HD (UHD) playback with HDMI 1.4 and
DisplayPort 1.2 Ports

English

Graphics

3

Audio

• 7.1 CH HD Audio with Content Protection (Realtek
ALC892/897 Audio Codec)
•
•
•
•

Supports Surge Protection
PCB Isolate Shielding
Individual PCB Layers for R/L Audio Channel
Gold Audio Jacks

LAN

•
•
•
•
•
•

PCIE x1 Gigabit LAN 10/100/1000 Mb/s
Realtek RTL8111H
Supports Wake-On-LAN
Supports Lightning/ESD Protection
Supports Energy Efficient Ethernet 802.3az
Supports PXE

Rear Panel
I/O

1 x PS/2 Mouse/Keyboard Port
1 x HDMI Port
1 x DisplayPort 1.2
1 x Optical SPDIF Out Port
2 x USB 2.0 Ports (Supports ESD Protection)
1 x USB 3.2 Gen2 Type-A Port (10 Gb/s) (Supports ESD Protection)
• 1 x USB 3.2 Gen2 Type-C Port (10 Gb/s) (Supports ESD Protection)
• 4 x USB 3.2 Gen1 Ports (Supports ESD Protection)
* Ultra USB Power is supported on USB3_34 ports.
* ACPI wake-up function is not supported on USB3_34 ports.
• 1 x RJ-45 LAN Port with LED (ACT/LINK LED and SPEED
LED)
• HD Audio Jacks: Rear Speaker / Central / Bass / Line in /
Front Speaker / Microphone (Gold Audio Jacks)

Storage

• 4 x SATA3 6.0 Gb/s Connectors, support RAID (RAID 0,
RAID 1 and RAID 10), NCQ, AHCI and Hot Plug*
• 2 x SATA3 6.0 Gb/s Connectors by ASMedia ASM1061, support NCQ, AHCI and Hot Plug

•
•
•
•
•
•

English

* M2_2, SATA3_3 and SATA3_4 share lanes. If either one of
them is in use, the others will be disabled.

4

B450 Steel Legend

• 1 x Ultra M.2 Socket (M2_1), supports M Key type
2230/2242/2260/2280 M.2 PCI Express module up to Gen3 x4

Connector

• 1 x COM Port Header
• 1 x TPM Header
• 1 x Power LED and Speaker Header
• 1 x RGB LED Header
* Supports in total up to 12V/3A, 36W LED Strip
• 1 x Addressable LED Header
* Supports in total up to 5V/3A, 15W LED Strip
• 1 x AMD Fan LED Header
* The AMD Fan LED Header supports LED strips of maximum
load of 3A (36W) and length up to 2.5M.
• 1 x CPU Fan Connector (4-pin)
* The CPU Fan Connector supports the CPU fan of maximum
1A (12W) fan power.
• 1 x CPU/Water Pump Fan Connector (4-pin) (Smart Fan
Speed Control)
* The CPU/Water Pump Fan supports the water cooler fan of
maximum 2A (24W) fan power.
• 3 x Chassis/Water Pump Fan Connectors (4-pin) (Smart Fan
Speed Control)
* The Chassis/Water Pump Fan supports the water cooler fan of
maximum 2A (24W) fan power.
* CPU_FAN2/WP, CHA_FAN1/WP, CHA_FAN2/WP and
CHA_FAN3/WP can auto detect if 3-pin or 4-pin fan is in use.
• 1 x 24 pin ATX Power Connector
• 1 x 8 pin 12V Power Connector
• 1 x Front Panel Audio Connector
• 2 x USB 2.0 Headers (Support 4 USB 2.0 ports) (Supports ESD
Protection)
• 1 x USB 3.2 Gen1 Header (Supports 2 USB 3.2 Gen1 ports)
(Supports ESD Protection)

English

(32 Gb/s) (with Matisse, Picasso, Summit Ridge, Raven Ridge
and Pinnacle Ridge) or Gen3 x2 (16 Gb/s) (with Athlon series
APU)**
• 1 x M.2 Socket (M2_2), supports M Key type
2230/2242/2260/2280/22110 M.2 SATA3 6.0 Gb/s module and
M.2 PCI Express module up to Gen3 x2 (16 Gb/s) **
** If M2_1 is occupied, PCIE4 will be disabled.
** Supports NVMe SSD as boot disks
** Supports ASRock U.2 Kit

5

BIOS
Feature

•
•
•
•
•
•

AMI UEFI Legal BIOS with multilingual GUI support
Supports “Plug and Play”
ACPI 5.1 compliance wake up events
Supports jumperfree
SMBIOS 2.3 support
DRAM Voltage multi-adjustment

Hardware
Monitor

• Temperature Sensing: CPU, MB
• Fan Tachometer: CPU, CPU/Water Pump, Chassis/Water
Pump Fans
• Quiet Fan (Auto adjust chassis fan speed by CPU temperature): CPU, CPU/Water Pump, Chassis/Water Pump Fans
• Fan Multi-Speed Control: CPU, CPU/Water Pump, Chassis/
Water Pump Fans
• Voltage monitoring: +12V, +5V, +3.3V, Vcore

OS

• Microsoft® Windows® 10 64-bit

Certifications

• FCC, CE
• ErP/EuP ready (ErP/EuP ready power supply is required)

* For detailed product information, please visit our website: http://www.asrock.com

Please realize that there is a certain risk involved with overclocking, including adjusting the setting in the BIOS, applying Untied Overclocking Technology, or using thirdparty overclocking tools. Overclocking may affect your system’s stability, or even cause
damage to the components and devices of your system. It should be done at your own
risk and expense. We are not responsible for possible damage caused by overclocking.

English
6

B450 Steel Legend

English

1.3 Motherboard Layout

7

No. Description

English
8

1

ATX 12V Power Connector (ATX12V1)

2

2 x 288-pin DDR4 DIMM Slots (DDR4_A1, DDR4_B1)

3

AMD Fan LED Header (AMD_FAN_LED1)

4

2 x 288-pin DDR4 DIMM Slots (DDR4_A2, DDR4_B2)

5

CPU/Water Pump Fan Connector (CPU_FAN2/WP)

6

CPU Fan Connector (CPU_FAN1)

7

ATX Power Connector (ATXPWR1)

8

USB 3.2 Gen1 Header (USB3_5_6)

9

SATA3 Connector (SATA3_1)

10

SATA3 Connector (SATA3_2)

11

SATA3 Connector (SATA3_A1)

12

SATA3 Connector (SATA3_A2)

13

SATA3 Connector (SATA3_3)

14

SATA3 Connector (SATA3_4)

15

System Panel Header (PANEL1)

16

Power LED and Speaker Header (SPK_PLED1)

17

Chassis/Water Pump Fan Connector (CHA_FAN3/WP)

18

Chassis/Water Pump Fan Connector (CHA_FAN2/WP)

19

Clear CMOS Jumper (CLRCMOS2)

20

Addressable LED Header (ADDR_LED1)

21

USB 2.0 Header (USB_3_4)

22

USB 2.0 Header (USB_1_2)

23

COM Port Header (COM1)

24

RGB LED Header (RGB_LED1)

25

TPM Header (TPMS1)

26

Front Panel Audio Header (HD_AUDIO1)

27

Chassis/Water Pump Fan Connector (CHA_FAN1/WP)

B450 Steel Legend

1.4 I/O Panel
1

15

14

13

12

11

2

3
4

5
6

9

8

7

10
No. Description

1

USB 2.0 Ports (USB_56)

9

USB 3.2 Gen2 Type-A Port (USB31_TA_1)

2

LAN RJ-45 Port*

10

USB 3.2 Gen2 Type-C Port (USB31_TC_1)

3

Central / Bass (Orange)

11

USB 3.2 Gen1 Ports (USB3_12)

4

Rear Speaker (Black)

12

USB 3.2 Gen1 Ports (USB3_34)***

5

Line In (Light Blue)

13

HDMI Port

6

Front Speaker (Lime)**

14

DisplayPort 1.2

7

Microphone (Pink)

15

PS/2 Mouse/Keyboard Port

8

Optical SPDIF Out Port

English

No. Description

9

* There are two LEDs on each LAN port. Please refer to the table below for the LAN port LED indications.

ACT/LINK LED
SPEED LED

LAN Port

Activity / Link LED

Speed LED

Status

Description

Status

Description

Off
Blinking
On

No Link
Data Activity
Link

Off
Orange
Green

10Mbps connection
100Mbps connection
1Gbps connection

** If you use a 2-channel speaker, please connect the speaker’s plug into “Front Speaker Jack”. See the table below
for connection details in accordance with the type of speaker you use.

Audio Output
Channels

Front Speaker
(No. 6)

Rear Speaker
(No. 4)

Central / Bass
(No. 3)

Line In
(No. 5)

2
4
6
8

V
V
V
V

-V
V
V

--V
V

---V

*** Ultra USB Power is supported on USB3_34 ports. ACPI wake-up function is not supported on USB3_34 ports.

English
10

B450 Steel Legend

Chapter 2 Installation
This is an ATX form factor motherboard. Before you install the motherboard, study
the configuration of your chassis to ensure that the motherboard fits into it.

Pre-installation Precautions
Take note of the following precautions before you install motherboard components
or change any motherboard settings.

English

• Make sure to unplug the power cord before installing or removing the motherboard.
Failure to do so may cause physical injuries to you and damages to motherboard
components.
• In order to avoid damage from static electricity to the motherboard’s components,
NEVER place your motherboard directly on a carpet. Also remember to use a grounded
wrist strap or touch a safety grounded object before you handle the components.
• Hold components by the edges and do not touch the ICs.
• Whenever you uninstall any components, place them on a grounded anti-static pad or
in the bag that comes with the components.
• When placing screws to secure the motherboard to the chassis, please do not overtighten the screws! Doing so may damage the motherboard.

11

2.1 Installing the CPU

Unplug all power cables before installing the CPU.

1

2

English
12

B450 Steel Legend

English

3

13

2.2 Installing the CPU Fan and Heatsink
After you install the CPU into this motherboard, it is necessary to install a larger
heatsink and cooling fan to dissipate heat. You also need to spray thermal grease
between the CPU and the heatsink to improve heat dissipation. Make sure that the
CPU and the heatsink are securely fastened and in good contact with each other.

Please turn off the power or remove the power cord before changing a CPU or heatsink.

Installing the CPU Box Cooler SR1
1

2

English
14

B450 Steel Legend

3

4

CP
U_
FA
N1

English

4-pin FAN cable

15

Installing the AM4 Box Cooler SR2
1

2

English
16

B450 Steel Legend

English

3

17

4

CP

U_
FA
N

1

4-pin FAN cable

5

4-pin FAN cable

CP
U_
F

AN
1

RGB LED Cable

+12V

FAN
D_
AM

_L E

D1

English

*The diagrams shown here are for reference only. The headers might be in a different position on
your motherboard. Please refer to page 32 for the orientation of AMD Fan LED Header (AMD_
FAN_LED1).

18

B450 Steel Legend

Installing the AM4 Box Cooler SR3
1

English

2

19

3

4

English

20

B450 Steel Legend

5

CP

U_
FA
N1

4-pin FAN cable

US

B

USB 2.0 Header
Please note that this connector is the interface to the LED control board on the SR3, it requires the AMD
utility "SR3 Settings Software" to control the LED.
*The diagrams shown here are for reference only. The headers might be in a different position on your
motherboard. Please refer to page 29 for the orientation of USB Header.

21

English

CP

U_
FA
N1

6

2.3 Installing Memory Modules (DIMM)
This motherboard provides four 288-pin DDR4 (Double Data Rate 4) DIMM slots,
and supports Dual Channel Memory Technology.
1. For dual channel configuration, you always need to install identical (the same
brand, speed, size and chip-type) DDR4 DIMM pairs.
2. It is unable to activate Dual Channel Memory Technology with only one or three
memory module installed.
3. It is not allowed to install a DDR, DDR2 or DDR3 memory module into a DDR4
slot; otherwise, this motherboard and DIMM may be damaged.
4. We suggest that you install the memory modules on DDR4_A2 and DDR4_B2 for
Dual Channel Memory Technology.

AMD non-XMP Memory Frequency Support
Ryzen Series CPUs (Matisse):
UDIMM Memory Slot

English
22

A1

A2

B1

B2

Frequency
(Mhz)

-

SR

-

-

3200

-

DR

-

-

3200

-

SR

-

SR

3200

-

DR

-

DR

3200

SR

SR

SR

SR

2933

SR/DR

DR

SR/DR

DR

2667

SR/DR

SR/DR

SR/DR

SR/DR

2667

B450 Steel Legend

Ryzen Series CPUs (Pinnacle Ridge):
UDIMM Memory Slot
A1

A2

B1

B2

Frequency
(Mhz)

-

SR

-

-

2933

-

DR

-

-

2933

-

SR

-

SR

2933

-

DR

-

DR

2933

SR

SR

SR

SR

2933

SR/DR

DR

SR/DR

DR

2667

SR/DR

SR/DR

SR/DR

SR/DR

2133-2400

UDIMM Memory Slot
A1

A2

B1

B2

Frequency
(Mhz)

-

SR

-

-

2933

-

DR

-

-

2667

-

SR

-

SR

2667

-

DR

-

DR

2400

SR

SR

SR

SR

2133

SR/DR

DR

SR/DR

DR

1866

SR/DR

SR/DR

SR/DR

SR/DR

1866

English

Ryzen Series CPUs (Picasso):

23

Ryzen Series CPUs (Summit Ridge):
UDIMM Memory Slot
A1

A2

B1

B2

Frequency
(Mhz)

-

SR

-

-

2667

-

DR

-

-

2667

-

SR

-

SR

2667

-

DR

-

DR

2667

SR

SR

SR

SR

2667

SR/DR

DR

SR/DR

DR

2667

SR/DR

SR/DR

SR/DR

SR/DR

2133-2400

Ryzen Series CPUs (Raven Ridge):
UDIMM Memory Slot
A1

A2

B1

B2

Frequency
(Mhz)

-

SR

-

-

2933

-

DR

-

-

2667

-

SR

-

SR

2667

-

DR

-

DR

2667

SR

SR

SR

SR

2667

SR/DR

DR

SR/DR

DR

2667

SR/DR

SR/DR

SR/DR

SR/DR

2133-2400

SR: Single rank DIMM, 1Rx4 or 1Rx8 on DIMM module label
DR: Dual rank DIMM, 2Rx4 or 2Rx8 on DIMM module label

English
24

B450 Steel Legend

The DIMM only fits in one correct orientation. It will cause permanent damage to
the motherboard and the DIMM if you force the DIMM into the slot at incorrect
orientation.

1

2

English

3

25

2.4 Expansion Slots (PCI Express Slots)
There are 6 PCI Express slots on the motherboard.
Before installing an expansion card, please make sure that the power supply is
switched off or the power cord is unplugged. Please read the documentation of the
expansion card and make necessary hardware settings for the card before you start
the installation.

PCIe slots:
PCIE1 (PCIe 3.0 x16 slot) is used for PCI Express x16 lane width graphics cards.
PCIE2 (PCIe 2.0 x1 slot) is used for PCI Express x1 lane width cards.
PCIE3 (PCIe 2.0 x1 slot) is used for PCI Express x1 lane width cards.
PCIE4 (PCIe 3.0 x16 slot) is used for PCI Express x4 lane width graphics cards.
PCIE5 (PCIe 2.0 x1 slot) is used for PCI Express x1 lane width cards.
PCIE6 (PCIe 2.0 x1 slot) is used for PCI Express x1 lane width cards.
* If M2_1 is occupied, PCIE4 will be disabled.

PCIe Slot Configurations
PCIE1

PCIE4

Ryzen Series CPUs (Matisse)

x16

x4

Ryzen Series CPUs (Pinnacle Ridge)

x16

x4

Ryzen Series CPUs (Summit Ridge)

x16

x4

Ryzen Series CPUs (Picasso)

x8

x4

Ryzen Series CPUs (Raven Ridge)

x8

x4

Athlon series CPUs

x4

x2

English

For a better thermal environment, please connect a chassis fan to the motherboard’s
chassis fan connector (CHA_FAN1/WP, CHA_FAN2/WP or CHA_FAN3/WP) when
using multiple graphics cards.

26

B450 Steel Legend

2.5 Jumpers Setup
The illustration shows how jumpers are setup. When the jumper cap is placed on
the pins, the jumper is “Short”. If no jumper cap is placed on the pins, the jumper is
“Open”.

Clear CMOS Jumper
(CLRCMOS2)
(see p.7, No. 19)

2-pin Jumper

Short: Clear CMOS
Open: Default

CLRCMOS1 allows you to clear the data in CMOS. To clear and reset the system
parameters to default setup, please turn off the computer and unplug the power
cord from the power supply. After waiting for 15 seconds, use a jumper cap to
short the pins on CLRCMOS1 for 5 seconds. However, please do not clear the
CMOS right after you update the BIOS. If you need to clear the CMOS when you
just finish updating the BIOS, you must boot up the system first, and then shut it
down before you do the clear-CMOS action. Please be noted that the password,

English

date, time, and user default profile will be cleared only if the CMOS battery is
removed. Please remember to remove the jumper cap after clearing the CMOS.

27

2.6 Onboard Headers and Connectors
Onboard headers and connectors are NOT jumpers. Do NOT place jumper caps over
these headers and connectors. Placing jumper caps over the headers and connectors
will cause permanent damage to the motherboard.

System Panel Header
(9-pin PANEL1)
(see p.7, No. 15)

PLED+
PLEDPWRBTN#
GND

1
GND
RESET#
GND
HDLEDHDLED+

Connect the power
switch, reset switch and
system status indicator on
the chassis to this header
according to the pin
assignments below. Note
the positive and negative
pins before connecting
the cables.

PWRBTN (Power Switch):
Connect to the power switch on the chassis front panel. You may configure the way to
turn off your system using the power switch.
RESET (Reset Switch):
Connect to the reset switch on the chassis front panel. Press the reset switch to restart
the computer if the computer freezes and fails to perform a normal restart.
PLED (System Power LED):
Connect to the power status indicator on the chassis front panel. The LED is on when
the system is operating. The LED keeps blinking when the system is in S3 sleep state.
The LED is off when the system is in S4 sleep state or powered off (S5).
HDLED (Hard Drive Activity LED):
Connect to the hard drive activity LED on the chassis front panel. The LED is on when
the hard drive is reading or writing data.
The front panel design may differ by chassis. A front panel module mainly consists
of power switch, reset switch, power LED, hard drive activity LED, speaker and etc.
When connecting your chassis front panel module to this header, make sure the wire
assignments and the pin assignments are matched correctly.

English
28

B450 Steel Legend

Power LED and Speaker
Header
(7-pin SPK_PLED1)
(see p.7, No. 16)

SPEAKER
DUMMY
DUMMY
+5V

1

Please connect the
chassis power LED and
the chassis speaker to this
header.

USB 3.2 Gen1 Header
(19-pin USB3_5_6)
(see p.7 or 8, No. 8)

1

SATA3_4 SATA3_3

SATA3_A2
USB_PWR
PP+

These six SATA3
connectors support SATA
data cables for internal
storage devices with up to
6.0 Gb/s data transfer rate.
* M2_2, SATA3_3 and
SATA3_4 share lanes. If
either one of them is in
use, the others will be
disabled.

GND
DUMMY

There are two headers
on this motherboard.
Each USB 2.0 header can
support two ports.

GND
P+
PUSB_PWR

Vbus
Vbus

IntA_PB_SSRX-

IntA_PA_SSRX-

IntA_PB_SSRX+
GND

IntA_PA_SSRX+
GND

IntA_PB_SSTX-

IntA_PA_SSTX-

IntA_PB_SSTX+

IntA_PA_SSTX+

GND
IntA_PB_D-

GND
IntA_PA_D-

IntA_PB_D+

IntA_PA_D+

Dummy

There is one header on
this motherboard. Each
USB 3.2 Gen1 header can
support two ports.

English

USB 2.0 Headers
(9-pin USB_1_2)
(see p.7, No. 22)
(9-pin USB_3_4)
(see p.7, No. 21)

SATA3_A1

Serial ATA3 Connectors
Right Angle:
(SATA3_1:
see p.7, No. 9)
(SATA3_2:
see p.7, No. 10)
(SATA3_3:
see p.7, No. 13)
(SATA3_4:
see p.7, No. 14)
(SATA3_A1:
see p.7, No. 11)
(SATA3_A2:
see p.7, No. 12)

SATA3_2 SATA3_1

PLED+
PLED+
PLED-

1

29

Front Panel Audio Header
(9-pin HD_AUDIO1)
(see p.7, No. 26)

GND
PRESENCE#
MIC_RET
OUT_RET

This header is for
connecting audio devices
to the front audio panel.

1
OUT2_L
J_SENSE
OUT2_R
MIC2_R
MIC2_L

1. High Definition Audio supports Jack Sensing, but the panel wire on the chassis must
support HDA to function correctly. Please follow the instructions in our manual and
chassis manual to install your system.
2. If you use an AC’97 audio panel, please install it to the front panel audio header by
the steps below:
A. Connect Mic_IN (MIC) to MIC2_L.
B. Connect Audio_R (RIN) to OUT2_R and Audio_L (LIN) to OUT2_L.
C. Connect Ground (GND) to Ground (GND).
D. MIC_RET and OUT_RET are for the HD audio panel only. You don’t need to
connect them for the AC’97 audio panel.
E. To activate the front mic, go to the “FrontMic” Tab in the Realtek Control panel
and adjust “Recording Volume”.

Chassis/Water Pump Fan
Connectors
(4-pin CHA_FAN1/WP)
(see p.7, No. 27)
(4-pin CHA_FAN2/WP)
(see p.7, No. 18)
(4-pin CHA_FAN3/WP)
(see p.7, No. 17)
CPU Fan Connector
(4-pin CPU_FAN1)
(see p.7, No. 6)

English
30

GND
FAN_VOLTAGE_CONTROL
FAN_SPEED
FAN_SPEED_CONTROL

4 3 2 1

This motherboard
provides three 4-Pin water
cooling chassis fan
connectors. If you plan to
connect a 3-Pin chassis
water cooler fan, please
connect it to Pin 1-3.

FAN_SPEED_CONTROL
CHA_FAN_SPEED
FAN_VOLTAGE
GND

GND
FAN_VOLTAGE_CONTROL
FAN_SPEED
FAN_SPEED_CONTROL

This motherboard provides a 4-Pin CPU fan
(Quiet Fan) connector.
If you plan to connect a
3-Pin CPU fan, please
connect it to Pin 1-3.

B450 Steel Legend

CPU/Water Pump Fan
Connector
(4-pin CPU_FAN2/WP)
(see p.7, No. 5)

GND
FAN_VOLTAGE_CONTROL
FAN_SPEED
FAN_SPEED_CONTROL

ATX Power Connector
(24-pin ATXPWR1)
(see p.7, No. 7)

ATX 12V Power
Connector
(8-pin ATX12V1)
(see p.7, No. 1)

Serial Port Header
(9-pin COM1)
(see p.7, No. 23)

12

24

1

13

This motherboard
provides a 4-Pin water
cooling CPU fan
connector. If you plan
to connect a 3-Pin CPU
water cooler fan, please
connect it to Pin 1-3.
This motherboard provides a 24-pin ATX power
connector. To use a 20-pin
ATX power supply, please
plug it along Pin 1 and Pin
13.

8

5

4

1

This motherboard
provides a 8-pin ATX 12V
power connector. To use a
4-pin ATX power supply,
please plug it along Pin 1
and Pin 5.
This COM1 header
supports a serial port
module.

RRXD1
DDTR#1
DDSR#1
CCTS#1

1

GND

+3VSB

+3V

LAD3

LAD0

FRAME

PCIRST#

PCICLK

1

This connector supports
Trusted Platform Module
(TPM) system, which can
securely store keys, digital
certificates, passwords,
and data. A TPM system

English

S_PWRDWN#

SERIRQ#

GND

LAD2

GND

LAD1

SMB_CLK_MAIN

GND

TPM Header
(17-pin TPMS1)
(see p.7, No. 25)

SMB_DATA_MAIN

RRI#1
RRTS#1
GND
TTXD1
DDCD#1

also helps enhance
network security, protects
digital identities, and
ensures platform integrity.

31

AMD FAN LED Header
(4-pin AMD_FAN_
LED1)
(see p.7, No. 3)

RGB LED Header
(4-pin RGB_LED1)
(see p.7, No. 24)

Addressable LED Header
(3-pin ADDR_LED1)
(see p.7, No. 20)

English
32

1
12V G

R

B

1
12V G

R

B

1
GND
DO_ADDR
VOUT

AMD FAN LED Header is used
to connect RGB LED
extension cable that comes with
AMD heatsink. The cable
connection allows users to choose
from various LED lighting
effects.
Caution: Never install the FAN
LED cable in the wrong orientation; otherwise, the cable may
be damaged.
This header is used to connect
RGB LED extension cable which
allows users to choose from various LED lighting effects.
Caution: Never install the RGB
LED cable in the wrong orientation; otherwise, the cable may
be damaged.
*Please refer to page 52 for further instructions on this header.
This header is used to connect
Addressable LED extension cable
which allows users to choose
from various LED lighting
effects.
Caution: Never install the
Addressable LED cable in the
wrong orientation; otherwise,
the cable may be damaged.
*Please refer to page 53 for further instructions on this header.

B450 Steel Legend

2.7 CrossFireXTM and Quad CrossFireXTM Operation Guide
This motherboard supports CrossFireXTM and Quad CrossFireXTM that allows you
to install up to two identical PCI Express x16 graphics cards.
1. You should only use identical CrossFireXTM-ready graphics cards that are AMD
certified.
2. Make sure that your graphics card driver supports AMD CrossFireXTM technology.
Download the drivers from the AMD’s website: www.amd.com
3. Make sure that your power supply unit (PSU) can provide at least the minimum
power your system requires. It is recommended to use a AMD certified PSU. Please
refer to the AMD’s website for details.
4. If you pair a 12-pipe CrossFireXTM Edition card with a 16-pipe card, both cards will
operate as 12-pipe cards while in CrossFireXTM mode.
5. Different CrossFireXTM cards may require different methods to enable CrossFireXTM. Please refer to AMD graphics card manuals for detailed installation guide.

2.7.1 Installing Two CrossFireXTM-Ready Graphics Cards

Step 1
Insert one graphics card into PCIE1 slot
and the other graphics card to PCIE4 slot.
Make sure that the cards are properly
seated on the slots.

Step 2

refer to your graphics card vendor for
details.)

English

CrossFire Bridge

Connect two graphics cards by installing
a CrossFire Bridge on the CrossFire Bridge
Interconnects on the top of the graphics
cards. (The CrossFire Bridge is provided
with the graphics card you purchase, not
bundled with this motherboard. Please

33

Step 3
Connect a VGA/DVI/DP/HDMI cable
from the monitor to the corresponding
port on the graphics card installed to the
PCIE1 slot.

English
34

B450 Steel Legend

2.7.2 Driver Installation and Setup
Step 1
Power on your computer and boot into OS.
Step 2
Remove the AMD drivers if you have any VGA drivers installed in your system.

The Catalyst Uninstaller is an optional download. We recommend using this utility
to uninstall any previously installed Catalyst drivers prior to installation. Please
check AMD’s website for AMD driver updates.

Step 3
Install the required drivers and CATALYST Control Center then restart your
computer. Please check AMD’s website for details.
Step 4
Double-click the AMD Catalyst Control
Center icon in the Windows® system tray.
Step 5
In the left pane, click Performance and
then AMD CrossFireXTM . Then select
Enable AMD CrossFireX and click Apply.
Select the GPU number according to your
graphics card and click Apply.

English

AMD Catalyst Control Center

35

2.8 M.2_SSD (NGFF) Module Installation Guide (M2_1)
The M.2, also known as the Next Generation Form Factor (NGFF), is a small size and
versatile card edge connector that aims to replace mPCIe and mSATA. The Ultra M.2
Socket (M2_1) supports M Key type 2230/2242/2260/2280 M.2 PCI Express module up to
Gen3 x4 (32 Gb/s) (with Matisse, Picasso, Summit Ridge, Raven Ridge and Pinnacle Ridge)
or Gen3 x2 (16 Gb/s) (with Athlon series APU).
* If M2_1 is occupied, PCIE4 will be disabled.

Installing the M.2_SSD (NGFF) Module
Step 1
Prepare a M.2_SSD (NGFF) module
and the screw.

Step 2

4
3

Depending on the PCB type and
length of your M.2_SSD (NGFF)
module, find the corresponding nut
location to be used.

2

1

D

C

No.

English
36

B

A

1

2

3

4

Nut Location

A

B

C

D

PCB Length

3cm

4.2cm

6cm

8cm

Module Type

Type2230

Type 2242

Type2260

Type 2280

B450 Steel Legend

1

2

Step 3
Before installing a M.2 (NGFF) SSD
module, please loosen the screws to
remove the M.2 heatsink.

1

Step 4
Prepare the M.2 standoff that comes
with the package. Then hand tighten
the standoff into the desired nut
location on the motherboard. Align
and gently insert the M.2 (NGFF)
SSD module into the M.2 slot. Please
be aware that the M.2 (NGFF) SSD
module only fits in one orientation.

Step 5

D

NUT2

NUT1

English

E

Tighten the screw with a screwdriver
to secure the module into place.
Please do not overtighten the screw
as this might damage the module.

37

M.2_SSD (NGFF) Module Support List
Vendor
Intel
Intel
Intel
Kingston
SanDisk
Samsung

Interface
PCIe
PCIe
PCIe
PCIe
PCIe
PCIe

P/N
INTEL 6000P-SSDPEKKF256G7 (nvme)
INTEL 6000P-SSDPEKKF512G7 (nvme)
INTEL 600P-SSDPEKKW256G7-256GB (nvme)
Kingston SHPM2280P2 / 240G (Gen2 x4)
SanDisk-SD6PP4M-128G(Gen2 x2)
Samsung XP941-MZHPU512HCGL(Gen2x4)

For the latest updates of M.2_SSD (NFGG) module support list, please visit our website for
details: http://www.asrock.com

English
38

B450 Steel Legend

2.9 M.2_SSD (NGFF) Module Installation Guide (M2_2)
The M.2, also known as the Next Generation Form Factor (NGFF), is a small size and
versatile card edge connector that aims to replace mPCIe and mSATA. The M.2 Socket
(M2_2) supports M Key type 2230/2242/2260/2280/22110 M.2 SATA3 6.0 Gb/s module
and M.2 PCI Express module up to Gen3 x2 (16 Gb/s).
* M2_2, SATA3_3 and SATA3_4 share lanes. If either one of them is in use, the others will
be disabled.

Installing the M.2_SSD (NGFF) Module
Step 1
Prepare a M.2_SSD (NGFF) module
and the screw.

Step 2

5
4

Depending on the PCB type and
length of your M.2_SSD (NGFF)
module, find the corresponding nut
location to be used.

3

2
1

D

C

B

A

No.

1

2

3

4

5

Nut Location

A

B

C

D

E

PCB Length

3cm

4.2cm

6cm

8cm

11cm

Module Type

Type2230

Type 2242

Type2260

Type 2280

Type 22110

English

E

39

Step 3

E

D

C

Move the standoff based on the
module type and length.
The standoff is placed at the nut
location D by default. Skip Step 3
and 4 and go straight to Step 5 if you
are going to use the default nut.
Otherwise, release the standoff by
hand.

A

B

Step 4

E

D

C

Peel off the yellow protective film on
the nut to be used. Hand tighten the
standoff into the desired nut location
on the motherboard.

A

B

Step 5

English
40

E

D

C

B

A

E

D

C

B

A

Gently insert the M.2 (NGFF) SSD
module into the M.2 slot. Please
be aware that the M.2 (NGFF) SSD
module only fits in one orientation.

20o

B450 Steel Legend

Step 6

E

D

NUT2

NUT1

Tighten the screw with a screwdriver
to secure the module into place.
Please do not overtighten the screw
as this might damage the module.

M.2_SSD (NGFF) Module Support List
Vendor
SanDisk
Intel
Intel
Kingston
Samsung
ADATA
Crucial
ezlink
Intel
Kingston
Kingston
LITEON
PLEXTOR
PLEXTOR
SanDisk
SanDisk
SanDisk
Transcend
V-Color
V-Color
WD

Interface
PCIe
PCIe
PCIe
PCIe
PCIe
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA
SATA

P/N
SanDisk-SD6PP4M-128G( Gen2 x2)
INTEL 6000P-SSDPEKKF256G7 (nvme)
INTEL 6000P-SSDPEKKF512G7 (nvme)
Kingston SHPM2280P2 / 240G (Gen2 x4)
Samsung XP941-MZHPU512HCGL(Gen2x4)
ADATA - AXNS381E-128GM-B
Crucial-CT240M500SSD4-240GB
ezlink P51B-80-120GB
INTEL 540S-SSDSCKKW240H6-240GB
Kingston SM2280S3G2/120G - Win8.1
Kingston-RBU-SNS8400S3 / 180GD
LITEON LJH-256V2G-256GB (2260)
PLEXTOR PX-128M6G-2260-128GB
PLEXTOR PX-128M7VG-128GB
SanDisk X400-SD8SN8U-128G
Sandisk Z400s-SD8SNAT-128G-1122
SanDisk-SD6SN1M-128G
Transcend TS256GMTS800-256GB
V-Color 120G
V-Color 240G
WD GREEN WDS240G1G0B-00RC30

English

For the latest updates of M.2_SSD (NFGG) module support list, please visit our website
for details: http://www.asrock.com

41

Chapter 3 Software and Utilities Operation
3.1 Installing Drivers
The Support CD that comes with the motherboard contains necessary drivers and
useful utilities that enhance the motherboard’s features.

Running The Support CD
To begin using the support CD, insert the CD into your CD-ROM drive. The CD
automatically displays the Main Menu if “AUTORUN” is enabled in your computer.
If the Main Menu does not appear automatically, locate and double click on the file
“ASRSETUP.EXE” in the Support CD to display the menu.

Drivers Menu
The drivers compatible to your system will be auto-detected and listed on the
support CD driver page. Please click Install All or follow the order from top to
bottom to install those required drivers. Therefore, the drivers you install can work
properly.

Utilities Menu
The Utilities Menu shows the application software that the motherboard supports.
Click on a specific item then follow the installation wizard to install it.

English
42

B450 Steel Legend

3.2 A-Tuning
A-Tuning is ASRock’s multi purpose software suite with a new interface, more new
features and improved utilities.

3.2.1 Installing A-Tuning
A-Tuning can be downloaded from ASRock Live Update & APP Shop. After the
installation, you will find the icon “A-Tuning“ on your desktop. Double-click the “ATuning“
icon, A-Tuning main menu will pop up.

3.2.2 Using A-Tuning
There are five sections in A-Tuning main menu: Operation Mode, OC Tweaker,
System Info, FAN-Tastic Tuning and Settings.

Operation Mode

English

Choose an operation mode for your computer.

43

OC Tweaker
Configurations for overclocking the system.

System Info
View information about the system.
*The System Browser tab may not appear for certain models.

English
44

B450 Steel Legend

FAN-Tastic Tuning
Configure up to five different fan speeds using the graph. The fans will automatically shift
to the next speed level when the assigned temperature is met.

Settings

English

Configure ASRock A-Tuning. Click to select "Auto run at Windows Startup" if you
want A-Tuning to be launched when you start up the Windows operating system.

45

3.3 ASRock Live Update & APP Shop
The ASRock Live Update & APP Shop is an online store for purchasing and
downloading software applications for your ASRock computer. You can quickly and
easily install various apps and support utilities. With ASRock Live Update & APP
Shop, you can optimize your system and keep your motherboard up to date simply
with a few clicks.

Double-click
utility.

on your desktop to access ASRock Live Update & APP Shop

*You need to be connected to the Internet to download apps from the ASRock Live Update & APP Shop.

3.3.1 UI Overview
Category Panel

Hot News

Information Panel

Category Panel: The category panel contains several category tabs or buttons that
when selected the information panel below displays the relative information.
Information Panel: The information panel in the center displays data about the
currently selected category and allows users to perform job-related tasks.

English

Hot News: The hot news section displays the various latest news. Click on the image
to visit the website of the selected news and know more.

46

B450 Steel Legend

3.3.2 Apps
When the "Apps" tab is selected, you will see all the available apps on screen for you
to download.

Installing an App
Step 1
Find the app you want to install.

The most recommended app appears on the left side of the screen. The other various
apps are shown on the right. Please scroll up and down to see more apps listed.
You can check the price of the app and whether you have already intalled it or not.
- The red icon displays the price or "Free" if the app is free of charge.
- The green "Installed" icon means the app is installed on your computer.

Step 2

English

Click on the app icon to see more details about the selected app.

47

Step 3
If you want to install the app, click on the red icon

to start downloading.

Step 4
When installation completes, you can find the green "Installed" icon appears on the
upper right corner.

English

To uninstall it, simply click on the trash can icon
*The trash icon may not appear for certain apps.

48

.

B450 Steel Legend

Upgrading an App
You can only upgrade the apps you have already installed. When there is an
available new version for your app, you will find the mark of "New Version"
appears below the installed app icon.

Step 1
Click on the app icon to see more details.
Step 2
to start upgrading.

English

Click on the yellow icon

49

3.3.3 BIOS & Drivers
Installing BIOS or Drivers
When the "BIOS & Drivers" tab is selected, you will see a list of recommended or
critical updates for the BIOS or drivers. Please update them all soon.

Step 1
Please check the item information before update. Click on
Step 2
Click to select one or more items you want to update.
Step 3
Click Update to start the update process.

English
50

to see more details.

B450 Steel Legend

3.3.4 Setting

English

In the "Setting" page, you can change the language, select the server location, and
determine if you want to automatically run the ASRock Live Update & APP Shop
on Windows startup.

51

3.4 ASRock Polychrome RGB
ASRock Polychrome RGB is a lighting control utility specifically designed for unique individuals
with sophisticated tastes to build their own stylish colorful lighting system. Simply by connecting the LED strip, you can customize various lighting schemes and patterns, including Static,
Breathing, Strobe, Cycling, Music, Wave and more.

Connecting the LED Strip
Connect your RGB LED strips to the RGB LED Header (RGB_LED1) on the
motherboard.

1
12V

G

R

B

RGB_HEADER1
1
12V G

R

B

1. Never install the RGB LED cable in the wrong orientation; otherwise, the cable
may be damaged.
2. Before installing or removing your RGB LED cable, please power off your system
and unplug the power cord from the power supply. Failure to do so may cause damages to motherboard components.

1. Please note that the RGB LED strips do not come with the package.
2. The RGB LED header supports standard 5050 RGB LED strip (12V/G/R/B), with a
maximum power rating of 3A (12V) and length within 2 meters.

English
52

B450 Steel Legend

Connecting the Addressable RGB LED Strip
Connect your Addressable RGB LED strip to the Addressable LED Header (ADDR_LED1) on
the motherboard.

1

ADDR_LED1
1
GND
DO_ADDR
VOUT

1. Never install the RGB LED cable in the wrong orientation; otherwise, the cable
may be damaged.
2. Before installing or removing your RGB LED cable, please power off your system
and unplug the power cord from the power supply. Failure to do so may cause damages to motherboard components.

English

1. Please note that the RGB LED strips do not come with the package.
2. The RGB LED header supports WS2812B addressable RGB LED strip (5V/Data/
GND), with a maximum power rating of 3A (5V) and length within 2 meters.

53

ASRock Polychrome RGB Utility
Now you can adjust the RGB LED color through the ASRock Polychrome RGB utility.
Download this utility from the ASRock Live Update & APP Shop and start coloring your
PC style your way!

Drag the tab to customize your
preference.

Toggle on/off the
RGB LED switch

Sync RGB LED effects
for all LED regions of
the motherboard

English
54

Select a RGB LED light effect
from the drop-down menu.

B450 Steel Legend

Chapter 4 UEFI SETUP UTILITY
4.1 Introduction
This section explains how to use the UEFI SETUP UTILITY to configure your
system. You may run the UEFI SETUP UTILITY by pressing <F2> or <Del> right
after you power on the computer, otherwise, the Power-On-Self-Test (POST) will
continue with its test routines. If you wish to enter the UEFI SETUP UTILITY after
POST, restart the system by pressing <Ctl> + <Alt> + <Delete>, or by pressing the
reset button on the system chassis. You may also restart by turning the system off
and then back on.

Because the UEFI software is constantly being updated, the following UEFI setup
screens and descriptions are for reference purpose only, and they may not exactly
match what you see on your screen.

4.1.1 UEFI Menu Bar
Main

For setting system time/date information

OC Tweaker

For overclocking configurations

Advanced

For advanced system configurations

Tool

Useful tools

H/W Monitor

Displays current hardware status

Security

For security settings

Boot

For configuring boot settings and boot priority

Exit

Exit the current screen or the UEFI Setup Utility

English

The top of the screen has a menu bar with the following selections:

55

4.1.2 Navigation Keys
Use <

> key or <

> key to choose among the selections on the menu bar, and

use < > key or < > key to move the cursor up or down to select items, then
press <Enter> to get into the sub screen. You can also use the mouse to click your
required item.
Please check the following table for the descriptions of each navigation key.
Navigation Key(s)

English
56

Description

+ / -

To change option for the selected items

<Tab>

Switch to next function

<PGUP>

Go to the previous page

<PGDN>

Go to the next page

<HOME>

Go to the top of the screen

<END>

Go to the bottom of the screen

<F1>

To display the General Help Screen

<F7>

Discard changes and exit the SETUP UTILITY

<F9>

Load optimal default values for all the settings

<F10>

Save changes and exit the SETUP UTILITY

<F12>

Print screen

<ESC>

Jump to the Exit Screen or exit the current screen

B450 Steel Legend

4.2 Main Screen
When you enter the UEFI SETUP UTILITY, the Main screen will appear and

English

display the system overview.

57

4.3 OC Tweaker Screen
In the OC Tweaker screen, you can set up overclocking features.

Because the UEFI software is constantly being updated, the following UEFI setup
screens and descriptions are for reference purpose only, and they may not exactly
match what you see on your screen.

CPU Configuration
OC Mode Change Switch
Select a setting for OC Mode.

Overclock Mode
Select the overclock mode.

CPU Frequency and Voltage Change
If this item is set to [Manual], the multiplier and voltage will be set based on user selection.

English

Final result is depending on the CPU's capability.

SMT Mode
This item can be used to disable symmetric multithreading. To re-enable SMT, a
power cycle is needed after selecting [Auto].

58

Warning: S3 is not supported on systems where SMT is disabled.

B450 Steel Legend

DRAM Timing Configuration
DRAM Frequency
If [Auto] is selected, the motherboard will detect the memory module(s) inserted
and assign the appropriate frequency automatically.

AM4 Advance Boot Training
Set TR4 Advance boot training to [Auto] to increase compatibility.

Voltage Configuration
CPU Core Voltage
Configure the voltage for the CPU Core.

CPU Load-Line Calibration
CPU Load-Line Calibration helps prevent CPU voltage droop when the system is
under heavy loading.

VDDCR_SOC Voltage
Configure the voltage for the VDDCR_SOC.

VDDCR_SOC Load-Line Calibration
VDDCR_SOC Load-Line Calibration helps prevent integrated GPU voltage droop
when the system is under heavy load.

VPPM
Configure the voltage for the VPPM.

2.50V Voltage
Use this to select 2.50V Voltage. The default value is [Auto].

DRAM Voltage
Use this to select DRAM Voltage. The default value is [Auto].

+1.8 Voltage
Use this to select +1.8 Voltage. The default value is [Auto].

English

VDDP
Configure the voltage for the VDDP.

59

Chipset 1.05V Voltage
Use this to select 1.05V Voltage. The default value is [Auto].

Save User Default
Type a profile name and press enter to save your settings as user default.

Load User Default
Load previously saved user defaults.

Save User UEFI Setup Profile to Disk
It helps you to save current UEFI settings as an user profile to disk.

Load User UEFI Setup Profile from Disk
You can load previous saved profile from the disk.

English
60

B450 Steel Legend

4.4 Advanced Screen
In this section, you may set the configurations for the following items: CPU
Configuration, North Bridge Configuration, South Bridge Configuration, StorageConfiguration, Super IO Configuration, ACPI Configuration, Trusted Computing ,
AMD CBS and AMD PBS.

Setting wrong values in this section may cause the system to malfunction.

UEFI Configuration
Active Page on Entry
Select the default page when entering the UEFI setup utility.

Full HD UEFI

English

When [Auto] is selected, the resolution will be set to 1920 x 1080 if the monitor
supports Full HD resolution. If the monitor does not support Full HD resolution,
then the resolution will be set to 1024 x 768. When [Disable] is selected, the
resolution will be set to 1024 x 768 directly.

61

4.4.1 CPU Configuration

Cool 'n' Quiet
Use this item to enable or disable AMD’s Cool ‘n’ QuietTM technology. The default value is
[Enabled]. Configuration options: [Enabled] and [Disabled]. If you install Windows® OS and
want to enable this function, please set this item to [Enabled]. Please note that enabling this
function may reduce CPU voltage and memory frequency, and lead to system stability or
compatibility issue with some memory modules or power supplies. Please set this item to
[Disable] if above issue occurs.

AMD fTPM Switch
Use this to enable or disable AMD CPU fTPM.

SVM Mode
When this option is set to [Enabled], a VMM (Virtual Machine Architecture) can
utilize the additional hardware capabilities provided by AMD-V. The default value is
[Enabled]. Configuration options: [Enabled] and [Disabled].

English
62

B450 Steel Legend

4.4.2 North Bridge Configuration

SR-IOV Support

English

Enable/disable the SR-IOV (Single Root IO Virtualization Support) if the system
has SR-IOV capable PCIe devices.

63

4.4.3 South Bridge Configuration

Onboard HD Audio
Enable/disable onboard HD audio. Set to Auto to enable onboard HD audio and
automatically disable it when a sound card is installed.

Front Panel
Enable/disable front panel HD audio.

Deep Sleep
Configure deep sleep mode for power saving when the computer is shut down.

Restore on AC/Power Loss
Select the power state after a power failure. If [Power Off] is selected, the power will
remain off when the power recovers. If [Power On] is selected, the system will start
to boot up when the power recovers.

English
64

B450 Steel Legend

4.4.4 Storage Configuration

SATA Controller(s)
Enable/disable the SATA controllers.

SATA Mode
AHCI: Supports new features that improve performance.
RAID: Combine multiple disk drives into a logical unit.

SATA Hot Plug

English

Enable/disable the SATA Hot Plug function.

65

4.4.5 Super IO Configuration

Serial Port
Enable or disable the Serial port.

Serial Port Address
Select the address of the Serial port.

PS2 Y-Cable
Enable the PS2 Y-Cable or set this option to Auto.

English
66

B450 Steel Legend

4.4.6 ACPI Configuration

Suspend to RAM
It is recommended to select auto for ACPI S3 power saving.

ACPI HPET Table
Enable the High Precision Event Timer for better performance and to pass WHQL
tests.

PS/2 Keyboard Power On
Allow the system to be waked up by a PS/2 Keyboard.

PCIE Devices Power On
Allow the system to be waked up by a PCIE device and enable wake on LAN.

RTC Alarm Power On
Allow the system to be waked up by the real time clock alarm. Set it to By OS to let

English

it be handled by your operating system.

67

4.4.7 Trusted Computing

Security Device Support
Enable to activate Trusted Platform Module (TPM) security for your hard disk
drives.

English
68

B450 Steel Legend

4.4.8 AMD CBS

Zen Common Options
RedirectForReturnDis
From a workaround for GCC/C000005 issue for XV Core on CZ A0, setting MSRC001_1029
Decode Configuration (DE_CFG) bit 14 [DecfgNoRdrctForReturns] to 1.

L2 TLB Associativity
0 - L2 TLB ways [11:8] are fully associative. 1 - =L2 TLB ways [11:8] are 4K-only.

Platform first Error Handling
Enable/disable PFEH, cloak individual banks, and mask deferred error interrupts from each
bank.

Core Performance Boost
Disable CPB.

Enable IBS
English

Enables IBS through MSRC001_1005[42] and disables SpecLockMap through
MSRC001_1020[54].

Global C-state Control
Controls IO based C-state generation and DF C-states.

69

Opcache Control
Enables or disables the Opcache.

OC Mode
OC1 - 16 cores/3.6GHz on 1.3375V
OC2 - 8 cores/3.7GHz on 1.369V
OC3 - 4 cores/3.75GHz on 1.374V\nMax Stress - 16 cores/3.8GHz on 1.400V

SEV-ES ASID Space Limit
SEV VMs using ASIDs below the SEV-ES ASID Space Limit must enable the SEV-ES feature.
The valid values for this field are from 0x1 (1) - 0x10 (16).

Core/Thread Enablement
Downcore control
Sets the number of cores to be used. Once this option has been used to remove any cores, a
POWER CYCLE is required in order for future selections to take effect.

SMTEN
This item can be used to disable symmetric multithreading. To re-enable SMT, a POWER
CYCLE is needed after selecting the 'Auto' option.
Warning: S3 is NOT SUPPORTED on systems where SMT is disabled.

Streaming Stores Control
Enables or disables the streaming stores functionality.

DF Common Options
DRAM scrub time
Provide a value that is the number of hours to scrub memory.

Redirect scrubber control
Control DF::RedirScrubCtrl[EnRedirScrub]

Disable DF sync flood propagation
English

Control DF::PIEConfig[DisSyncFloodProp].

Freeze DF module queues on error
Controls DF::PIEConfig[DisImmSyncFloodOnFatalError]
Disabling this option sets DF:PIEConfig[DisImmSyncFloodOnFatalError].

70

B450 Steel Legend

GMI encryption control
GMI encryption control

Control GMI link encryption
xGMI encryption control

Control xGMI link encryption
CC6 memory region encryption
Control whether or not the CC6 save/restore memory is encrypted

Location of private memory regions
Controls whether or not the private memory regions (PSP, SMU and CC6) are at the top of
DRAM or distributed. Note that distributed requires memory on all dies. Note that it will
always be at the top of DRAM if some dies don't have memory regardless of this option's
setting.

System probe filter
Controls whether or not the probe filter is enabled. Has no effect on parts where the probe
filter is fuse disabled.

Memory interleaving
Controls fabric level memory interleaving (AUTO, none, channel, die, socket). Note that
channel, die, and socket has requirements on memory populations and it will be ignored if
the memory doesn't support the selected option.

Memory interleaving size
Controls the memory interleaving size. The valid values are AUTO, 256 bytes, 512 bytes, 1
Kbytes or 2Kbytes. This determines the starting address of the interleave (bit 8, 9, 10 or 11).

Channel interleaving hash
Controls whether or not the address bits are hashed during channel interleave mode. This
field should not be used unless the interleaving is set to channel and the interleaving size is
256 or 512 bytes.

English

Memory Clear
When this feature is disabled, BIOS does not implement MemClear after memory training
(only if non-ECC DIMMs are used).

71

UMC Common Options
DDR4 Common Options
DRAM Controller Configuration
DRAM Controller Configuration

DRAM Power Options
Cmd2T
Select between 1T and 2T mode on ADDR/CMD

Gear Down Mode
Configure the Gear Down Mode.

CAD Bus Configuration
CAD Bus Timing User Controls
Setup time on CAD bus signals to Auto or Manual

CAD Bus Drive Strength User Controls
Drive Strength on CAD bus signals to Auto or Manual

Data Bus Configuration
Data Bus Configuration User Controls
Specify the mode for drive strength to Auto or Manual

Common RAS
Data Poisoning
Enable/disable data poisoning: UMC_CH::EccCtrl[UcFatalEn] UMC_
CH::EccCtrl[WrEccEn]
Should be enabled/disabled together.

Security
TSME
English

Transparent SME: AddrTweakEn = 1; ForceEncrEn =1; DataEncrEn = 0

Data Scramble
Data scrambling: DataScrambleEn

72

B450 Steel Legend

DRAM Memory Mapping
Chipselect Interleaving
Interleave memory blocks across the DRAM chip selects for node 0.

BankGroupSwap
Configure the BankGroupSwap.

BankGroupSwapAlt
Configure BankGroupSwapAlt.

Address Hash Bank
Configure the bank address hashing.

Address Hash CS
Configure the CS address hashing.

NVDIMM
Memory MBIST
MBIST Enable
Configure the Memory MBIST.

MBIST SubType Test
Select MBIST Subtest - Single Chipselect, Multi Chipselect, Address Line Test or execute
All test

MBIST Aggressors
Enable or disable MBIST Aggressor test.

MBIST Per Bit Slave Die Reporting
Enable or disable MBIST per bit slave die result report.

NBIO Common Options
English

NB Configuration
IOMMU
Use this to enable or disable IOMMU. The default value of this feature is [Disabled].

73

Determinism Slider
[Auto]
Use default performance determinism settings

cTDP Control
[Auto]
Use the fused cTDP.
[Manual]
User can set customized cTDP.

Fan Control
[Auto]
Use the default fan controller settings.
[Manual]
User can set customized fan controller settings.

PSI
Disable PSI.

ACS Enable
Enable ACS.

PCIe ARI Support
Enables Alternative Routing-ID Interpretation
CLDO_VDDP Control
[Manual]
If this option is selected, user can set customized CLDO_VDDP voltage.

HD Audio Enable
English

Enable HD Audio.

FCH Common Options
SATA Configuration Options
74

B450 Steel Legend

SATA Controller
Disable or enable OnChip SATA controller

Sata RAS Support
Disable or enable Sata RAS Support

Sata Disabled AHCI Prefetch Function
Configure the Sata Disabled AHCI Prefetch function.

Aggresive SATA Device Sleep Port 0
Configure the Aggresive SATA Device Sleep Port 0.

Aggresive SATA Device Sleep Port 1
Configure the Aggresive SATA Device Sleep Port 1.

USB Configuration Options
XHCI controller enable
Configure the USB3 controller.

SD (Secure Digital) Options
SD Configuration Mode
Select SD Mode.

Ac Power Loss Options
Select Ac Loss Control Method.

I2C Configuration Options
Uart Configuration Options
ESPI Configuration Options
XGBE Configuration Options
eMMC Options
English

NTB Common Options
DRAM Memory Mapping

75

Chipselect Interleaving
Interleave memory blocks across the DRAM chip selects for node 0.

BankGroupSwap
Configure the BankGroupSwap.

BankGroupSwapAlt
Configure the BankGroupSwapAlt.

Address Hash Bank
Configure the bank address hashing.

Address Hash CS
Configure the CS address hashing.

NVDIMM
Memory MBIST
MBIST Enable
Configure the Memory MBIST.

MBIST SubType Test
Select MBIST Subtest - Single Chipselect, Multi Chipselect, Address Line Test or execute
all test.

MBIST Aggressors
Configure the MBIST Aggressor test.

MBIST Per Bit Slave Die Reporting
Configure the MBIST per bit slave die result report.

English
76

B450 Steel Legend

4.4.9 AMD PBS

English

The AMD PBS menu accesses AMD specific features.

77

4.5 Tools

RGB LED
ASRock Polychrome RGB allows you to adjust the RGB LED color to your liking.

Easy RAID Installer
Easy RAID Installer helps you to copy the RAID driver from the support CD to
your USB storage device. After copying the drivers please change the SATA mode to
RAID, then you can start installing the operating system in RAID mode.

Easy Driver Installer
For users that don’t have an optical disk drive to install the drivers from our support
CD, Easy Driver Installer is a handy tool in the UEFI that installs the LAN driver
to your system via an USB storage device, then downloads and installs the other
required drivers automatically.

SSD Secure Erase Tool
Use this tool to securely erase SSD.

English
78

B450 Steel Legend

Instant Flash
Save UEFI files in your USB storage device and run Instant Flash to update your
UEFI.

Internet Flash - DHCP (Auto IP), Auto
ASRock Internet Flash downloads and updates the latest UEFI firmware version
from our servers for you. Please setup network configuration before using Internet
Flash.
*For BIOS backup and recovery purpose, it is recommended to plug in your USB
pen drive before using this function.

Network Configuration
Use this to configure internet connection settings for Internet Flash.

Internet Setting
Enable or disable sound effects in the setup utility.

UEFI Download Server

English

Select a server to download the UEFI firmware.

79

4.6 Hardware Health Event Monitoring Screen
This section allows you to monitor the status of the hardware on your system,
including the parameters of the CPU temperature, motherboard temperature, fan
speed and voltage.

Fan Tuning
Measure Fan Min Duty Cycle.

Fan-Tastic Tuning
Select a fan mode for CPU Fan 1, or choose Customize to set 5 CPU temperatures and
assign a respective fan speed for each temperature.

CPU_FAN1 Setting
Select a fan mode for CPU Fan 1, or choose Customize to set 5 CPU temperatures
and assign a respective fan speed for each temperature.

CPU_FAN1 Temp Source
Select a fan temperature source for CPU Fan 1.

English

CPU_FAN2/WP Switch
Select CPU Water Pump mode.

CPU Fan 2 Control Mode
Select PWM mode or DC mode for CPU fan 2.

80

B450 Steel Legend

CPU Fan 2 Setting
Select a fan mode for CPU Fan 2, or choose Customize to set 5 CPU temperatures
and assign a respective fan speed for each temperature.

CPU Fan 2 Temp Source
Select a fan temperature source for CPU Fan 2.

CHA_FAN1/WP Switch
Select Chassis Fan 1 or Water Pump mode.

Chassis Fan 1 Control Mode
Select PWM mode or DC mode for Chassis Fan 1.

Chassis Fan 1 Setting
Select a fan mode for Chassis Fan 1, or choose Customize to set 5 CPU temperatures
and assign a respective fan speed for each temperature.

Chassis Fan 1 Temp Source
Select a fan temperature source for Chassis Fan 1.

CHA_FAN2/WP Switch
Select Chassis Fan 2 or Water Pump mode.

Chassis Fan 2 Control Mode
Select PWM mode or DC mode for Chassis Fan 2.

Chassis Fan 2 Setting
Select a fan mode for Chassis Fan 2, or choose Customize to set 5 CPU temperatures
and assign a respective fan speed for each temperature.

Chassis Fan 2 Temp Source
Select a fan temperature source for Chassis Fan 2.

CHA_FAN3/WP Switch
English

Select Chassis Fan 3 or Water Pump mode.

Chassis Fan 3 Control Mode
Select PWM mode or DC mode for Chassis Fan 3.

81

Chassis Fan 3 Setting
Select a fan mode for Chassis Fan 3, or choose Customize to set 5 CPU temperatures
and assign a respective fan speed for each temperature.

Chassis Fan 3 Temp Source
Select a fan temperature source for Chassis Fan 3.

Over Temperature Protection
When Over Temperature Protection is enabled, the system automatically shuts
down when the motherboard is overheated.

English
82

B450 Steel Legend

4.7 Security Screen
In this section you may set or change the supervisor/user password for the system.
You may also clear the user password.

Supervisor Password
Set or change the password for the administrator account. Only the administrator
has authority to change the settings in the UEFI Setup Utility. Leave it blank and
press enter to remove the password.

User Password
Set or change the password for the user account. Users are unable to change the
settings in the UEFI Setup Utility. Leave it blank and press enter to remove the
password.

Secure Boot

English

Enable to support Secure Boot.

83

4.8 Boot Screen
This section displays the available devices on your system for you to configure the
boot settings and the boot priority.

Fast Boot
Fast Boot minimizes your computer's boot time. In fast mode you may not boot
from an USB storage device.

Boot From Onboard LAN
Allow the system to be waked up by the onboard LAN.

Setup Prompt Timeout
Configure the number of seconds to wait for the setup hot key.

Bootup Num-Lock
Select whether Num Lock should be turned on or off when the system boots up.

Boot Beep
English

Select whether the Boot Beep should be turned on or off when the system boots up. Please
note that a buzzer is needed.

Full Screen Logo
Enable to display the boot logo or disable to show normal POST messages.

84

B450 Steel Legend

AddOn ROM Display
Enable AddOn ROM Display to see the AddOn ROM messages or configure the
AddOn ROM if you've enabled Full Screen Logo. Disable for faster boot speed.

Above 4G Decoding
Enable or disable 64bit capable Devices to be decoded in Above 4G Address Space
(only if the system supports 64 bit PCI decoding).

CSM (Compatibility Support Module)

CSM
Enable to launch the Compatibility Support Module. Please do not disable unless
you’re running a WHCK test.

Launch PXE OpROM Policy
Select UEFI only to run those that support UEFI option ROM only. Select Legacy
only to run those that support legacy option ROM only. Select Do not launch to not
execute both legacy and UEFI option ROM.

English

Launch Storage OpROM Policy
Select UEFI only to run those that support UEFI option ROM only. Select Legacy
only to run those that support legacy option ROM only. Select Do not launch to not
execute both legacy and UEFI option ROM.

85

4.9 Exit Screen

Save Changes and Exit
When you select this option the following message, “Save configuration changes
and exit setup?” will pop out. Select [OK] to save changes and exit the UEFI SETUP
UTILITY.

Discard Changes and Exit
When you select this option the following message, “Discard changes and exit
setup?” will pop out. Select [OK] to exit the UEFI SETUP UTILITY without saving
any changes.

Discard Changes
When you select this option the following message, “Discard changes?” will pop
out. Select [OK] to discard all changes.

Load UEFI Defaults
Load UEFI default values for all options. The F9 key can be used for this operation.

Launch EFI Shell from filesystem device
English

Copy shellx64.efi to the root directory to launch EFI Shell.

86

Contact Information
If you need to contact ASRock or want to know more about ASRock, you’re welcome
to visit ASRock’s website at http://www.asrock.com; or you may contact your dealer
for further information. For technical questions, please submit a support request
form at https://event.asrock.com/tsd.asp

ASRock Incorporation
2F., No.37, Sec. 2, Jhongyang S. Rd., Beitou District,
Taipei City 112, Taiwan (R.O.C.)

ASRock EUROPE B.V.
Bijsterhuizen 11-11
6546 AR Nijmegen
The Netherlands
Phone: +31-24-345-44-33
Fax: +31-24-345-44-38

ASRock America, Inc.
13848 Magnolia Ave, Chino, CA91710
U.S.A.
Phone: +1-909-590-8308
Fax: +1-909-590-1026

DECLARATION OF CONFORMITY
Per FCC Part 2 Section 2.1077(a)

Responsible Party Name:
Address:

Phone/Fax No:

ASRock Incorporation
13848 Magnolia Ave, Chino, CA91710
+1-909-590-8308/+1-909-590-1026

hereby declares that the product
Product Name : Motherboard
Model Number : B450 Steel Legend
Conforms to the following specifications:
FCC Part 15, Subpart B, Unintentional Radiators
Supplementary Information:
This device complies with part 15 of the FCC Rules. Operation is subject to the
following two conditions: (1) This device may not cause harmful interference,
and (2) this device must accept any interference received, including interference
that may cause undesired operation.
Representative Person’s Name:

James

Signature :
Date : May 12, 2017

EU Declaration of Conformity
		

For the following equipment:
Motherboard
(Product Name)
B450 Steel Legend / ASRock
(Model Designation / Trade Name)
ASRock Incorporation
(Manufacturer Name)
2F., No.37, Sec. 2, Jhongyang S. Rd., Beitou District, Taipei City 112, Taiwan (R.O.C.)
(Manufacturer Address)
‫ ڛ‬EMC —Directive 2014/30/EU (from April 20th, 2016)
☐ EN 55022:2010/AC:2011 Class B
‫ ڛ‬EN 55024:2010/A1:2015
‫ ڛ‬EN 55032:2012+AC:2013 Class B
‫ ڛ‬EN 61000-3-3:2013
‫ ڛ‬EN 61000-3-2:2014

☐ LVD —Directive 2014/35/EU (from April 20th, 2016)
☐ EN 60950-1 : 2011+ A2: 2013

☐ EN 60950-1 : 2006/A12: 2011

‫ ڛ‬RoHS — Directive 2011/65/EU
‫ ڛ‬CE marking

(EU conformity marking)

ASRock EUROPE B.V.
(Company Name)
Bijsterhuizen 1111 6546 AR Nijmegen The Netherlands
(Company Address)
Person responsible for making this declaration:

(Name, Surname)
A.V.P
(Position / Title)
February 8, 2019
(Date)
P/N: 15G062148002AK V1.1

