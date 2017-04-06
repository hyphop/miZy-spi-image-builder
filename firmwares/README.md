==NOTE

firmware images output there in ../firmwares/

== HOST/DEVICE mmc image SD/MMC write

    dd of=/dev/mmcblk0 < orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin

== HOST mkfs & image partition

make loop     

    losetup --show -f -o 8388608 orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin
    >/dev/loop3

make fs on loop

    mkfs.vfat /dev/loop3

mount loop

    mount /dev/loop3 mnt_point

== HOST mount image partition

    mount -o offset=8388608 orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin mnt_point

== DEVICE check boot source 

if booted from sd/mmc

    cat /proc/cmdline | egrep -o bootfrom=\\w+
    > bootfrom=MMC

if booted from spi

    cat /proc/cmdline | egrep -o bootfrom=\\w+
    > bootfrom=spi

== DEVICE mount partition

    mkdir /tmp/mmc_part_1
    mount /dev/mmcblk0p1 /tmp/mmc_part_1

== CHECK hybrid image 

    file orange_pi_zero_hyphop_mizy_spi_flash_demo-8M.bin 

    orange_pi_zero_hyphop_mizy_spi_flash_demo-8M.bin: data

    dd count=1 < orange_pi_zero_hyphop_mizy_spi_flash_demo-8M.bin 2>/dev/null \
	| grep -q -o eGON.BT0 && echo "OK its hybryd image"

    OK its hybryd image


== CHECK mmc image 

    dd count=1 skip=1 < orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin 2>/dev/null | head -n 3 

    8388608                                                        
    orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin      
    miZy_spi_image_builder Thu Apr  6 16:44:12 2017 ## hyphop ##

== CHECK mmc image with partition

    file orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin 

    orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin: x86 boot sector; partition 1: \
	ID=0x83, starthead 0, startsector 16384, 16384 sectors, \
	extended partition table (last)\011, code offset 0x0

    fdisk -l orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin 

    Disk orange_pi_zero_hyphop_mizy_spi_flash_demo-8M+8192-mmc.bin: 16 MB, 16777216 bytes
    2 heads, 8 sectors/track, 2048 cylinders, total 32768 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0xdeedfeed

    Device Boot      Start         End      Blocks   Id  System
                     16384       32767        8192   83  Linux
    
